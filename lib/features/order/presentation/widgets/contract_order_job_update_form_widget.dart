import 'package:handyman/core/constants/constants.dart';
import 'package:handyman/core/ee.dart';
import 'package:handyman/core/network/api_list.dart';
import 'package:handyman/core/network/api_service.dart';
import 'package:handyman/core/widgets/alerts/custom_alert.dart';
import 'package:handyman/features/job/presentation/widgets/time_selection_widget.dart';
import 'package:handyman/features/order/data/models/application_model.dart';
import 'package:handyman/routes/routes_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

final _formKey = GlobalKey<FormState>();

class ContractOrderJobUpdateFormWidget extends StatefulHookWidget {
  final ApplicationModel? application;
  const ContractOrderJobUpdateFormWidget({Key? key, this.application})
      : super(key: key);

  @override
  _ContractOrderJobUpdateFormWidgetState createState() =>
      _ContractOrderJobUpdateFormWidgetState();
}

class _ContractOrderJobUpdateFormWidgetState
    extends State<ContractOrderJobUpdateFormWidget> {
  final titleController = TextEditingController();
  Map<DateTime, List<String>> selectedTimeSlots = {};
  String statusValue = 'pending'; // Default selected value
  Color statusColor = Colors.transparent; // Default selected value
  String paymentStatusValue = 'unpaid'; // Default selected value

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

  final DateTime _focusedDay = DateTime.now();
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
    // TODO: implement initState
    super.initState();
    if (widget.application != null) {
      titleController.text = widget.application!.listing!.title ?? "";

      setState(() {
        statusValue = widget.application!.status ?? "pending";
        paymentStatusValue = widget.application!.paymentStatus ?? "unpaid";
        payRate = widget.application!.listing!.payRate ?? 10;
        selectedTimeSlots = widget.application!.selectedTimeSlots!.entries
            .fold<Map<DateTime, List<String>>>(
          {},
          (previousValue, entry) {
            DateTime dateTime =
                DateFormat('MM/dd/yyyy').parse(entry.key).toLocal();

            if (!selectedDates.contains(dateTime)) {
              selectedDates.add(dateTime);
              _selectedEvents[dateTime] = [
                'Event 1'
              ]; // Associate 'Event 1' with the date
            }

            previousValue[dateTime] = entry.value;
            return previousValue;
          },
        );
        _rangeEndDate =
            widget.application!.listing!.deadlineDate ?? DateTime.now();
      });

      imageUrl = widget.application!.listing!.thumbnailImage ?? "";
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

        if (widget.application != null) {
          try {
            final response = await request.put(
                ApiEndpoint(baseUrl,
                    "${ApiList.application}/${widget.application!.id}", {}),
                data: {
                  // "listingId": widget.application!.listing!.id ?? "",
                  // "selectedTimeSlots": jsonTimeSlots,
                  "status": statusValue,
                  "upaymentStatus": paymentStatusValue
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
                Container(
                  padding: const EdgeInsets.all(15),
                  width: double.infinity,
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
                                      60) // Placeholder icon when no image is selected
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
                              widget.application!.listing!.contractor!.name ??
                                  "",
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              widget.application!.listing!.title ?? "",
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              widget.application!.listing!.category!.title ??
                                  "",
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: statusColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: DropdownButton<String>(
                              underline: const SizedBox(),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              value: statusValue,
                              onChanged: (newValue) {
                                setState(() {
                                  statusValue = newValue ?? "";
                                  statusColor = _getStatusColor(
                                    newValue!,
                                  );
                                });
                              },
                              items: <String>[
                                'pending',
                                'accepted',
                                'completed',
                                'cancelled'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text(
                                "£${widget.application!.listing!.payRate}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color:
                                        Theme.of(context).colorScheme.primary),
                              ),
                              const Text(
                                "/hr",
                                style:
                                    TextStyle(fontSize: 12, color: Colors.grey),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
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
                    // onDaySelected: (selectedDate, focusedDay) {
                    //   if (widget.application!.status == "pending") {
                    //     setState(() {
                    //       var test1 = DateTime.parse(selectedDate.toString()).toUtc();
                    //       var test2 = DateFormat("MM/dd/yyyy").format(test1);
                    //       var newSelectedDay =
                    //           DateFormat('MM/dd/yyyy').parse(test2).toLocal();
                    //       if (newSelectedDay.isAfter(_rangeStartDate) &&
                    //           newSelectedDay.isBefore(_rangeEndDate)) {
                    //         if (selectedDates.contains(newSelectedDay)) {
                    //           _selectedEvents[newSelectedDay] = [];
                    //           selectedDates.remove(newSelectedDay);
                    //         } else {
                    //           selectedDates.add(newSelectedDay);
                    //           for (var date in selectedDates) {
                    //             _selectedEvents[date] = [
                    //               'Event 1',
                    //             ];
                    //           }
                    //         }
                    //       }
                    //     });
                    //   }
                    // },
                    eventLoader: (date) {
                      var test1 = DateTime.parse(date.toString()).toUtc();
                      var test2 = DateFormat("MM/dd/yyyy").format(test1);
                      var newSelectedDay =
                          DateFormat('MM/dd/yyyy').parse(test2).toLocal();
                      return _selectedEvents[newSelectedDay] ?? [];
                    },
                    onPageChanged: (focusedDay) {},
                  ),
                ),
                const SizedBox(height: 16),
                selectedDates.isNotEmpty
                    ? const Text("Choose available timeslot")
                    : const SizedBox(),
                const SizedBox(height: 16),
                TimeSelectionWidget(
                    dateList: selectedDates,
                    selectedTimeSlots: selectedTimeSlots,
                    setSelectedTimeSlots: (val) {
                      setState(() {
                        selectedTimeSlots = val;
                      });
                    },
                    editable: widget.application!.status == "pending"),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    const Text('Select payment status:'),
                    const SizedBox(
                      width: 10,
                    ),
                    DropdownButton<String>(
                      value: paymentStatusValue,
                      onChanged: (newValue) {
                        setState(() {
                          paymentStatusValue = newValue ?? "";
                        });
                      },
                      items: <String>[
                        'unpaid',
                        'paid',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 16.0,
            right: 16.0,
            child: FloatingActionButton(
              onPressed: () {
                // Add your FAB onPressed logic here
                onSaveButton(context);
              },
              child: const Icon(Icons.save_outlined),
            ),
          ),
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

Color _getStatusColor(String status) {
  switch (status) {
    case "pending":
      return Colors.yellow;
    case "accepted":
      return const Color(0xFFEF8D32);
    case "completed":
      return const Color(0xFF0F9686);
    case "cancelled":
      return const Color(0xFFEB3F3F);
    default:
      return Colors
          .grey; // Default color if status doesn't match any of the above
  }
}
