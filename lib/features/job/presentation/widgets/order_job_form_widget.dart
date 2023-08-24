import 'package:handyman/core/constants/constants.dart';
import 'package:handyman/core/ee.dart';
import 'package:handyman/core/network/api_list.dart';
import 'package:handyman/core/network/api_service.dart';
import 'package:handyman/core/widgets/alerts/custom_alert.dart';
import 'package:handyman/features/job/data/models/job_model.dart';
import 'package:handyman/features/job/presentation/widgets/time_selection_widget.dart';
import 'package:handyman/routes/routes_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
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
                Text(widget.job!.title ?? ""),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius:
                          BorderRadius.circular(10), // Set your desired radius
                      child: Container(
                        color: Colors.grey,
                        width:
                            160, // Double the radius to maintain the circular shape
                        height: 160,
                        child: imageUrl.isEmpty
                            ? const Icon(Icons.person,
                                size:
                                    80) // Placeholder icon when no image is selected
                            : Image.network("${AppConstants.fileUrl}$imageUrl",
                                fit: BoxFit.cover),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text("Pay Rate ${widget.job!.payRate}"),
                const SizedBox(
                  height: 10,
                ),
                const Text("Deadline Date"),
                TableCalendar(
                  focusedDay: _focusedDay,
                  firstDay: DateTime(2000),
                  lastDay: DateTime(2050),
                  rangeStartDay: _rangeStartDate,
                  rangeEndDay: _rangeEndDate,
                  onDaySelected: (selectedDate, focusedDay) {
                    setState(() {
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
                      }
                    });
                  },
                  eventLoader: (date) => _selectedEvents[date] ?? [],
                  onPageChanged: (focusedDay) {},
                ),
                const SizedBox(height: 16),
                selectedDates.isNotEmpty
                    ? const Text("Choose available timeslot")
                    : const SizedBox(),
                const SizedBox(height: 16),
                TimeSelectionWidget(
                    dateList: selectedDates,
                    selectedTimeSlots: selectedTimeSlots),
                Row(
                  children: [
                    Expanded(
                      flex: 6,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border(
                          right: BorderSide(
                              color: Colors.grey.withOpacity(0.9), width: 1),
                        )),
                        child: TextButton(
                            onPressed: () {
                              _onCancelButtonPressed(context);
                            },
                            child: const Text("Cancel")),
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border(
                          right: BorderSide(
                              color: Colors.grey.withOpacity(0.9), width: 1),
                        )),
                        child: TextButton(
                            onPressed: () {
                              onSaveButton(context);
                            },
                            child: const Text("Apply")),
                      ),
                    ),
                  ],
                )
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
              backgroundColor: Colors.blue,
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
