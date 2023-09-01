import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutter/material.dart';
import 'package:handyman/bloc_provider.dart';
import 'package:handyman/firebase_options.dart';
import 'package:url_strategy/url_strategy.dart';
import 'core/service_locator/service_locator.dart';

void main() async {
  String envFile = kReleaseMode ? '.env.development' : '.env.production';
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: envFile);
  Stripe.publishableKey =
      'pk_test_51NedtBDDamU6CLaLRLFaQ7bpRHUylpK4RD9IC6wMuluO3r11K5h9SBm2NcUrkbVUHF4d66Hxg0mlAaOQ2ZUOQ25N001nFebycM';
  // await Stripe.instance.applySettings();
  await setUpServiceLocator();

  //FIREBASE
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FlutterError.onError = (errorDetails) {
    // If you wish to record a "non-fatal" exception, please use `FirebaseCrashlytics.instance.recordFlutterError` instead
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  PlatformDispatcher.instance.onError = (error, stack) {
    // If you wish to record a "non-fatal" exception, please remove the "fatal" parameter
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  if (!kIsWeb) {
    FirebaseMessaging.instance.subscribeToTopic("handyman-chat");

    await setupFlutterNotifications();
  }

  //FIREBASE END

  setPathUrlStrategy();

  runApp(const BlocProviderContainer());
}

late AndroidNotificationChannel channel;
bool isFlutterLocalNotificationsInitialized = false;

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  showFlutterNotification(message);
}

Future<void> setupFlutterNotifications() async {
  if (isFlutterLocalNotificationsInitialized) {
    return;
  }
  channel = const AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description:
        'This channel is used for important notifications.', // description
    importance: Importance.high,
  );

  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  /// Create an Android Notification Channel.
  ///
  /// We use this channel in the `AndroidManifest.xml` file to override the
  /// default FCM channel to enable heads up notifications.
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  /// Update the iOS foreground notification presentation options to allow
  /// heads up notifications.
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  isFlutterLocalNotificationsInitialized = true;
}

void showFlutterNotification(RemoteMessage message) {
  RemoteNotification? notification = message.notification;
  AndroidNotification? android = message.notification?.android;

  if (notification != null && android != null && !kIsWeb) {
    flutterLocalNotificationsPlugin.show(
      notification.hashCode,
      notification.title,
      notification.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          channelDescription: channel.description,
          icon: 'launch_background',
        ),
      ),
    );
  } else {
    print("WEB SCUCC");
  }
}

late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
