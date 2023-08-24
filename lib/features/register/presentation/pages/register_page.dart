import 'package:handyman/features/register/presentation/pages/register_form.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../routes/routes_constant.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(children: [
        Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            SizedBox(
                height: 25,
                width: 25,
                child: GestureDetector(
                    onTap: () {
                      GoRouter.of(context).go(RoutesConstant.splash);
                    },
                    child: const Icon(Icons.arrow_back))),
            const Expanded(
              child: Text(
                "Register",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(
              width: 25,
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        const Expanded(
          child: Padding(
            padding: EdgeInsets.only(top: 16.0, left: 16, right: 16),
            child: RegisterForm(),
          ),
        ),
      ])),
    );
  }
}
