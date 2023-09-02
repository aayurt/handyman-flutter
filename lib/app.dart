import 'package:flutter/material.dart';
import 'package:handyman/firebase_token.dart';
import 'package:handyman/firebase_wrapper.dart';
import 'package:handyman/routes/routes.dart';
import 'package:handyman/theme/colors.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(const Duration(milliseconds: 0), () async {
      await setFcmToken();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Handyman',
        debugShowCheckedModeBanner: false,
        home: FirebaseWrapper(
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: ThemeData.from(colorScheme: lightThemeColors(context)),
            darkTheme: ThemeData.from(colorScheme: darkThemeColors(context)),
            routerConfig: Routes.router,
            title: "Handyman App",
          ),
        ));
  }
}
