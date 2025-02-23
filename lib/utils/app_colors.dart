import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppColors {
  static const Color scaffoldColor = Color.fromRGBO(248, 248, 248, 1.0);
  static const Color lightTeal = Color(0xFFE0F2F1);
  static const Color dividerColor = Color.fromRGBO(224, 224, 224, 1);
  static const Color extraLightGrey = Color.fromRGBO(239, 239, 240, 1);
  static const Color lightGray = Color.fromRGBO(199, 199, 199, 1);
  static const Color lightGray2 = Color.fromRGBO(189, 189, 189, 1);
  static const Color mediumGray = Color.fromRGBO(118, 118, 118, 1);
  static const Color darkGrayBlueishTint = Color.fromRGBO(107, 107, 112, 1);
  static const Color darkGray = Color.fromRGBO(73, 73, 73, 1);
  static const Color lightGrayishBlue = Color.fromRGBO(137, 138, 141, 1);
  static const Color darkGrayishBlue = Color.fromRGBO(73, 69, 79, 1);
  static const Color mutedGrayishPurple = Color.fromRGBO(121, 116, 126, 1);
  static const Color extremeLightGrey = Color.fromRGBO(0, 0, 0, 0.06);
  static const Color lightGrey = Color.fromRGBO(0, 0, 0, 0.38);
  static const Color red = Color.fromRGBO(198, 40, 40, 1);
}

Color applyOpacity(Color color, double opacity) {
  return color.withValues(alpha: opacity);
}

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: AppColors.darkGray,
  textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.white)),
);

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  Color get scaffoldColor {
    return themeMode == ThemeMode.dark ? AppColors.darkGray : AppColors.scaffoldColor;
  }

  void toggleTheme(bool isDark) async {
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', isDark);
  }

  Future<void> loadThemePreference() async {
    final prefs = await SharedPreferences.getInstance();
    _themeMode = prefs.getBool('isDarkMode') != null
        ? (prefs.getBool('isDarkMode')! ? ThemeMode.dark : ThemeMode.light)
        : ThemeMode.light;

    notifyListeners();
  }
}
