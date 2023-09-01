import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:handyman/core/shared_pref/shared_pref.dart';
import 'package:handyman/features/login/data/models/login_api_request_model.dart';
import 'package:handyman/features/login/presentation/bloc/login_bloc.dart';
import 'package:handyman/firebase_token.dart';
import 'package:handyman/routes/routes_constant.dart';

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

  onLoginButtonPressed(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      String? token = await getFcmToken();
      print("token $token");
      context.read<LoginBloc>().add(
            LoginEvent.onLogin(
              param: LoginApiRequestModel(
                  email: userIdController.text,
                  password: passwordController.text,
                  panel: selectedOption,
                  fcmToken: token ?? ""),
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

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    "Login to your\naccount",
                    maxLines: 2,
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 40,
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
                        final userId = state.user.user!.id ?? "";
                        // final location = state.user.location;

                        await SharedPrefService.storeToken(
                            SharedPrefKey.token, "");
                        await SharedPrefService.storeToken(
                            SharedPrefKey.userType, "");
                        await SharedPrefService.storeToken(
                            SharedPrefKey.userId, "");
                        if (token!.isNotEmpty) {
                          await SharedPrefService.storeToken(
                              SharedPrefKey.userType, userType ?? "");
                          await SharedPrefService.storeToken(
                              SharedPrefKey.profileLocation, userType ?? "");

                          await SharedPrefService.storeToken(
                              SharedPrefKey.userId, userId);

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
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                              child: CustomAlert(
                                  type: alertType.value,
                                  msg: alertMsg.value,
                                  dimissable: false,
                                  onAlertCloseTap: () {
                                    alertMsgStatus.value = false;
                                  }))
                          : const SizedBox(
                              height: 20,
                            );
                    },
                  ),
                  TextFormField(
                    controller: userIdController,
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
                      return _validateUserId(text ?? "");
                    },
                  ),
                  // CustomTextfield(
                  //     controller: userIdController,
                  //     hintText: 'Enter account email here',
                  //     labelText: "Account email",
                  //     validator: (text) {
                  //       return _validateUserId(text ?? "");
                  //     }),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
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
                    obscureText: true,
                    validator: (text) {
                      return _validatePassword(text ?? "");
                    },
                  ),
                  // CustomTextfield(
                  //   controller: passwordController,
                  //   hintText: 'Enter password here',
                  //   labelText: "Password",
                  //   obscureText: true,
                  //   validator: (text) {
                  //     return _validatePassword(text ?? "");
                  //   },
                  // ),
                  const SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    title: const Text(
                      'Contractor',
                      style: TextStyle(fontSize: 14),
                    ),
                    leading: Radio(
                      value: 'contractor',
                      groupValue: selectedOption,
                      onChanged: (val) => {handleOptionChange(val)},
                    ),
                  ),
                  ListTile(
                    title: const Text(
                      'Customer',
                      style: TextStyle(fontSize: 14),
                    ),
                    leading: Radio(
                      value: 'customer',
                      groupValue: selectedOption,
                      onChanged: (val) => {handleOptionChange(val)},
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: ElevatedButton(
                          onPressed: () => {onLoginButtonPressed(context)},
                          child: const Text(
                            "Login",
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
                        "Don't have an account?",
                        style: TextStyle(color: Colors.grey),
                      ),
                      TextButton(
                          onPressed: () {
                            _onRegisterButtonPressed(context);
                          },
                          child: const Text("Register"))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
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
