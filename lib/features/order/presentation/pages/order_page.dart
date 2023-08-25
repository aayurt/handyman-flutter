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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  height: height,
                  padding: const EdgeInsets.all(5),
                  child: const ListAllOrder()),
            ],
          ),
        ),
      ),
    );
  }
}
