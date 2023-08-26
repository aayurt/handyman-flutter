import 'package:flutter/material.dart';

enum CustomGhostButtonType { danger, success, info }

class CustomGhostMob extends StatelessWidget {
  final String labelText;
  final VoidCallback? onPressed;
  final String? icon;
  final double? width;
  final double height;
  final TextStyle? style;
  final CustomGhostButtonType? buttonType;
  const CustomGhostMob(
      {Key? key,
      required this.labelText,
      required this.onPressed,
      this.icon,
      this.width,
      this.style,
      this.height = 60,
      this.buttonType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color buttonTypeColor;
    if (buttonType == CustomGhostButtonType.danger) {
      buttonTypeColor = Colors.red;
    } else if (buttonType == CustomGhostButtonType.success) {
      buttonTypeColor = Colors.green;
    } else {
      // buttonTypeColor = CarbonColors.gray70;
      buttonTypeColor = Colors.blue;
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: double.infinity,
          height: height,
          child: TextButton(
            onPressed: onPressed,
            style: TextButton.styleFrom(
              foregroundColor: buttonTypeColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    constraints: const BoxConstraints(maxWidth: 120),
                    child: Text(labelText)),
                const SizedBox(
                  width: 10,
                ),
                if (icon != null)
                  Image.asset(
                    icon ?? "",
                    width: 16,
                    height: 16,
                  )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
