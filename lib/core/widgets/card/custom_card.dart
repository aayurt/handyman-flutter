
import 'package:flutter/material.dart';

class CustomCardWidget extends StatelessWidget {
  final Widget children;
  final double circular;
  final double opacity;
  final Border? border;
  final BoxShadow? boxShadow;
  const CustomCardWidget({
    Key? key,
    required this.children,
    this.circular = 15.0,
    this.opacity = 0.3,
    this.boxShadow,
    this.border,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(circular),
          boxShadow: [
            boxShadow ??
                BoxShadow(
                  color: Colors.grey.withOpacity(opacity),
                  blurRadius: 12,
                  spreadRadius: 2.5,
                ),
          ],
          border: Border.all(
            width: .5,
            color: const Color(0xFFd2d2d7),
          )),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(circular), child: children),
    );
  }
}
