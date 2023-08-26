import 'package:flutter/services.dart';
import 'package:handyman/core/constants/constants.dart';
import 'package:handyman/core/ee.dart';
import 'package:handyman/core/network/api_list.dart';
import 'package:handyman/core/network/api_service.dart';
import 'package:handyman/core/widgets/alerts/custom_alert.dart';
import 'package:handyman/routes/routes_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/textfield/custom_textfield.dart';

final _formKey = GlobalKey<FormState>();

class RegisterForm extends StatefulHookWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final nameController = TextEditingController();
  final amountController = TextEditingController();
  final addressController = TextEditingController();
  final emailController = TextEditingController();
  final genderController = TextEditingController();
  final accountTypeController = TextEditingController();
  final phoneNoController = TextEditingController();

  final passwordController = TextEditingController();
  final cpasswordController = TextEditingController();
  final refController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final alertMsg = useState<String>("");
    final alertMsgStatus = useState<bool>(false);
    final alertType = useState<AlertType>(AlertType.info);
    void onLoginButtonPressed(BuildContext context) async {
      if (_formKey.currentState!.validate()) {
        final String baseUrl = AppConstants.baseUrl;
        final ApiService request = ApiService();
        final response = await request
            .post(ApiEndpoint(baseUrl, ApiList.getAllUsers, {}), data: {
          "email": emailController.text,
          "password": passwordController.text,
          "name": nameController.text,
          "gender": genderController.text,
          "telephone": phoneNoController.text,
          "type": accountTypeController.text
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

        // GoRouter.of(context).go(RoutesConstant.home);
      }
    }

    return Form(
      key: _formKey,
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
          const SizedBox(
            height: 40,
          ),
          const Text(
            "Create new\naccount",
            maxLines: 2,
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
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
              return _validateFirstName(text ?? "");
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
                    color: Theme.of(context).colorScheme.onSurface, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  Radius.circular(10.0),
                ),
                borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary, width: 1),
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
                    color: Theme.of(context).colorScheme.onSurface, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  Radius.circular(10.0),
                ),
                borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary, width: 1),
              ),
            ),
            validator: ((value) {
              return _validateAccountType(value ?? "");
            }),
            items: const [
              DropdownMenuItem(
                value: "customer",
                child: Text(
                  "Customer",
                  style: TextStyle(fontSize: 14),
                ),
              ),
              DropdownMenuItem(
                value: "contractor",
                child: Text(
                  "Contractor",
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ],
            onChanged: (String? value) {
              accountTypeController.text = value ?? "";
            },
          ),

          // Column(
          //   children: [
          //     const Row(
          //       children: [
          //         Text("Account type"),
          //       ],
          //     ),
          //     DropdownButtonFormField(
          //       validator: ((value) {
          //         return _validateAccountType(value ?? "");
          //       }),
          //       items: const [
          //         DropdownMenuItem(
          //           value: "customer",
          //           child: Text("Customer"),
          //         ),
          //         DropdownMenuItem(
          //           value: "contractor",
          //           child: Text("Contractor"),
          //         ),
          //       ],
          //       onChanged: (String? value) {
          //         accountTypeController.text = value ?? "";
          //       },
          //     ),
          //     const SizedBox(
          //       height: 10,
          //     )
          //   ],
          // ),
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
              obscureText: true,
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
          // CustomTextfield(
          //     controller: cpasswordController,
          //     obscureText: true,
          //     keyboardType: TextInputType.text,
          //     hintText: 'Enter confirm password here',
          //     labelText: "Confirm password",
          //     validator: (text) {
          //       return _validateConfirmPassword(text ?? "",
          //           passwordController.text, cpasswordController.text);
          //     }),

          const SizedBox(
            height: 60,
          ),
          SizedBox(
            height: 50,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: ElevatedButton(
                  onPressed: () => {onLoginButtonPressed(context)},
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
          //               onLoginButtonPressed(context);
          //             },
          //             child: const Text("Continue")),
          //       ),
          //     ),
          //   ],
          // ),

          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}

_validateFirstName(String value) {
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

_validateAccountType(String value) {
  if (value.isEmpty) {
    return "Please select account type";
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
    return "Please select gender";
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

showSuccess(context) {
  showAdaptiveDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Success'),
        content: const Text('Successfully transferred'),
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
