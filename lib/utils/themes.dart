import '../packages/default_packages.dart';
import '../packages/utlis_packages.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

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
    _themeMode = prefs.getBool('isDarkMode') ?? false ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

//---------

final ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.teal,
  textTheme: TextTheme(bodyMedium: GoogleFonts.openSans(color: Colors.black)),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.black,
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: GoogleFonts.openSans(color: Colors.white, fontSize: 20),
  ),
  popupMenuTheme: PopupMenuThemeData(
    color: AppColors.lightTeal,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    textStyle: GoogleFonts.openSans(color: Colors.black),
  ),
  inputDecorationTheme: InputDecorationTheme(
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black87, width: 1.8),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.extraLightGrey, width: 1.6),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red, width: 1.8),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.redAccent, width: 2),
    ),
    labelStyle: GoogleFonts.openSans(color: AppColors.mediumGray),
  ),
  cardColor: Colors.teal,
  dialogTheme: DialogTheme(
    backgroundColor: AppColors.lightTeal,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    titleTextStyle: GoogleFonts.openSans(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
    contentTextStyle: GoogleFonts.openSans(color: Colors.black87, fontSize: 16),
  ),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: AppColors.darkGray,
    selectionColor: AppColors.extraLightGrey,
    selectionHandleColor: AppColors.darkGray,
  ),
  dropdownMenuTheme: DropdownMenuThemeData(
    textStyle: GoogleFonts.openSans(color: Colors.black),
    menuStyle: MenuStyle(
      backgroundColor: WidgetStateProperty.all(AppColors.lightTeal),
    ),
  ),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: AppColors.scaffoldColor,
  textTheme: TextTheme(bodyMedium: GoogleFonts.openSans(color: Colors.white)),
  popupMenuTheme: PopupMenuThemeData(
    color: Colors.black87,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    textStyle: TextStyle(color: Colors.white),
  ),
  dialogTheme: DialogTheme(
    backgroundColor: AppColors.darkGray,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    titleTextStyle: GoogleFonts.openSans(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
    contentTextStyle: GoogleFonts.openSans(color: Colors.grey.shade200, fontSize: 16),
  ),
  inputDecorationTheme: InputDecorationTheme(
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white, width: 1.8),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.dividerColor, width: 1.6),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red, width: 1.8),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.redAccent, width: 2),
    ),
    labelStyle: GoogleFonts.openSans(color: Colors.white),
  ),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: Colors.white,
    selectionColor: Colors.grey.shade700,
    selectionHandleColor: Colors.white,
  ),
  dropdownMenuTheme: DropdownMenuThemeData(
    textStyle: GoogleFonts.openSans(color: Colors.black),
    menuStyle: MenuStyle(
      backgroundColor: WidgetStateProperty.all(Colors.black87),
    ),
  ),
);
