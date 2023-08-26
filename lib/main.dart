import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutter/material.dart';
import 'package:handyman/bloc_provider.dart';
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
  setPathUrlStrategy();

  runApp(const BlocProviderContainer());
}
