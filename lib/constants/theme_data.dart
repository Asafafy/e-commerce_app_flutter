import 'package:flutter/material.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor: isDarkTheme ? const Color(0xFF344d59) : const Color(0xFFeeeeee),
      primaryColor: Colors.blue,
      colorScheme: ThemeData().colorScheme.copyWith(
        secondary: isDarkTheme ? const Color(0xFF1a1f3c) : const Color(0xFFe8fdfd),
        brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      ),
      cardColor: isDarkTheme ? const Color(0xFF0a0d2c) : const Color(0xFFf2fdfd),
      canvasColor: isDarkTheme ? Colors.black : Colors.grey.shade50,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
        colorScheme: isDarkTheme ? const ColorScheme.dark() : const ColorScheme.light(),
      ),
    );
  }
}