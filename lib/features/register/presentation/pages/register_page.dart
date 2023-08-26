import 'package:flutter/material.dart';
import 'package:handyman/features/register/presentation/pages/register_form_update.dart'
    if (dart.library.js) 'package:handyman/features/register/presentation/pages/register_form_update_web.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: const RegisterFormUpdate(),
          ),
        ),
      ),
    );
  }
}
