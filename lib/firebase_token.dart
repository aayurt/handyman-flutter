import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:handyman/core/constants/constants.dart';
import 'package:handyman/core/network/api_list.dart';
import 'package:handyman/core/network/api_service.dart';
import 'package:handyman/core/shared_pref/shared_pref.dart';

Future<String?> getFcmToken() async {
  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  try {
    if (kIsWeb) {
      final token = await firebaseMessaging.getToken(
        vapidKey: AppConstants.fsmWeb,
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

Future<void> setFcmToken() async {
  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  String? fcmToken;
  if (kIsWeb) {
    fcmToken = await firebaseMessaging.getToken(
      vapidKey: AppConstants.fsmWeb,
    );
  } else {
    fcmToken = await firebaseMessaging.getToken();
  }
  final getToken = await SharedPrefService.getToken(SharedPrefKey.token);
  if (fcmToken!.isNotEmpty && getToken.isNotEmpty) {
    final String baseUrl = AppConstants.baseUrl;
    final ApiService request = ApiService();
    await request.put(ApiEndpoint(baseUrl, ApiList.fcmToken, {}),
        data: {"fcm_token": fcmToken});
  }
}
