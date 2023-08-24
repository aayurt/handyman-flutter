import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:handyman/bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';
import 'core/service_locator/service_locator.dart';

void main() async {
  setPathUrlStrategy();
  String envFile = kReleaseMode ? '.env.development' : '.env.production';
  await dotenv.load(fileName: envFile);
  await setUpServiceLocator();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const BlocProviderContainer());
}
