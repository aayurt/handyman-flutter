import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

Future<String?> getFcmToken() async {
  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  try {
    if (kIsWeb) {
      // For Android, use the VAPID key
      final token = await firebaseMessaging.getToken(
        vapidKey:
            "BK9FYvEV6pzUElbq67h_ODhTdRVSK8NcRDDfzck-T5VgdsLYHRjwKAMPQoXCChu32uUjfidVHjEDMkKg-T93DW4",
      );
      return token;
    } else {
      final token = await firebaseMessaging.getToken();
      return token;
    }
  } catch (e) {
    print("Error getting FCM token: $e");
    return null;
  }
}
