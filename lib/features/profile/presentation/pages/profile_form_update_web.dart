import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:handyman/core/constants/constants.dart';
import 'package:handyman/core/network/api_list.dart';
import 'package:handyman/core/network/api_service.dart';
import 'package:handyman/core/widgets/alerts/custom_alert.dart';
import 'package:handyman/features/login/data/models/login_api_response_model.dart';
import 'package:handyman/features/profile/presentation/widgets/google_map_widget.dart';
import 'package:handyman/routes/routes_constant.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_web/image_picker_web.dart';

import '../../../../core/shared_pref/shared_pref.dart';
import '../../../../core/widgets/textfield/custom_textfield.dart';

final _formKey = GlobalKey<FormState>();

class ProfileFormUpdate extends StatefulHookWidget {
  final User? userModelData;
  const ProfileFormUpdate({Key? key, this.userModelData}) : super(key: key);

  @override
  _ProfileFormUpdateState createState() => _ProfileFormUpdateState();
}

class _ProfileFormUpdateState extends State<ProfileFormUpdate> {
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final countryController = TextEditingController();
  final emailController = TextEditingController();
  final genderController = TextEditingController();
  final phoneNoController = TextEditingController();
  final bioController = TextEditingController();
  final linkedInController = TextEditingController();
  final websiteController = TextEditingController();
  LatLng currentLocation = const LatLng(51.50, 0.127);

  List<String> skills = [];
  List<String> interests = [];
  String userType = "";
  // final passwordController = TextEditingController();
  // final cpasswordController = TextEditingController();
  // File? imageFile;
  String imageUrl = "";

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      genderController.text = "male";

      var usertype = await SharedPrefService.getToken(SharedPrefKey.userType);
      if (usertype.isNotEmpty) {
        setState(() {
          userType = usertype;
        });
        initializeUserTypeDependentData();
      }
    });

    super.initState();
  }

  void initializeUserTypeDependentData() {
    nameController.text = widget.userModelData!.name ?? "";
    addressController.text = widget.userModelData!.address ?? "";
    emailController.text = widget.userModelData!.email ?? "";
    genderController.text = widget.userModelData!.gender ?? "male";
    phoneNoController.text = widget.userModelData!.phone ?? "";
    bioController.text = widget.userModelData!.bio ?? "";

    if (userType == "Contractor") {
      linkedInController.text = widget.userModelData!.linkedIn ?? "";
      websiteController.text = widget.userModelData!.website ?? "";
    }

    setState(() {
      imageUrl = widget.userModelData!.avatar ?? "";
      if (userType == "Contractor") {
        skills = widget.userModelData!.skills!.toList() ?? [];
        interests = widget.userModelData!.interests!.toList() ?? [];
      }
    });
  }

  void _pickImage() async {
    if (kIsWeb) {
      try {
        Uint8List? bytesFromPicker = await ImagePickerWeb.getImageAsBytes();

        if (bytesFromPicker != null) {
          Uint8List? bytes = bytesFromPicker;
          FormData formData = FormData.fromMap({
            'file': MultipartFile.fromBytes(
              bytes,
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
        } else {}
      } catch (e) {
        print(e);
      }
    } else {
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
  }

  final TextEditingController _skillController = TextEditingController();
  final TextEditingController _interestController = TextEditingController();

  void addTag(List<String> list, TextEditingController textEditingController) {
    setState(() {
      list.add(textEditingController.text);
      textEditingController.clear();
    });
  }

  void removeTag(List<String> list, String tag) {
    setState(() {
      list.remove(tag);
    });
  }

  @override
  Widget build(BuildContext context) {
    final alertMsg = useState<String>("");
    final alertMsgStatus = useState<bool>(false);
    final alertType = useState<AlertType>(AlertType.info);
    showSuccess() {
      showAdaptiveDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext caontext) {
          return AlertDialog(
            title: const Text('Success'),
            content: const Text('Successfully updated.'),
            actions: <Widget>[
              TextButton(
                child: const Text('Continue'),
                onPressed: () {
                  Navigator.of(context).pop();

                  GoRouter.of(caontext).go(RoutesConstant.splash);
                },
              ),
            ],
          );
        },
      );
    }

    void onUpdateButtonPressed(BuildContext context) async {
      alertMsgStatus.value = false;

      if (_formKey.currentState!.validate()) {
        final String baseUrl = AppConstants.baseUrl;
        final ApiService request = ApiService();

        Map<String, Object?> data = {
          "_id": widget.userModelData!.id,
          "email": emailController.text,
          // "password": passwordController.text,
          "name": nameController.text,
          "gender": genderController.text,
          "phone": phoneNoController.text,
          "address": addressController.text,
          "avatar": imageUrl,
          "bio": bioController.text,
          "location": {
            "type": "Point",
            "coordinates": [currentLocation.latitude, currentLocation.longitude]
          },
        };
        if (userType == "Contractor") {
          data["skills"] = skills;
          data["interests"] = interests;
          data["linkedIn"] = linkedInController.text;
          data["website"] = websiteController.text;
        }
        final response = await request
            .patch(ApiEndpoint(baseUrl, ApiList.profile, {}), data: data);

        if (response.statusCode == 400) {
          alertMsg.value = "Error is update";
          alertType.value = AlertType.danger;
          alertMsgStatus.value = true;
        } else {
          showSuccess();
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

                Stack(
                  alignment: Alignment.center,
                  children: [
                    ClipRRect(
                      borderRadius:
                          BorderRadius.circular(80), // Set your desired radius
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
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                    controller: nameController,
                    style: const TextStyle(fontSize: 14),
                    decoration: InputDecoration(
                      filled: true,
                      prefixIcon: const Icon(
                        Icons.person,
                        size: 16,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: "Name",
                    ),
                    validator: (text) {
                      return _validatename(text ?? "");
                    }),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(fontSize: 14),
                    decoration: InputDecoration(
                      filled: true,
                      prefixIcon: const Icon(
                        Icons.email,
                        size: 16,
                      ),
                      enabled: false,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: "Email",
                    ),
                    validator: (text) {
                      return _validateEmail(text ?? "");
                    }),
                const SizedBox(
                  height: 10,
                ),
                genderController.text.isNotEmpty
                    ? DropdownButtonFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          contentPadding: EdgeInsets.all(0),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            //<-- SEE HERE
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            //<-- SEE HERE
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1),
                          ),
                        ),
                        value: genderController.text,
                        validator: ((value) {
                          return _validateGender(value ?? "");
                        }),
                        items: const [
                          DropdownMenuItem(
                            value: "male",
                            child: Text("Male"),
                          ),
                          DropdownMenuItem(
                            value: "female",
                            child: Text("Female"),
                          ),
                          DropdownMenuItem(
                            value: "others",
                            child: Text("Others"),
                          )
                        ],
                        onChanged: (String? value) {
                          genderController.text = value ?? "";
                        },
                      )
                    : const SizedBox(),
                const SizedBox(
                  height: 10,
                ),

                TextFormField(
                    controller: phoneNoController,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(fontSize: 14),
                    decoration: InputDecoration(
                      filled: true,
                      prefixIcon: const Icon(
                        Icons.call,
                        size: 16,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: "Contact",
                    ),
                    validator: (text) {
                      return _validatePhone(text ?? "");
                    }),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                    controller: addressController,
                    keyboardType: TextInputType.text,
                    style: const TextStyle(fontSize: 14),
                    decoration: InputDecoration(
                      filled: true,
                      prefixIcon: const Icon(
                        Icons.location_city,
                        size: 16,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: "Address",
                    ),
                    validator: (text) {
                      return _validateAddress(text ?? "");
                    }),

                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                    minLines: 3,
                    maxLines: 5,
                    controller: bioController,
                    keyboardType: TextInputType.text,
                    style: const TextStyle(fontSize: 14),
                    decoration: InputDecoration(
                      filled: true,
                      prefixIcon: const Icon(
                        Icons.article,
                        size: 16,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: "Bio",
                    ),
                    validator: (text) {
                      return _validateAddress(text ?? "");
                    }),

                userType == "Contractor"
                    ? CustomTextfield(
                        controller: linkedInController,
                        keyboardType: TextInputType.text,
                        hintText: 'Enter LinkedIn here',
                        labelText: "LinkedIn",
                        validator: (text) {
                          return _validateAddress(text ?? "");
                        })
                    : const SizedBox(),
                userType == "Contractor"
                    ? CustomTextfield(
                        controller: websiteController,
                        keyboardType: TextInputType.text,
                        hintText: 'Enter website here',
                        labelText: "Website",
                        validator: (text) {
                          return _validateAddress(text ?? "");
                        })
                    : const SizedBox(),
                userType == "Contractor"
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          _buildTagList('Skills', skills),
                          _buildTagInput(_skillController, 'Enter a skill', () {
                            addTag(skills, _skillController);
                          }),
                          _buildTagList('Interests', interests),
                          _buildTagInput(
                              _interestController, 'Enter a interest', () {
                            addTag(interests, _interestController);
                          }),
                        ],
                      )
                    : const SizedBox(),
                SizedBox(
                    height: 400,
                    child: GoogleMapWidget(
                      addressController: addressController,
                      currentLocation: currentLocation,
                    )),

                // const Text("Shipping Address"),
                // CustomTextfield(
                //     controller: addressController,
                //     keyboardType: TextInputType.text,
                //     hintText: 'Enter address here',
                //     labelText: "Address",
                //     validator: (text) {
                //       return _validateAddress(text ?? "");
                //     }),
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
                //               onUpdateButtonPressed(context);
                //             },
                //             child: const Text("Update")),
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
                onUpdateButtonPressed(context);
              },
              child: const Icon(Icons.save_outlined),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTagInput(TextEditingController controller, String hintText,
      VoidCallback onPressed) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
            ),
          ),
        ),
        const SizedBox(width: 8),
        ElevatedButton(
          onPressed: onPressed,
          child: const Text('Add'),
        ),
      ],
    );
  }

  Widget _buildTagList(String title, List<String> tagList) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Text(title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Wrap(
          spacing: 8,
          children: tagList.map((tag) {
            return Chip(
              label: Text(tag),
              onDeleted: () {
                removeTag(tagList, tag);
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}

_validatename(String value) {
  if (value.isEmpty) {
    return "Please enter first name";
  }

  return null;
}

_validateEmail(String value) {
  if (value.isEmpty) {
    return "Please enter email name";
  }

  return null;
}

_validateGender(String value) {
  if (value.isEmpty) {
    return "Please select gender";
  }

  return null;
}

_validatePhone(String value) {
  if (value.isEmpty) {
    return "Please enter phone no.";
  }

  return null;
}

_validateAddress(String value) {
  if (value.isEmpty) {
    return "Please enter address";
  }

  return null;
}

_validatePassword(String value) {
  if (value.isEmpty) {
    return "Please enter a password";
  }

  return null;
}

_validateConfirmPassword(String value, String password, String cpassword) {
  if (value.isEmpty) {
    return "Please enter a password";
  }
  if (password != cpassword) {
    return "Passwords do not match";
  }
  return null;
}

_onCancelButtonPressed(BuildContext context) {
  GoRouter.of(context).go(RoutesConstant.login);
}
