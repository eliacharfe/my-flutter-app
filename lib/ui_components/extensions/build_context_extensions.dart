import '../../packages/default_packages.dart';
import '../../packages/utlis_packages.dart';

extension DeviceInfoExtension on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;

  double get screenHeight => MediaQuery.of(this).size.height;

  bool get isSmallHeightDevice => screenHeight <= 700;

  bool get isLargeDevice => screenWidth <= 800;

  bool get isDarkMode {
    return Provider.of<ThemeProvider>(this, listen: false).themeMode == ThemeMode.dark;
  }

  Color get scaffoldColor => Provider.of<ThemeProvider>(this, listen: false).scaffoldColor;
}
