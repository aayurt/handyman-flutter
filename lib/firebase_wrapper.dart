import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handyman/core/constants/constants.dart';
import 'package:handyman/features/chat/presentation/bloc/chat_bloc.dart';

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
    if (kIsWeb) {
      if (kDebugMode) {
        print("AppConstants.fsmWeb${AppConstants.fsmWeb}");
      }
      messaging.getToken(vapidKey: AppConstants.fsmWeb).then((value) {
        if (kDebugMode) {
          print("Firebase Token: $value");
        }
      });
    } else {
      messaging.getToken().then((value) {
        if (kDebugMode) {
          print("Firebase Token: $value");
        }
      });
    }
    FirebaseMessaging.onMessage.listen((RemoteMessage event) async {
      context.read<ChatBloc>().add(const ChatEvent.get());

      await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(event.notification?.title ?? ""),
            content: Text(event.notification?.body ?? 'No message body'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
