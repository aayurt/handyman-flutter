import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:handyman/core/constants/constants.dart';
import 'package:handyman/core/network/api_list.dart';
import 'package:handyman/core/network/api_service.dart';
import 'package:handyman/core/widgets/alerts/custom_alert.dart';
import 'package:handyman/features/profile/presentation/widgets/google_map_widget.dart';
import 'package:handyman/routes/routes_constant.dart';
import 'package:image_picker/image_picker.dart';

final _formKey = GlobalKey<FormState>();

class RegisterFormUpdate extends StatefulHookWidget {
  const RegisterFormUpdate({
    Key? key,
  }) : super(key: key);

  @override
  _RegisterFormUpdateState createState() => _RegisterFormUpdateState();
}

class _RegisterFormUpdateState extends State<RegisterFormUpdate> {
  final nameController = TextEditingController();
  // final passwordController = TextEditingController();
  final addressController = TextEditingController();
  final countryController = TextEditingController();
  final emailController = TextEditingController();
  final genderController = TextEditingController();
  final phoneNoController = TextEditingController();
  final bioController = TextEditingController();
  final linkedInController = TextEditingController();
  final websiteController = TextEditingController();
  LatLng currentLocation = const LatLng(51.50, 0.127);
  final accountTypeController = TextEditingController();

  List<String> skills = [];
  List<String> interests = [];
  final passwordController = TextEditingController();
  final cpasswordController = TextEditingController();
  bool disableMap = false;
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
    });
    super.initState();
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
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Success'),
            content: const Text('Successfully updated.'),
            actions: <Widget>[
              TextButton(
                child: const Text('Continue'),
                onPressed: () {
                  Navigator.of(context).pop();
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
          "email": emailController.text,
          "password": passwordController.text,
          "name": nameController.text,
          "gender": genderController.text,
          "phone": phoneNoController.text,
          "address": addressController.text,
          "bio": bioController.text,
          "role": accountTypeController.text!.toLowerCase(),
          "avatar": imageUrl,
          "location": {
            "type": "Point",
            "coordinates": [currentLocation.latitude, currentLocation.longitude]
          },
        };
        if (accountTypeController.text == "Contractor") {
          data["skills"] = skills;
          data["interests"] = interests;
          data["linkedIn"] = linkedInController.text;
          data["website"] = websiteController.text;
        }
        final response = await request.post(
            ApiEndpoint(
                baseUrl,
                accountTypeController.text == "Contractor"
                    ? ApiList.contractor
                    : ApiList.customer,
                {}),
            data: data);

        if (response.statusCode == 400) {
          alertMsg.value = "Error is update";
          alertType.value = AlertType.danger;
          alertMsgStatus.value = true;
        } else {
          setState(() {
            disableMap = true;
          });
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  "Create new\naccount",
                  maxLines: 2,
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
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
                Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(
                            80), // Set your desired radius
                        child: Container(
                          color: Colors.grey,
                          width:
                              160, // Double the radius to maintain the circular shape
                          height: 160,
                          child: imageUrl.isEmpty
                              ? const Icon(Icons.person,
                                  size:
                                      80) // Placeholder icon when no image is selected
                              : Image.network(
                                  "${AppConstants.fileUrl}$imageUrl",
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
                ),
                const SizedBox(
                  height: 40,
                ),
                TextFormField(
                  controller: nameController,
                  style: const TextStyle(fontSize: 14),
                  decoration: InputDecoration(
                    filled: true,
                    prefixIcon: const Icon(
                      Icons.account_circle,
                      size: 16,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "Full Name",
                  ),
                  validator: (text) {
                    return _validatename(text ?? "");
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: emailController,
                  style: const TextStyle(fontSize: 14),
                  decoration: InputDecoration(
                    filled: true,
                    prefixIcon: const Icon(
                      Icons.email,
                      size: 16,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "Email",
                  ),
                  validator: (text) {
                    return _validateEmail(text ?? "");
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  obscureText: true,
                  controller: passwordController,
                  style: const TextStyle(fontSize: 14),
                  decoration: InputDecoration(
                    filled: true,
                    prefixIcon: const Icon(
                      Icons.lock,
                      size: 16,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "Password",
                  ),
                  validator: (text) {
                    return _validatePassword(text ?? "");
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                    obscureText: true,
                    controller: cpasswordController,
                    style: const TextStyle(fontSize: 14),
                    decoration: InputDecoration(
                      filled: true,
                      prefixIcon: const Icon(
                        Icons.lock,
                        size: 16,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: "Confirm Password",
                    ),
                    validator: (text) {
                      return _validateConfirmPassword(text ?? "",
                          passwordController.text, cpasswordController.text);
                    }),
                const SizedBox(
                  height: 20,
                ),
                DropdownButtonFormField(
                  hint: const Text(
                    "Gender",
                    style: TextStyle(fontSize: 14),
                  ),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(0),
                    prefixIcon: const Icon(
                      Icons.person,
                      size: 16,
                    ),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.onSurface,
                          width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                          width: 1),
                    ),
                  ),
                  validator: ((value) {
                    return _validateGender(value ?? "");
                  }),
                  items: const [
                    DropdownMenuItem(
                      value: "male",
                      child: Text(
                        "Male",
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    DropdownMenuItem(
                      value: "female",
                      child: Text(
                        "Female",
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    DropdownMenuItem(
                      value: "other",
                      child: Text(
                        "Other",
                        style: TextStyle(fontSize: 14),
                      ),
                    )
                  ],
                  onChanged: (String? value) {
                    genderController.text = value ?? "";
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                DropdownButtonFormField(
                  hint: const Text(
                    "Account Type",
                    style: TextStyle(fontSize: 14),
                  ),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(0),
                    prefixIcon: const Icon(
                      Icons.person,
                      size: 16,
                    ),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.onSurface,
                          width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                          width: 1),
                    ),
                  ),
                  // validator: ((value) {
                  //   return _validateAccountType(value ?? "");
                  // }),
                  items: const [
                    DropdownMenuItem(
                      value: "Customer",
                      child: Text(
                        "Customer",
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    DropdownMenuItem(
                      value: "Contractor",
                      child: Text(
                        "Contractor",
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                  onChanged: (String? value) {
                    accountTypeController.text = value ?? "";
                    setState(() {});
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: phoneNoController,
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
                    hintText: "Phone Number",
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  validator: (text) {
                    return _validatePhone(text ?? "");
                  },
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                    controller: addressController,
                    style: const TextStyle(fontSize: 14),
                    decoration: InputDecoration(
                      filled: true,
                      prefixIcon: const Icon(
                        Icons.location_on,
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
                  height: 20,
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
                accountTypeController.text == "Contractor"
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
                Center(
                  child: !disableMap
                      ? SizedBox(
                          height: 400,
                          child: GoogleMapWidget(
                            addressController: addressController,
                            currentLocation: currentLocation,
                          ))
                      : const SizedBox(),
                ),
                const SizedBox(
                  height: 60,
                ),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: ElevatedButton(
                        onPressed: () => {onUpdateButtonPressed(context)},
                        child: const Text(
                          "Register",
                          style: TextStyle(fontSize: 18),
                        )),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 1,
                        decoration: const BoxDecoration(color: Colors.grey),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text("Or"),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        height: 1,
                        decoration: const BoxDecoration(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account?",
                      style: TextStyle(color: Colors.grey),
                    ),
                    TextButton(
                        onPressed: () {
                          _onCancelButtonPressed(context);
                        },
                        child: const Text("Login"))
                  ],
                ),
                const SizedBox(
                  height: 20,
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
          child: TextFormField(
            controller: controller,
            style: const TextStyle(fontSize: 14),
            decoration: InputDecoration(
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
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
        const SizedBox(
          height: 10,
        ),
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
