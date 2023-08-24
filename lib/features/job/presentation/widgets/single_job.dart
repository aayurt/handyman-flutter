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
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Container(
                  height: 50,
                  width: 50,
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                  child: Image.network(
                      "${AppConstants.fileUrl}${widget.job.thumbnailImage}",
                      fit: BoxFit.cover),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.job.contractor!.name ?? "",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text(
                          widget.job.title ?? "",
                          style: const TextStyle(fontSize: 14),
                        ),

                        // Text(
                        //   "Deadline Date: ${widget.job.deadlineDate}",
                        //   style:
                        //       Theme.of(context).textTheme.bodyLarge?.copyWith(),
                        // ),

                        // Text(
                        //   "Status: ",
                        //   style:
                        //       Theme.of(context).textTheme.bodyLarge?.copyWith(),
                        // ),
                        Text(
                          "${widget.job.category!.title}",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Text(
                        "£${widget.job.payRate}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      const Text(
                        "/hr",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Posted On: ${giveDate(widget.job.postingDate.toString())}",
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              )

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
            ],
          )),
    );
  }
}

String giveDate(String? datetimeString) {
  final getDate = datetimeString != null && datetimeString.isNotEmpty
      ? DateTime.parse(datetimeString)
      : DateTime.now();

  String convertedDate =
      "${getDate.year.toString()}-${getDate.month.toString().padLeft(2, '0')}-${getDate.day.toString().padLeft(2, '0')}";

  return convertedDate;
}
