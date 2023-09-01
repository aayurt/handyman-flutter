import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:handyman/core/constants/constants.dart';
import 'package:handyman/core/ee.dart';
import 'package:handyman/core/network/api_list.dart';
import 'package:handyman/core/network/api_service.dart';
import 'package:handyman/core/widgets/alerts/custom_alert.dart';
import 'package:handyman/features/job/data/models/category_model.dart';
import 'package:handyman/features/job/data/models/job_model.dart';
import 'package:handyman/features/job/presentation/bloc/category_job/category_job_bloc.dart';
import 'package:handyman/routes/routes_constant.dart';
import 'package:image_picker/image_picker.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../core/widgets/textfield/custom_textfield.dart';

final _formKey = GlobalKey<FormState>();

class JobFormWidget extends StatefulHookWidget {
  final JobModel? job;
  const JobFormWidget({Key? key, this.job}) : super(key: key);

  @override
  _JobFormWidgetState createState() => _JobFormWidgetState();
}

class _JobFormWidgetState extends State<JobFormWidget> {
  final titleController = TextEditingController();

  double payRate = 10.0; // Default pay rate
  final double increment = 1.0;
  final TextEditingController _payRateController = TextEditingController();
  String imageUrl = "";
  List<CategoryModel> categories = [];
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

  final CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
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
      titleController.text = widget.job?.title ?? "";
      setState(() {
        payRate = widget.job?.payRate ?? 10;
        _selectedDay = widget.job!.deadlineDate ?? DateTime.now();
        selectedCategory = widget.job!.category!.id ?? "";
      });
      imageUrl = widget.job!.thumbnailImage ?? "";
    } else {
      setState(() {
        payRate = 10;
      });
    }
    _payRateController.text = payRate.toString();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      context.read<CategoryJobBloc>().add(const CategoryJobEvent.get());
    });
  }

  void _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final File tempImageFile = File(pickedFile.path);
      FormData formData = FormData.fromMap({
        'file': MultipartFile.fromFile(
          tempImageFile.path,
          filename: 'image.jpeg',
        ),
      });
      final String baseUrl = AppConstants.baseUrl;
      final ApiService request = ApiService();
      final response = await request.post(
        ApiEndpoint(baseUrl, ApiList.profileUpload, {}),
        data: formData,
      );
      setState(() {
        imageUrl = response.data["data"]["url"];
      });
    }
  }

  String? selectedCategory;
  @override
  Widget build(BuildContext context) {
    final alertMsg = useState<String>("");
    final alertMsgStatus = useState<bool>(false);
    final alertType = useState<AlertType>(AlertType.info);
    void onSaveButton(BuildContext context) async {
      if (_formKey.currentState!.validate()) {
        final String baseUrl = AppConstants.baseUrl;
        final ApiService request = ApiService();
        final date =
            DateTime(_selectedDay.year, _selectedDay.month, _selectedDay.day)
                .toUtc();
        if (widget.job != null) {
          final response = await request.put(
              ApiEndpoint(
                  baseUrl, "${ApiList.listing}/${widget.job!.id ?? ""}", {}),
              data: {
                "title": titleController.text,
                "deadlineDate": date.toString(),
                "payRate": payRate,
                "thumbnailImage": imageUrl,
                "category": selectedCategory
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
        } else {
          final response = await request
              .post(ApiEndpoint(baseUrl, ApiList.listing, {}), data: {
            "title": titleController.text,
            "deadlineDate": date.toString(),
            "payRate": payRate,
            "thumbnailImage": imageUrl,
            "category": selectedCategory
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
                CustomTextfield(
                    controller: titleController,
                    keyboardType: TextInputType.text,
                    hintText: 'Enter your job title here',
                    labelText: "Title",
                    validator: (text) {
                      return _validateFirsttitle(text ?? "");
                    }),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Pay Rate"),
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: decrementPayRate,
                    ),
                    SizedBox(
                      width: 100,
                      child: TextFormField(
                        controller: _payRateController,
                        keyboardType: TextInputType.number,
                        onChanged: updatePayRate,
                        decoration: const InputDecoration(
                          labelText: '£',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: incrementPayRate,
                    ),
                    const Text("per hour"),
                  ],
                ),
                BlocListener<CategoryJobBloc, CategoryJobState>(
                  listener: (context, state) {
                    if (state is CategoryJobStateLoaded) {
                      setState(() {
                        categories = state.categories;
                      });
                    }
                  },
                  child: Column(
                    children: [
                      const Text("Category"),
                      DropdownButton<String>(
                        value: selectedCategory,
                        onChanged: (newValue) {
                          setState(() {
                            selectedCategory = newValue!;
                          });
                        },
                        items: categories.map((category) {
                          return DropdownMenuItem<String>(
                            value: category.id,
                            child: Text(category.title ?? ""),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),

                const Text("Deadline Date"),
                TableCalendar(
                  calendarFormat: _calendarFormat,
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectedDay, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                    });
                  },
                  focusedDay: _focusedDay,
                  firstDay: DateTime(2000),
                  lastDay: DateTime(2050),
                ),
                const SizedBox(
                  height: 10,
                ),
                Stack(
                  alignment: Alignment.center,
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
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: FloatingActionButton(
                        onPressed: () => _pickImage(),
                        child: const Icon(Icons.camera_alt),
                      ),
                    ),
                  ],
                ),
                // Row(
                //   children: [
                //     Expanded(
                //       flex: 6,
                //       child: Container(
                //         decoration: BoxDecoration(
                //             border: Border(
                //           right: BorderSide(
                //               color: Colors.grey.withOpacity(0.9), width: 1),
                //         )),
                //         child: TextButton(
                //             onPressed: () {
                //               _onCancelButtonPressed(context);
                //             },
                //             child: const Text("Cancel")),
                //       ),
                //     ),
                //     Expanded(
                //       flex: 6,
                //       child: Container(
                //         decoration: BoxDecoration(
                //             border: Border(
                //           right: BorderSide(
                //               color: Colors.grey.withOpacity(0.9), width: 1),
                //         )),
                //         child: TextButton(
                //             onPressed: () {
                //               onSaveButton(context);
                //             },
                //             child: const Text("Save")),
                //       ),
                //     ),
                //   ],
                // )
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
