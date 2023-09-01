import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FirebaseWrapper extends StatefulWidget {
  final Widget child;
  const FirebaseWrapper({Key? key, required this.child}) : super(key: key);

  @override
  State<FirebaseWrapper> createState() => _FirebaseWrapperState();
}

class _FirebaseWrapperState extends State<FirebaseWrapper> {
  late FirebaseMessaging messaging;

  @override
  void initState() {
    super.initState();

    messaging = FirebaseMessaging.instance;
    messaging.getToken().then((value) {
      print("Firebase Token: $value");
      print(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    FirebaseMessaging.onMessage.listen((event) {
      print("MSG:${event.messageId}");
    });

    return widget.child;
  }
}
