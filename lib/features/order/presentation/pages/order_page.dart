import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handyman/features/order/presentation/widgets/list_all_order.dart';
import 'package:flutter/material.dart';

import '../bloc/order_bloc.dart';

class OrderListPage extends StatefulWidget {
  const OrderListPage({Key? key}) : super(key: key);

  @override
  _OrderListPageState createState() => _OrderListPageState();
}

class _OrderListPageState extends State<OrderListPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      context.read<OrderBloc>().add(const OrderEvent.get());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(children: [
        const Row(
          children: [
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Text(
                "Order List",
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              width: 25,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0, left: 16, right: 16),
          child: ConstrainedBox(
              constraints:
                  BoxConstraints(maxHeight: height - 140, maxWidth: width - 32),
              child: const Expanded(child: ListAllOrder())),
        ),
      ])),
    );
  }
}
