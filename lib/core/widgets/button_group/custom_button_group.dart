import 'package:flutter/material.dart';

class CustomButtonGroup extends StatelessWidget {
  final Widget btn1;
  final Widget? btn2;
  final int flex1;
  final int? flex2;
  const CustomButtonGroup(
      {Key? key, required this.btn1, this.btn2, this.flex1 = 6, this.flex2 = 6})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        height: 1.2,
        width: double.infinity,
        color: Colors.grey.withOpacity(0.50),
      ),
      Row(
        children: [
          Expanded(
            flex: flex1,
            child: Container(
              decoration: BoxDecoration(
                  border: Border(
                right:
                    BorderSide(color: Colors.grey.withOpacity(0.9), width: 0.5),
              )),
              child: btn1,
            ),
          ),
          if (flex2 != null && btn2 != null)
            Expanded(
              flex: flex2 ?? 1,
              child: btn2 ?? const SizedBox(),
            )
          else
            const SizedBox(),
        ],
      ),
    ]);
  }
}
