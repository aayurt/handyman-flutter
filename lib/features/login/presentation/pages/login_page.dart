import 'package:handyman/core/shared_pref/shared_pref.dart';
import 'package:handyman/core/widgets/button_group/custom_button_group.dart';
import 'package:handyman/core/widgets/card/custom_card.dart';
import 'package:handyman/core/widgets/textfield/custom_textfield.dart';
import 'package:handyman/features/login/data/models/login_api_request_model.dart';
import 'package:handyman/features/login/presentation/bloc/login_bloc.dart';
import 'package:handyman/routes/routes_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../core/widgets/alerts/custom_alert.dart';
import '../bloc/login_event.dart';
import '../bloc/login_state.dart';

final _formKey = GlobalKey<FormState>();

class LoginPage extends StatefulHookWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final userIdController = TextEditingController();
  final passwordController = TextEditingController();
  String selectedOption = 'contractor';
  void handleOptionChange(String? option) {
    setState(() {
      selectedOption = option ?? "";
    });
  }

  onLoginButtonPressed(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<LoginBloc>().add(
            LoginEvent.onLogin(
              param: LoginApiRequestModel(
                  email: userIdController.text,
                  password: passwordController.text,
                  panel: selectedOption),
            ),
          );
    }
  }

  @override
  initState() {
    Future.delayed(const Duration(milliseconds: 0), () async {
      await SharedPrefService.storeToken(SharedPrefKey.token, "");
      await SharedPrefService.getToken(SharedPrefKey.token).then((token) {
        if (token.isNotEmpty) {
          GoRouter.of(context).go(RoutesConstant.splash);
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final alertMsg = useState<String>("");
    final alertMsgStatus = useState<bool>(false);
    final alertType = useState<AlertType>(AlertType.info);

    return Container(
      decoration: const BoxDecoration(color: Color(0xFFffffff)
          //     gradient: LinearGradient(
          //   begin: Alignment.topRight,
          //   end: Alignment.bottomLeft,
          //   colors: [
          //     Colors.blue,
          //     Colors.red,
          //   ],
          // )
          ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
              child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // SizedBox(
                  //   child: Image(image: AssetImage(MyAssets.bankLogo)),
                  // ),
                  // SizedBox(
                  //   width: 8,
                  // ),
                  // Text(
                  //   "ABC Banking",
                  //   style: TextStyle(fontSize: 24),
                  // ),
                  // CustomText(
                  //   child: Text(
                  //     "ABC Banking",
                  //     style: TextStyle(fontSize: 24),
                  //   ),
                  // ),
                  // CustomTextNew(
                  //   children: [
                  //     Text(
                  //       "ABC Banking",
                  //       style: TextStyle(fontSize: 24),
                  //     ),
                  //     Text(
                  //       "ABC Banking",
                  //       style: TextStyle(fontSize: 24),
                  //     ),
                  //   ],
                  // )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 550,
                  ),
                  child: Form(
                    key: _formKey,
                    child: Wrap(children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: CustomCardWidget(
                            children: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Login",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  BlocConsumer<LoginBloc, LoginState>(
                                    listener: (context, state) async {
                                      if (state is LoginErrorState) {
                                        alertType.value = AlertType.danger;
                                        alertMsgStatus.value = true;
                                        alertMsg.value = "Login failed.";
                                      } else if (state is LoginLoadedState) {
                                        final token = state.user.accessToken;
                                        final userType = state.user.userType;
                                        // final location = state.user.location;

                                        await SharedPrefService.storeToken(
                                            SharedPrefKey.token, "");
                                        await SharedPrefService.storeToken(
                                            SharedPrefKey.userType, "");
                                        if (token!.isNotEmpty) {
                                          await SharedPrefService.storeToken(
                                              SharedPrefKey.userType,
                                              userType ?? "");
                                          await SharedPrefService.storeToken(
                                              SharedPrefKey.profileLocation,
                                              userType ?? "");
                                          await SharedPrefService.storeToken(
                                                  SharedPrefKey.token, token)
                                              .then((value) {
                                            context.go(RoutesConstant.splash);
                                          });
                                        }
                                      } else {
                                        alertMsgStatus.value = false;
                                        alertMsg.value = "";
                                      }
                                    },
                                    builder: (context, state) {
                                      return alertMsgStatus.value
                                          ? Container(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      0, 0, 0, 10),
                                              child: CustomAlert(
                                                  type: alertType.value,
                                                  msg: alertMsg.value,
                                                  dimissable: false,
                                                  onAlertCloseTap: () {
                                                    alertMsgStatus.value =
                                                        false;
                                                  }))
                                          : const SizedBox(
                                              height: 20,
                                            );
                                    },
                                  ),
                                  CustomTextfield(
                                      controller: userIdController,
                                      hintText: 'Enter account email here',
                                      labelText: "Account email",
                                      validator: (text) {
                                        return _validateUserId(text ?? "");
                                      }),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  CustomTextfield(
                                    controller: passwordController,
                                    hintText: 'Enter password here',
                                    labelText: "Password",
                                    obscureText: true,
                                    validator: (text) {
                                      return _validatePassword(text ?? "");
                                    },
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  ListTile(
                                    title: const Text('Contractor'),
                                    leading: Radio(
                                      value: 'contractor',
                                      groupValue: selectedOption,
                                      onChanged: (val) =>
                                          {handleOptionChange(val)},
                                    ),
                                  ),
                                  ListTile(
                                    title: const Text('Customer'),
                                    leading: Radio(
                                      value: 'customer',
                                      groupValue: selectedOption,
                                      onChanged: (val) =>
                                          {handleOptionChange(val)},
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                ],
                              ),
                            ),
                            CustomButtonGroup(
                              btn1: SizedBox(
                                height: 60,
                                child: TextButton(
                                    style: TextButton.styleFrom(
                                      foregroundColor:
                                          Colors.green.withOpacity(0.5),
                                    ),
                                    onPressed: () {
                                      _onRegisterButtonPressed(context);
                                    },
                                    child: const Text(
                                      "Register",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black),
                                    )),
                              ),
                              btn2: SizedBox(
                                height: 60,
                                child: TextButton(
                                    style: TextButton.styleFrom(
                                      foregroundColor:
                                          Colors.blue.withOpacity(0.5),
                                    ),
                                    onPressed: () =>
                                        onLoginButtonPressed(context),
                                    child: const Text(
                                      "Login",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black),
                                    )),
                              ),
                            )
                          ],
                        )),
                      ),
                    ]),
                  )),
            ],
          ))),
    );
  }
}

_validateUserId(String value) {
  if (value.isEmpty) {
    return "Please enter an account email.";
  }
  return null;
}

_validatePassword(String value) {
  if (value.isEmpty) {
    return "Please enter a password.";
  }
  return null;
}

_onRegisterButtonPressed(BuildContext context) {
  GoRouter.of(context).go(RoutesConstant.register);
}
