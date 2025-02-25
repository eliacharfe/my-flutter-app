import 'package:eliachar_feig/l10n/l10n.dart';
import '../../packages/default_packages.dart';
import '../../packages/utlis_packages.dart';

extension DeviceInfoExtension on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;

  double get screenHeight => MediaQuery.of(this).size.height;

  bool get isSmallHeightDevice => screenHeight <= 700;

  bool get isLargeDevice => screenWidth <= 800;

  bool get isDarkMode => Provider.of<ThemeProvider>(this, listen: false).themeMode == ThemeMode.dark;

  Color get scaffoldColor => Provider.of<ThemeProvider>(this, listen: false).scaffoldColor;
}

extension LocalizationExtension on BuildContext {
  String get language => S.of(this).language;
  String get changeLanguage => S.of(this).change_language;
  String get darkMode => S.of(this).dark_mode;
  String get lightMode => S.of(this).light_mode;
  String get selectedLanguage => S.of(this).selectedLanguage;
}
