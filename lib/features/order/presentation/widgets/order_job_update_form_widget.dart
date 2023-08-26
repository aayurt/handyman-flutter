import 'package:handyman/core/constants/constants.dart';
import 'package:handyman/core/constants/files.dart';
import 'package:handyman/core/ee.dart';
import 'package:handyman/core/network/api_list.dart';
import 'package:handyman/core/network/api_service.dart';
import 'package:handyman/core/payment_option.dart';
import 'package:handyman/core/widgets/alerts/custom_alert.dart';
import 'package:handyman/core/widgets/button_group/custom_button_group.dart';
import 'package:handyman/core/widgets/button_group/custom_ghost_mob.dart';
import 'package:handyman/features/job/presentation/widgets/time_selection_widget.dart';
import 'package:handyman/features/order/data/models/application_model.dart';
import 'package:handyman/features/order/presentation/widgets/webhook_payment_screen.dart';
import 'package:handyman/routes/routes_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

final _formKey = GlobalKey<FormState>();

enum PaymentPage { paymentOption, stripe, cod, success, error }

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
  PaymentPage currentPage = PaymentPage.paymentOption;

  PaymentOption selectedPaymentOption = PaymentOption.stripe;
  Map<DateTime, List<String>> selectedTimeSlots = {};
  double payRate = 10.0; // Default pay rate
  final double increment = 1.0;
  final TextEditingController _payRateController = TextEditingController();
  String imageUrl = "";
  double listingRating = 0;
  TextEditingController noteController = TextEditingController();
  final DateTime _focusedDay = DateTime.now();
  final Map<DateTime, List> _selectedEvents = {};
  List<DateTime> selectedDates = [];

  final DateTime _rangeStartDate = DateTime.now();
  DateTime _rangeEndDate = DateTime.now();

  Future<void> _showPaymentScreen(context) async {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return Dialog(
            backgroundColor: Colors.transparent,
            child: StatefulBuilder(
                builder: (BuildContext newContext, StateSetter setState) {
              codPay() async {
                try {
                  final ApiService request = ApiService();
                  final response = await request.put(
                      ApiEndpoint(
                          AppConstants.baseUrl,
                          "${ApiList.application}/${widget.application!.id}",
                          {}),
                      data: {
                        "note": 'Text',
                        "paymentMethod": "cod",
                      });
                  var jsonData = response.data;
                  if (jsonData["data"] != null &&
                      (jsonData["data"]["paymentStatus"] == "unpaid" ||
                          jsonData["data"]["paymentStatus"] == "paid")) {
                    setState(() {
                      currentPage = PaymentPage.success;
                    });
                  } else {
                    setState(() {
                      currentPage = PaymentPage.error;
                    });
                  }
                } catch (e) {
                  print(e);
                }
              }

              switch (currentPage) {
                case PaymentPage.success:
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Container(
                          width: 320.0,
                          color: Colors.white,
                          child: Container(
                            padding: const EdgeInsets.only(
                              top: 16.0,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text(
                                  "Success",
                                  style: TextStyle(fontSize: 24),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                    height: 140,
                                    child: Image.asset(MyAssets.successGif)),
                                const SizedBox(
                                  height: 16,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(newContext);
                                        },
                                        child: const Text("Continue")),
                                    const SizedBox(
                                      width: 10,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                case PaymentPage.paymentOption:
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Container(
                          width: 320.0,
                          color: Colors.white,
                          child: Container(
                            padding: const EdgeInsets.only(
                              top: 16.0,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text(
                                  "Payment Option",
                                  style: TextStyle(fontSize: 24),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                RadioListTile<PaymentOption>(
                                  title: const Text('Stripe'),
                                  value: PaymentOption.stripe,
                                  groupValue: selectedPaymentOption,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedPaymentOption = value!;
                                    });
                                  },
                                ),
                                RadioListTile<PaymentOption>(
                                  title: const Text('Cash on Delivery'),
                                  value: PaymentOption.cashOnDelivery,
                                  groupValue: selectedPaymentOption,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedPaymentOption = value!;
                                    });
                                  },
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                CustomButtonGroup(
                                    btn2: CustomGhostMob(
                                      height: 60,
                                      labelText: selectedPaymentOption ==
                                              PaymentOption.cashOnDelivery
                                          ? "Checkout"
                                          : "Continue",
                                      onPressed: () {
                                        setState(() {
                                          if (selectedPaymentOption ==
                                              PaymentOption.cashOnDelivery) {
                                            // Navigator.pop(dialogContext);
                                            currentPage = PaymentPage.cod;
                                          } else {
                                            // Navigator.pop(dialogContext);
                                            currentPage = PaymentPage.stripe;

                                            // _showPaymentScreen(dialogContext);
                                          }
                                        });
                                      },
                                    ),
                                    btn1: CustomGhostMob(
                                      height: 60,
                                      buttonType: CustomGhostButtonType.danger,
                                      labelText: "Cancel",
                                      onPressed: () {
                                        Navigator.pop(dialogContext);
                                      },
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                case PaymentPage.cod:
                  return Column(mainAxisSize: MainAxisSize.min, children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Container(
                            width: 400.0,
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          currentPage =
                                              PaymentPage.paymentOption;
                                        });
                                      },
                                      icon: const Icon(Icons.arrow_back_ios)),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                        "You are going to order in Cash on delivery"),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      TextButton(
                                          onPressed: () {
                                            codPay();
                                          },
                                          child: const Text("Pay"))
                                    ],
                                  )
                                ],
                              ),
                            )))
                  ]);
                case PaymentPage.stripe:
                  return Column(mainAxisSize: MainAxisSize.min, children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Container(
                            width: 400.0,
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        currentPage = PaymentPage.paymentOption;
                                      });
                                    },
                                    icon: const Icon(Icons.arrow_back_ios)),
                                WebhookPaymentScreen(
                                    note: 'TEST',
                                    applicationId: widget.application!.id ?? "",
                                    totalPrice: 1000,
                                    setCurrentPage: (newPage) {
                                      setState(
                                        () {
                                          currentPage = newPage;
                                        },
                                      );
                                    }),
                              ],
                            )))
                  ]);
                default:
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Container(
                          width: 320.0,
                          color: Colors.white,
                          child: Container(
                            padding: const EdgeInsets.only(
                              top: 16.0,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text(
                                  "Error",
                                  style: TextStyle(fontSize: 24),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const SizedBox(
                                  height: 140,
                                  child: Icon(Icons.close),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(newContext);
                                        },
                                        child: const Text("Continue"))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
              }
            }));
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds: 0), () async {
      try {
        final ApiService request = ApiService();
        final response = await request.get(
          ApiEndpoint(
              AppConstants.baseUrl,
              "${ApiList.listingRating}/${widget.application!.listing!.id}",
              {}),
        );
        if (response.data != null &&
            response.data["rating"] != null &&
            response.data["rating"]["value"] != null) {
          setState(() {
            listingRating = response.data["rating"]["value"];
            noteController.text = response.data["rating"] != null &&
                    response.data["rating"]["note"] != null
                ? response.data["rating"]["note"]
                : "";
          });
        }
      } on Exception {
        rethrow;
      }
    });
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
                widget.application!.status != "pending" &&
                        widget.application!.status != "cancelled"
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Ratings:"),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              RatingWidget(
                                  rating: listingRating,
                                  setRating: (double val) {
                                    setState(() {
                                      listingRating = val;
                                    });
                                  }),
                              SizedBox(
                                width: 150,
                                child: TextField(
                                  controller: noteController,
                                ),
                              ),
                              TextButton(
                                  onPressed: () async {
                                    try {
                                      final ApiService request = ApiService();
                                      final response = await request.post(
                                        ApiEndpoint(AppConstants.baseUrl,
                                            ApiList.ratingListing, {}),
                                        data: ({
                                          "listingId":
                                              "${widget.application!.listing!.id}",
                                          "value": listingRating,
                                          "note": noteController.text
                                        }),
                                      );
                                      return response.data;
                                    } on Exception {
                                      rethrow;
                                    }
                                    // listingRating
                                  },
                                  child: const Text("Submit"))
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text("Feedback")
                        ],
                      )
                    : const SizedBox(),
                widget.application!.paymentStatus == "paid"
                    ? const Text("Paid.")
                    : widget.application!.status != "pending" &&
                            widget.application!.status != "cancelled"
                        ? Column(
                            children: [
                              SizedBox(
                                width: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 30, right: 30, bottom: 20),
                                  child: ElevatedButton(
                                    onPressed: false
                                        ? null
                                        : () {
                                            _showPaymentScreen(context);
                                          },
                                    child: const Text("Pay"),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : const SizedBox(),
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

class RatingWidget extends StatelessWidget {
  final double rating;
  final int maxRating;
  final double starSize;
  final Color starColor;
  final Function setRating;

  const RatingWidget({
    super.key,
    required this.rating,
    this.maxRating = 5,
    this.starSize = 24.0,
    this.starColor = Colors.amber,
    required this.setRating,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(maxRating, (index) {
        if (index < rating) {
          return InkWell(
            onTap: (() {
              setRating(index + 1);
            }),
            child: Icon(
              Icons.star,
              size: starSize,
              color: starColor,
            ),
          );
        } else {
          return InkWell(
            onTap: (() {
              setRating(index + 1);
            }),
            child: Icon(
              Icons.star_border,
              size: starSize,
              color: starColor,
            ),
          );
        }
      }),
    );
  }
}
