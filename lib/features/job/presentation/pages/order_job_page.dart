import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:handyman/features/job/presentation/bloc/single_job/single_job_bloc.dart';

import '../../../../routes/routes_constant.dart';
import '../../data/models/job_model.dart';
import '../widgets/order_job_form_widget.dart';

class OrderJobPage extends StatefulWidget {
  final String? id;
  const OrderJobPage({Key? key, this.id}) : super(key: key);

  @override
  _OrderJobPageState createState() => _OrderJobPageState();
}

class _OrderJobPageState extends State<OrderJobPage> {
  @override
  void initState() {
    if (widget.id!.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        context
            .read<SingleJobBloc>()
            .add(SingleJobEvent.get(id: widget.id ?? ""));
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Scaffold(
      body: SafeArea(
          child: Column(children: [
        Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            SizedBox(
                height: 25,
                width: 25,
                child: GestureDetector(
                    onTap: () {
                      context.go(RoutesConstant.dashboard);
                    },
                    child: const Icon(Icons.arrow_back))),
            const Expanded(
              child: Text(
                "Add job listing",
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              width: 25,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0, left: 16, right: 16),
          child: ConstrainedBox(
              constraints:
                  BoxConstraints(maxHeight: height - 140, maxWidth: width - 32),
              child: Expanded(child: BlocBuilder<SingleJobBloc, SingleJobState>(
                builder: (context, state) {
                  if (state is SingleJobStateInitial) {
                    return const SizedBox();
                  } else if (state is SingleJobStateLoaded) {
                    JobModel job = state.job;
                    return OrderJobFormWidget(job: job);
                  } else if (state is SingleJobStateLoading) {
                    return const CircularProgressIndicator();
                  } else {
                    return const Text("Error");
                  }
                },
              ))),
        ),
      ])),
    );
  }
}
