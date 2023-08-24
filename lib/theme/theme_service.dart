import 'package:flutter/material.dart';

class ThemeService with ChangeNotifier {
  static const _lightFillColor = Colors.black;
  static const _darkFillColor = Colors.white;

  static final Color _lightFocusColor = Colors.black.withOpacity(0.12);
  static final Color _darkFocusColor = Colors.white.withOpacity(0.12);
  static TextTheme _buildTextTheme() {
    return const TextTheme(
      displayLarge: TextStyle(
        fontWeight: FontWeight.w300,
        fontSize: 96,
      ),
      displayMedium: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 60,
      ),
      displaySmall: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 48,
      ),
      headlineLarge: TextStyle(
        fontSize: 12,
      ),
      headlineMedium: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 34,
      ),
      headlineSmall: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 24,
      ),
      titleLarge: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
      titleMedium: TextStyle(
          fontWeight: FontWeight.w500, fontSize: 16, letterSpacing: 0.5),
      titleSmall: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 12,
      ),
      bodyLarge: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
      bodyMedium: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 14,
      ),
      bodySmall: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 12,
      ),
      labelLarge: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 13,
      ),
      labelMedium: TextStyle(
        fontSize: 12,
      ),
      labelSmall: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 12,
      ),
    );
  }

  static ColorScheme lightColorScheme = const ColorScheme(
    primary: Color(0xFFB93C5D),
    primaryContainer: Color(0xFF117378),
    secondary: Color(0xFFEFF3F3),
    secondaryContainer: Color(0xFFFAFBFB),
    background: Color(0xFFE6EBEB),
    surface: Color(0xFFFAFBFB),
    onBackground: Colors.white,
    error: _lightFillColor,
    onError: _lightFillColor,
    onPrimary: _lightFillColor,
    onSecondary: Color(0xFF322942),
    onSurface: Color(0xFF241E30),
    brightness: Brightness.light,
  );

  static ColorScheme darkColorScheme = const ColorScheme(
    primary: Color(0xFFFF8383),
    primaryContainer: Color(0xFF1CDEC9),
    secondary: Color(0xFF4D1F7C),
    secondaryContainer: Color(0xFF451B6F),
    background: Color(0xFF241E30),
    surface: Color(0xFF1F1929),
    onBackground: Color(0x0DFFFFFF), // White with 0.05 opacity
    error: _darkFillColor,
    onError: _darkFillColor,
    onPrimary: _darkFillColor,
    onSecondary: _darkFillColor,
    onSurface: _darkFillColor,
    brightness: Brightness.dark,
  );
  static ThemeData lightThemeData =
      themeData(lightColorScheme, _lightFocusColor);

  static ThemeData darkThemeData = themeData(darkColorScheme, _darkFocusColor);
  static ThemeData themeData(
    ColorScheme colorScheme,
    Color focusColor,
  ) {
    return ThemeData(
        fontFamily: "Montserrat",
        colorScheme: colorScheme,
        appBarTheme: AppBarTheme(
          backgroundColor: colorScheme.background,
          elevation: 0,
          iconTheme: IconThemeData(color: colorScheme.primary),
        ),
        iconTheme: IconThemeData(color: colorScheme.onPrimary),
        textTheme: _buildTextTheme(),
        canvasColor: colorScheme.background,
        scaffoldBackgroundColor: colorScheme.background,
        highlightColor: Colors.transparent,
        focusColor: focusColor,
        snackBarTheme: SnackBarThemeData(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Color.alphaBlend(
            _lightFillColor.withOpacity(0.80),
            _darkFillColor,
          ),
        ));
  }
}
