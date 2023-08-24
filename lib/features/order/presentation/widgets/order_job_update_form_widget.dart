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

class OrderJobUpdateFormWidget extends StatefulHookWidget {
  final ApplicationModel? application;
  const OrderJobUpdateFormWidget({Key? key, this.application})
      : super(key: key);

  @override
  _OrderJobUpdateFormWidgetState createState() =>
      _OrderJobUpdateFormWidgetState();
}

class _OrderJobUpdateFormWidgetState extends State<OrderJobUpdateFormWidget> {
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
                  "listingId": widget.application!.listing!.id ?? "",
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
                Text(widget.application!.listing!.title ?? ""),
                Text(widget.application!.status == "pending"
                    ? "Pending. You can make the changes."
                    : "Your order is being ${widget.application!.status}" ??
                        ""),
                const SizedBox(
                  height: 10,
                ),
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
                Text("Pay Rate ${widget.application!.listing!.payRate}"),
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
                    if (widget.application!.status == "pending") {
                      setState(() {
                        var test1 =
                            DateTime.parse(selectedDate.toString()).toUtc();
                        var test2 = DateFormat("MM/dd/yyyy").format(test1);
                        var newSelectedDay =
                            DateFormat('MM/dd/yyyy').parse(test2).toLocal();
                        if (newSelectedDay.isAfter(_rangeStartDate) &&
                            newSelectedDay.isBefore(_rangeEndDate)) {
                          if (selectedDates.contains(newSelectedDay)) {
                            _selectedEvents[newSelectedDay] = [];
                            selectedDates.remove(newSelectedDay);
                          } else {
                            selectedDates.add(newSelectedDay);
                            for (var date in selectedDates) {
                              _selectedEvents[date] = [
                                'Event 1',
                              ];
                            }
                          }
                        }
                      });
                    }
                  },
                  eventLoader: (date) {
                    var test1 = DateTime.parse(date.toString()).toUtc();
                    var test2 = DateFormat("MM/dd/yyyy").format(test1);
                    var newSelectedDay =
                        DateFormat('MM/dd/yyyy').parse(test2).toLocal();
                    return _selectedEvents[newSelectedDay] ?? [];
                  },
                  onPageChanged: (focusedDay) {},
                ),
                const SizedBox(height: 16),
                selectedDates.isNotEmpty
                    ? const Text("Choose available timeslot")
                    : const SizedBox(),
                const SizedBox(height: 16),
                TimeSelectionWidget(
                    dateList: selectedDates,
                    selectedTimeSlots: selectedTimeSlots,
                    editable: widget.application!.status == "pending"),
                widget.application!.status == "pending"
                    ? Row(
                        children: [
                          Expanded(
                            flex: 6,
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                right: BorderSide(
                                    color: Colors.grey.withOpacity(0.9),
                                    width: 1),
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
                                    color: Colors.grey.withOpacity(0.9),
                                    width: 1),
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
                    : const SizedBox()
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
