import 'package:go_router/go_router.dart';
import 'package:handyman/core/shared_pref/shared_pref.dart';
import 'package:handyman/core/widgets/card/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:handyman/features/job/data/models/job_model.dart';
import 'package:handyman/routes/routes_constant.dart';

import '../../../../core/constants/constants.dart';

class SingleJob extends StatefulHookWidget {
  final JobModel job;
  const SingleJob({
    Key? key,
    required this.job,
  }) : super(key: key);

  @override
  State<SingleJob> createState() => _SingleJobState();
}

class _SingleJobState extends State<SingleJob> {
  String userType = "";
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      var usertype = await SharedPrefService.getToken(SharedPrefKey.userType);
      if (usertype.isNotEmpty) {
        setState(() {
          userType = usertype;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        userType == "Customer"
            ? context.go("${RoutesConstant.orders}/${widget.job.id}")
            : context.go("${RoutesConstant.job}/${widget.job.id}");
      },
      child: CustomCardWidget(
          boxShadow: const BoxShadow(),
          children: Row(
            children: [
              SizedBox(
                  width: 150,
                  child: Image.network(
                      "${AppConstants.fileUrl}${widget.job.thumbnailImage}",
                      fit: BoxFit.cover)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        widget.job.contractor!.name ?? "",
                        textAlign: TextAlign.left,
                        style:
                            Theme.of(context).textTheme.bodyLarge?.copyWith(),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        widget.job.title ?? "",
                        textAlign: TextAlign.left,
                        style:
                            Theme.of(context).textTheme.bodyLarge?.copyWith(),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Posting Date: ${widget.job.postingDate}",
                        style:
                            Theme.of(context).textTheme.bodyLarge?.copyWith(),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Deadline Date: ${widget.job.deadlineDate}",
                        style:
                            Theme.of(context).textTheme.bodyLarge?.copyWith(),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Pay Rate: ${widget.job.payRate}",
                        style:
                            Theme.of(context).textTheme.bodyLarge?.copyWith(),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Status: ",
                        style:
                            Theme.of(context).textTheme.bodyLarge?.copyWith(),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Category: ${widget.job.category!.title}",
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
