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
          "sortCode": "123456",
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
      child: SingleChildScrollView(
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
                controller: nameController,
                keyboardType: TextInputType.text,
                hintText: 'Enter your name here',
                labelText: "Name",
                validator: (text) {
                  return _validateFirstName(text ?? "");
                }),
            CustomTextfield(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                hintText: 'Enter email here',
                labelText: "Email",
                validator: (text) {
                  return _validateEmail(text ?? "");
                }),
            Column(
              children: [
                const Row(
                  children: [
                    Text("Gender"),
                  ],
                ),
                DropdownButtonFormField(
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
                      value: "other",
                      child: Text("Other"),
                    )
                  ],
                  onChanged: (String? value) {
                    genderController.text = value ?? "";
                  },
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
            Column(
              children: [
                const Row(
                  children: [
                    Text("Account type"),
                  ],
                ),
                DropdownButtonFormField(
                  validator: ((value) {
                    return _validateAccountType(value ?? "");
                  }),
                  items: const [
                    DropdownMenuItem(
                      value: "customer",
                      child: Text("Customer"),
                    ),
                    DropdownMenuItem(
                      value: "contractor",
                      child: Text("Contractor"),
                    ),
                  ],
                  onChanged: (String? value) {
                    accountTypeController.text = value ?? "";
                  },
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
            CustomTextfield(
                controller: phoneNoController,
                keyboardType: TextInputType.text,
                hintText: 'Enter phone no. here',
                labelText: "Phone",
                validator: (text) {
                  return _validatePhone(text ?? "");
                }),
            CustomTextfield(
                controller: addressController,
                keyboardType: TextInputType.text,
                hintText: 'Enter address here',
                labelText: "Address",
                validator: (text) {
                  return _validateAddress(text ?? "");
                }),
            CustomTextfield(
                controller: passwordController,
                obscureText: true,
                keyboardType: TextInputType.text,
                hintText: 'Enter password here',
                labelText: "Password",
                validator: (text) {
                  return _validatePassword(text ?? "");
                }),
            CustomTextfield(
                controller: cpasswordController,
                obscureText: true,
                keyboardType: TextInputType.text,
                hintText: 'Enter confirm password here',
                labelText: "Confirm password",
                validator: (text) {
                  return _validateConfirmPassword(text ?? "",
                      passwordController.text, cpasswordController.text);
                }),
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
                          onLoginButtonPressed(context);
                        },
                        child: const Text("Continue")),
                  ),
                ),
              ],
            )
          ],
        ),
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
