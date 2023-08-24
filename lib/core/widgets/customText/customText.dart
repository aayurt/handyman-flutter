import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final Widget child;
  const CustomText({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: child,
    );
  }
}
