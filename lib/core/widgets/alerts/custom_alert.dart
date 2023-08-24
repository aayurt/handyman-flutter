import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/files.dart';

enum AlertType { success, danger, info, passwordMustInclude }

class CustomAlert extends StatelessWidget {
  final AlertType type;
  final String msg;
  final bool dimissable;
  final Function? onAlertCloseTap;

  const CustomAlert({
    Key? key,
    required this.type,
    this.msg = "",
    this.dimissable = false,
    this.onAlertCloseTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (type == AlertType.danger) {
      return _buildAlert(
          alertIcon: SvgPicture.asset(
            MyAssets.errorFilled,
          ),
          bgColor: Colors.redAccent,
          msg: msg,
          context: context,
          titleText: "Error: ",
          dimissable: dimissable,
          onAlertCloseTap: onAlertCloseTap);
    } else if (type == AlertType.success) {
      return _buildAlert(
          alertIcon: SvgPicture.asset(
            MyAssets.checkmarkFilled,
          ),
          bgColor: Colors.lightGreen,
          msg: msg,
          context: context,
          dimissable: dimissable,
          onAlertCloseTap: onAlertCloseTap,
          titleText: "Success: ");
    } else if (type == AlertType.passwordMustInclude) {
      return _buildAlert(
          alertIcon: SvgPicture.asset(
            MyAssets.informationFilled,
          ),
          bgColor: Colors.lightBlue,
          msg: msg,
          context: context,
          dimissable: dimissable,
          onAlertCloseTap: onAlertCloseTap,
          titleText: "Pass: ");
    } else {
      return _buildAlert(
          alertIcon: SvgPicture.asset(
            MyAssets.informationFilled,
          ),
          bgColor: Colors.lightBlue,
          msg: msg,
          context: context,
          dimissable: dimissable,
          onAlertCloseTap: onAlertCloseTap,
          titleText: "Info: ");
    }
  }
}

_buildAlert(
    {required Widget alertIcon,
    required Color bgColor,
    msg,
    context,
    required bool dimissable,
    required String titleText,
    onAlertCloseTap}) {
  return Container(
    width: double.infinity,
    padding:
        const EdgeInsets.only(top: 12.0, bottom: 12.0, left: 16, right: 16),
    decoration: BoxDecoration(
      color: bgColor,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          child: Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [alertIcon],
            ),
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(children: [
                    TextSpan(
                        text: titleText,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600, color: Colors.grey)),
                    TextSpan(
                        text: msg,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: Colors.grey)),
                  ]))
            ],
          ),
        ),
        dimissable
            ? GestureDetector(
                onTap: () {
                  onAlertCloseTap();
                },
                child: const Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Icon(
                    Icons.clear,
                    color: Colors.grey,
                    size: 16,
                  ),
                ),
              )
            : const SizedBox(),
      ],
    ),
  );
}
