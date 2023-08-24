import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handyman/features/order/data/models/application_model.dart';
import 'package:handyman/features/order/presentation/widgets/single_order.dart';

import '../bloc/order_bloc.dart';

class ListAllOrder extends StatefulWidget {
  const ListAllOrder({
    Key? key,
  }) : super(key: key);

  @override
  _ListAllOrderState createState() => _ListAllOrderState();
}

class _ListAllOrderState extends State<ListAllOrder> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    return BlocBuilder<OrderBloc, OrderState>(
      builder: (context, state) {
        if (state is OrderStateLoading) {
          return const CircularProgressIndicator();
        } else if (state is OrderStateLoaded) {
          final List<ApplicationModel> dataList = state.applications;
          if (dataList.isEmpty) return const Text("No data found.");
          return ListView.builder(
            physics: const ClampingScrollPhysics(),
            itemCount: dataList.length,
            itemBuilder: (BuildContext context, int index) {
              var application = dataList[index];
              return Padding(
                padding: EdgeInsets.only(top: index != 0 ? 12.0 : 0),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                        height: 150,
                        width: width - 32,
                        child: SingleOrder(application))
                  ],
                ),
              );
            },
          );
        } else {
          return const Text("Error");
        }
      },
    );
  }
}
