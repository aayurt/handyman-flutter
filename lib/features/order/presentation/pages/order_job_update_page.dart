import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:handyman/features/order/data/models/application_model.dart';

import '../../../../core/shared_pref/shared_pref.dart';
import '../../../../routes/routes_constant.dart';
import '../bloc/single_application/single_application_bloc.dart';
import '../widgets/contract_order_job_update_form_widget.dart';
import '../widgets/order_job_update_form_widget.dart';

class OrderJobUpdatePage extends StatefulWidget {
  final String? id;

  const OrderJobUpdatePage({Key? key, this.id}) : super(key: key);

  @override
  _OrderJobUpdatePageState createState() => _OrderJobUpdatePageState();
}

class _OrderJobUpdatePageState extends State<OrderJobUpdatePage> {
  String userType = "";
  @override
  void initState() {
    if (widget.id!.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        final userTypeTemp =
            await SharedPrefService.getToken(SharedPrefKey.userType);
        setState(() {
          userType = userTypeTemp;
        });
        context
            .read<SingleApplicationBloc>()
            .add(SingleApplicationEvent.get(id: widget.id ?? ""));
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
      resizeToAvoidBottomInset: true,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(
            height: 10,
          ),
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
                        context.go(RoutesConstant.orders);
                      },
                      child: const Icon(Icons.arrow_back))),
              const Expanded(
                child: Text(
                  "My Orders",
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
                constraints: BoxConstraints(
                    maxHeight: height - 140, maxWidth: width - 32),
                child: Expanded(child:
                    BlocBuilder<SingleApplicationBloc, SingleApplicationState>(
                  builder: (context, state) {
                    if (state is SingleApplicationStateInitial) {
                      return const SizedBox();
                    } else if (state is SingleApplicationStateLoaded) {
                      ApplicationModel application = state.application;
                      return userType == "Contractor"
                          ? ContractOrderJobUpdateFormWidget(
                              application: application)
                          : OrderJobUpdateFormWidget(application: application);
                    } else if (state is SingleApplicationStateLoading) {
                      return const CircularProgressIndicator();
                    } else {
                      return const Text("Error");
                    }
                  },
                ))),
          ),
        ]),
      )),
    );
  }
}
