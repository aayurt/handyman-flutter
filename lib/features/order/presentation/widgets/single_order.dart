import 'package:go_router/go_router.dart';
import 'package:handyman/core/widgets/card/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:handyman/features/order/data/models/application_model.dart';
import 'package:handyman/routes/routes_constant.dart';

import '../../../../core/constants/constants.dart';

class SingleOrder extends StatefulHookWidget {
  final ApplicationModel application;
  const SingleOrder(
    this.application, {
    Key? key,
  }) : super(key: key);

  @override
  State<SingleOrder> createState() => _SingleOrderState();
}

class _SingleOrderState extends State<SingleOrder> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          {context.go("${RoutesConstant.jobOrder}/${widget.application.id}")},
      child: CustomCardWidget(
          boxShadow: const BoxShadow(),
          children: Row(
            children: [
              SizedBox(
                  width: 150,
                  child: Image.network(
                      "${AppConstants.fileUrl}${widget.application.listing!.thumbnailImage}",
                      fit: BoxFit.cover)),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        widget.application.listing!.title ?? "",
                        textAlign: TextAlign.left,
                        style:
                            Theme.of(context).textTheme.bodyLarge?.copyWith(),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Posting Date: ${widget.application.listing!.postingDate}",
                        style:
                            Theme.of(context).textTheme.bodyLarge?.copyWith(),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Deadline Date: ${widget.application.listing!.deadlineDate}",
                        style:
                            Theme.of(context).textTheme.bodyLarge?.copyWith(),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Pay Rate: ${widget.application.listing!.payRate}",
                        style:
                            Theme.of(context).textTheme.bodyLarge?.copyWith(),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Status: ${widget.application.status}",
                        style:
                            Theme.of(context).textTheme.bodyLarge?.copyWith(),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Category: ${widget.application.listing!.category!.title}",
                        style:
                            Theme.of(context).textTheme.bodyLarge?.copyWith(),
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              // const Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Text(
              //       "£ 1111",
              //       style: TextStyle(fontSize: 22),
              //     ),
              //     Icon(
              //       Icons.arrow_upward,
              //       color: Colors.greenAccent,
              //     )
              //   ],
              // ),
              const SizedBox(
                width: 10,
              )
            ],
          )),
    );
  }
}

String giveDateTime(String? datetimeString) {
  final getDate = datetimeString!.isNotEmpty
      ? DateTime.parse(datetimeString)
      : DateTime.now();
  String convertedDateTime =
      "${getDate.year.toString()}-${getDate.month.toString().padLeft(2, '0')}-${getDate.day.toString().padLeft(2, '0')} ${getDate.hour.toString().padLeft(2, '0')}-${getDate.minute.toString().padLeft(2, '0')}";
  return convertedDateTime;
}
