import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:handyman/features/job/presentation/bloc/single_job/single_job_bloc.dart';

import '../../../../routes/routes_constant.dart';
import '../../data/models/job_model.dart';
import '../widgets/job_form_widget.dart'
    if (dart.library.js) '../widgets/job_form_widget_web.dart';

class JobAddPage extends StatefulWidget {
  final String? id;
  const JobAddPage({Key? key, this.id}) : super(key: key);

  @override
  _JobAddPageState createState() => _JobAddPageState();
}

class _JobAddPageState extends State<JobAddPage> {
  @override
  void initState() {
    if (widget.id != null && widget.id!.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        context
            .read<SingleJobBloc>()
            .add(SingleJobEvent.get(id: widget.id ?? ""));
      });
    } else {
      context.read<SingleJobBloc>().add(SingleJobEvent.getEmpty());
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
                      context.go(RoutesConstant.jobs);
                    },
                    child: const Icon(Icons.arrow_back))),
            const Expanded(
              child: Text(
                "Your Job",
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
              constraints: BoxConstraints(
                  maxHeight:
                      height - MediaQuery.of(context).viewInsets.bottom - 100,
                  maxWidth: width - 32),
              child: Expanded(child: BlocBuilder<SingleJobBloc, SingleJobState>(
                builder: (context, state) {
                  if (state is SingleJobStateInitial) {
                    return const JobFormWidget();
                  } else if (state is SingleJobStateLoaded) {
                    JobModel job = state.job;
                    return JobFormWidget(job: job);
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
