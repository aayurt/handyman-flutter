import 'package:handyman/routes/routes.dart';
import 'package:handyman/theme/theme_service.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Handyman',
        debugShowCheckedModeBanner: false,
        home: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.light,
          theme: ThemeService.lightThemeData,
          darkTheme: ThemeService.darkThemeData,
          routerConfig: Routes.router,
          title: "Handyman App",
        ));
  }
}
