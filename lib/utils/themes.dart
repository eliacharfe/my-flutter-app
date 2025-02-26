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
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black,
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
  ),
  popupMenuTheme: PopupMenuThemeData(
    color: AppColors.lightTeal,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    textStyle: TextStyle(color: Colors.black),
  ),
  inputDecorationTheme: InputDecorationTheme(
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.teal, width: 1.8),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.lightTeal, width: 1.6),
    ),
    labelStyle: TextStyle(color: Colors.teal.shade300),
  ),
  cardColor: Colors.teal,
  dialogTheme: DialogTheme(
    backgroundColor: AppColors.lightTeal,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    titleTextStyle: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
    contentTextStyle: TextStyle(color: Colors.black87, fontSize: 16),
  ),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: Colors.teal,
    selectionColor: Colors.teal.shade200,
    selectionHandleColor: Colors.teal,
  ),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: AppColors.scaffoldColor,
  textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.white)),
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
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
    contentTextStyle: TextStyle(color: Colors.grey.shade200, fontSize: 16),
  ),
  inputDecorationTheme: InputDecorationTheme(
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white, width: 1.8),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.dividerColor, width: 1.6),
    ),
    labelStyle: TextStyle(color: Colors.white),
  ),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: Colors.white,
    selectionColor: Colors.grey.shade700,
    selectionHandleColor: Colors.white,
  ),
);
