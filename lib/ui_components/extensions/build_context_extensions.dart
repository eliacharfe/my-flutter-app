import 'package:flutter/material.dart';

extension DeviceInfoExtension on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;

  double get screenHeight => MediaQuery.of(this).size.height;

  bool get isSmallHeightDevice => screenHeight <= 700;
}
