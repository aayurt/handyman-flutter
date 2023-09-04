import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:handyman/core/constants/constants.dart';
import 'package:handyman/core/ee.dart';
import 'package:handyman/core/network/api_list.dart';
import 'package:handyman/core/network/api_service.dart';
import 'package:handyman/core/widgets/alerts/custom_alert.dart';
import 'package:handyman/features/job/data/models/job_model.dart';
import 'package:handyman/features/job/data/models/job_rating_model.dart';
import 'package:handyman/features/job/presentation/widgets/time_selection_widget.dart';
import 'package:handyman/routes/routes_constant.dart';
import 'package:table_calendar/table_calendar.dart';

final _formKey = GlobalKey<FormState>();

class OrderJobFormWidget extends StatefulHookWidget {
  final JobModel? job;
  const OrderJobFormWidget({Key? key, this.job}) : super(key: key);

  @override
  _OrderJobFormWidgetState createState() => _OrderJobFormWidgetState();
}

class _OrderJobFormWidgetState extends State<OrderJobFormWidget> {
  final titleController = TextEditingController();
  Map<DateTime, List<String>> selectedTimeSlots = {};
  double payRate = 10.0; // Default pay rate
  final double increment = 1.0;
  final TextEditingController _payRateController = TextEditingController();
  String imageUrl = "";

  void incrementPayRate() {
    setState(() {
      payRate = payRate + increment;
    });
    _payRateController.text = payRate.toString();
  }

  void decrementPayRate() {
    setState(() {
      if (payRate - increment >= 0) {
        payRate -= increment;
      }
    });
    _payRateController.text = payRate.toString();
  }

  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  final Map<DateTime, List> _selectedEvents = {};
  List<DateTime> selectedDates = [];

  final DateTime _rangeStartDate = DateTime.now();
  DateTime _rangeEndDate = DateTime.now();
  void updatePayRate(String newPayRate) {
    setState(() {
      payRate = double.tryParse(newPayRate) ?? payRate;
    });
  }

  @override
  void initState() {
    super.initState();
    if (widget.job != null) {
      titleController.text = widget.job!.title ?? "";
      setState(() {
        payRate = widget.job!.payRate ?? 10;
        _selectedDay = widget.job!.deadlineDate ?? DateTime.now();
        _rangeEndDate = widget.job!.deadlineDate ?? DateTime.now();
      });
      imageUrl = widget.job!.thumbnailImage ?? "";
    } else {
      setState(() {
        payRate = 10;
      });
    }
    _payRateController.text = payRate.toString();
  }

  @override
  Widget build(BuildContext context) {
    final alertMsg = useState<String>("");
    final alertMsgStatus = useState<bool>(false);
    final alertType = useState<AlertType>(AlertType.info);

    void onSaveButton(BuildContext context) async {
      if (_formKey.currentState!.validate()) {
        final String baseUrl = AppConstants.baseUrl;
        final ApiService request = ApiService();

        Map<String, dynamic> jsonTimeSlots = {};

        selectedTimeSlots.forEach((date, slots) {
          jsonTimeSlots[date.toString()] = slots;
        });

        if (widget.job != null) {
          try {
            final response = await request
                .post(ApiEndpoint(baseUrl, ApiList.application, {}), data: {
              "listingId": widget.job!.id ?? "",
              "selectedTimeSlots": jsonTimeSlots,
            });

            if (response.statusCode == 400) {
              final check = ServerErrorModel.fromJson(response.data[0]);
              if (check.message!.isNotEmpty) {
                alertMsg.value = check.message ?? "";
                alertType.value = AlertType.danger;
                alertMsgStatus.value = true;
              }
            } else {
              showSuccess(context);
            }
          } catch (e) {
            print(e);
          }
        }

        // GoRouter.of(context).go(RoutesConstant.home);
      }
    }

    int getTotalTimeSlots(Map<DateTime, List<String>> timeSlotsMap) {
      int total = 0;
      for (var timeSlotsList in timeSlotsMap.values) {
        total += timeSlotsList.length;
      }
      return total;
    }

    double totalVal() {
      int totalSlots = getTotalTimeSlots(selectedTimeSlots);
      return payRate * totalSlots;
    }

    return Form(
      key: _formKey,
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                alertMsgStatus.value
                    ? Container(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: CustomAlert(
                            type: alertType.value,
                            msg: alertMsg.value,
                            dimissable: false,
                            onAlertCloseTap: () {
                              alertMsgStatus.value = false;
                            }))
                    : const SizedBox(
                        height: 0,
                      ),
                InkWell(
                  onTap: (() {
                    showModalBottomSheet(
                        context: context,
                        builder: ((builderContext) {
                          return SizedBox(
                            height: MediaQuery.of(context).size.height * 0.8,
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                              50), // Set your desired radius
                                          child: Container(
                                            color: Colors.grey,
                                            width:
                                                80, // Double the radius to maintain the circular shape
                                            height: 80,
                                            child: imageUrl.isEmpty
                                                ? const Icon(Icons.person,
                                                    size:
                                                        80) // Placeholder icon when no image is selected
                                                : Image.network(
                                                    "${AppConstants.fileUrl}$imageUrl",
                                                    fit: BoxFit.cover),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      widget.job!.contractor!.name ?? "",
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    // const SizedBox(
                                    //   height: 20,
                                    // ),
                                    // Text(
                                    //   widget.job!.contractor!.bio ?? "",
                                    //   style: const TextStyle(
                                    //     fontSize: 12,
                                    //   ),
                                    // ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.location_on,
                                          size: 14,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          widget.job!.contractor!.address ?? "",
                                          style: const TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.local_phone,
                                          size: 14,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          widget.job!.contractor!.phone ?? "",
                                          style: const TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: 1,
                                      color: Colors.grey,
                                    ),

                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      "Ratings & Feedback",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    // Text(
                                    //   "${widget.job!.rating ?? "Not yet rated."}",
                                    //   style: const TextStyle(
                                    //     fontSize: 12,
                                    //   ),
                                    // ),
                                    RatingContractorWidget(
                                        applicationId: widget.job!.id ?? "")
                                  ],
                                ),
                              ),
                            ),
                          );
                        }));
                  }),
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 1,
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withOpacity(0.5),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(
                              50), // Set your desired radius
                          child: Container(
                            color: Colors.grey,
                            width:
                                60, // Double the radius to maintain the circular shape
                            height: 60,
                            child: imageUrl.isEmpty
                                ? const Icon(Icons.person,
                                    size:
                                        80) // Placeholder icon when no image is selected
                                : Image.network(
                                    "${AppConstants.fileUrl}$imageUrl",
                                    fit: BoxFit.cover),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.job!.contractor!.name ?? "",
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                widget.job!.title ?? "",
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                widget.job!.category!.title ?? "",
                                style: const TextStyle(fontSize: 12),
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
                                  "£${widget.job!.payRate}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                ),
                                const Text(
                                  "/hr",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                ),
                                IconButton(
                                    onPressed: () {
                                      context.go(
                                          "${RoutesConstant.chat}/${widget.job!.contractor!.id}");
                                    },
                                    icon: const Icon(Icons.chat))
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Scheduled Date",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 1,
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(0.5),
                    ),
                  ),
                  child: TableCalendar(
                    daysOfWeekStyle: const DaysOfWeekStyle(
                        weekdayStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                    )),
                    calendarStyle: CalendarStyle(
                        rangeStartDecoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).colorScheme.primary),
                        rangeEndDecoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).colorScheme.primary),
                        markerSize: 15,
                        rangeHighlightColor: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.4),
                        markerDecoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).colorScheme.surface)),
                    headerStyle: HeaderStyle(
                        formatButtonVisible: false,
                        formatButtonDecoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurface
                                  .withOpacity(0.5),
                            ),
                            borderRadius: BorderRadius.circular(15)),
                        formatButtonPadding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10)),
                    focusedDay: _focusedDay,
                    firstDay: DateTime(2000),
                    lastDay: DateTime(2050),
                    rangeStartDay: _rangeStartDate,
                    rangeEndDay: _rangeEndDate,
                    onDaySelected: (selectedDate, focusedDay) {
                      // Collect all the dates within the range
                      if (selectedDate.isAfter(_rangeStartDate) &&
                          selectedDate.isBefore(_rangeEndDate)) {
                        if (selectedDates.contains(selectedDate)) {
                          _selectedEvents[selectedDate] = [];
                          selectedDates.remove(selectedDate);
                        } else {
                          selectedDates.add(selectedDate);
                          for (var date in selectedDates) {
                            _selectedEvents[date] = [
                              'Event 1',
                            ];
                          }
                        }
                        _focusedDay = selectedDate;
                        setState(() {});
                      }
                    },
                    eventLoader: (date) => _selectedEvents[date] ?? [],
                    onPageChanged: (focusedDay) {},
                  ),
                ),
                const SizedBox(height: 10),
                selectedDates.isNotEmpty
                    ? const Text(
                        "Choose available timeslot",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      )
                    : const SizedBox(),
                const SizedBox(height: 16),
                TimeSelectionWidget(
                    dateList: selectedDates,
                    selectedTimeSlots: selectedTimeSlots,
                    setSelectedTimeSlots: (val) {
                      setState(() {
                        selectedTimeSlots = val;
                      });
                    }),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Text(
                      "Total: ",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "£${totalVal()}",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                // Text("Total Price: ${totalVal()}"),
                Row(
                  children: [
                    Expanded(
                      flex: 6,
                      child: ElevatedButton(
                        onPressed: () {
                          _onCancelButtonPressed(context);
                        },
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            backgroundColor:
                                Theme.of(context).colorScheme.error),
                        child: const Text("Cancel"),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 6,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              backgroundColor:
                                  Theme.of(context).colorScheme.primary),
                          onPressed: () {
                            onSaveButton(context);
                          },
                          child: const Text("Apply")),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
          // Positioned(
          //   bottom: 16.0,
          //   right: 16.0,
          //   child: FloatingActionButton(
          //     onPressed: () {
          //       // Add your FAB onPressed logic here
          //       onSaveButton(context);
          //     },
          //     backgroundColor: Colors.blue,
          //     child: const Icon(Icons.save_outlined),
          //   ),
          // ),
        ],
      ),
    );
  }
}

_validateFirsttitle(String value) {
  if (value.isEmpty) {
    return "Please enter first title";
  }

  return null;
}

_onCancelButtonPressed(BuildContext context) {
  GoRouter.of(context).go(RoutesConstant.login);
}

showSuccess(context) {
  showAdaptiveDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Success'),
        content: const Text('Successfully saved'),
        actions: <Widget>[
          TextButton(
            child: const Text('Save'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

class RatingContractorWidget extends StatefulWidget {
  final String applicationId;
  const RatingContractorWidget({Key? key, required this.applicationId})
      : super(key: key);

  @override
  _RatingContractorWidgetState createState() => _RatingContractorWidgetState();
}

class _RatingContractorWidgetState extends State<RatingContractorWidget> {
  List<JobRatingModel> myRatings = [];
  @override
  void initState() {
    // TODO: implement initState

    Future.delayed(const Duration(milliseconds: 0), () async {
      try {
        final ApiService request = ApiService();
        final response = await request.get(
          ApiEndpoint(AppConstants.baseUrl,
              "${ApiList.ratingApplications}/${widget.applicationId}", {}),
        );
        if (response.data != null && response.data["ratings"] != null) {
          if (mounted) {
            final List jobRatings = response.data["ratings"];
            if (jobRatings.isNotEmpty) {
              final List<JobRatingModel> jobRatingmodel = jobRatings.map(
                (e) {
                  return JobRatingModel.fromJson(e);
                },
              ).toList();
              setState(() {
                myRatings = jobRatingmodel;
              });
            }
          }
        }
      } on Exception {
        print("here is error");
        // rethrow;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: myRatings.length,
        shrinkWrap: true,
        itemBuilder: ((context, index) {
          JobRatingModel myRating = myRatings[index];
          return Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(15),
                color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(myRating.customerId!.name ?? ""),
                      const SizedBox(
                        width: 10,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(5, (index) {
                          if (index < myRating.value!.round()) {
                            return InkWell(
                              onTap: (() {
                                // setRating(index + 1);
                              }),
                              child: const Icon(
                                Icons.star,
                                size: 14,
                                color: Colors.amber,
                              ),
                            );
                          } else {
                            return InkWell(
                              onTap: (() {}),
                              child: const Icon(
                                Icons.star_border,
                                size: 14,
                                color: Colors.amber,
                              ),
                            );
                          }
                        }),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    myRating.note ?? "",
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ));
        }));
  }
}
