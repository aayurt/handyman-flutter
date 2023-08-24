import 'package:handyman/features/order/presentation/widgets/list_all_order.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
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
                "All Cart List",
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
