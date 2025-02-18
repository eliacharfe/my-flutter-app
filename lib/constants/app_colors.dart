import 'package:flutter/material.dart';

// The colors for the application.

class AppColors {
  static const Color hmDarkBlue = Color.fromRGBO(8, 30, 73, 1);
  static const Color hmLightBlue = Color.fromRGBO(59, 135, 200, 1);
  static const Color hmWhite = Color(0xFFEEEFF5);
}

Color applyOpacity(Color color, double opacity) {
  return color.withValues(alpha: opacity);
}
