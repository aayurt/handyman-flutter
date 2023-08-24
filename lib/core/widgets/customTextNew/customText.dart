import 'package:flutter/material.dart';

class CustomTextNew extends StatelessWidget {
  final List<Widget> children;
  const CustomTextNew({Key? key, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Column(children: children),
    );
  }
}
