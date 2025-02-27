import 'package:eliachar_feig/models/note.dart';
import 'package:eliachar_feig/models/to_do.dart';
import '../../packages/default_packages.dart';
import '../../packages/utlis_packages.dart';

extension DeviceInfoExtension on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;

  double get screenHeight => MediaQuery.of(this).size.height;

  bool get isSmallHeightDevice => screenHeight <= 700;

  bool get isLargeDevice => screenWidth <= 800;

  bool get isDarkMode => themeProvider(listen: false).themeMode == ThemeMode.dark;

  Color get scaffoldColor => themeProvider(listen: false).scaffoldColor;

  ThemeData get theme => Theme.of(this);
}

extension NotifierExtension on BuildContext {
  NoteNotifier noteProvider({bool listen = true}) => Provider.of<NoteNotifier>(this, listen: listen);
  ToDoNotifier toDoNotifier({bool listen = true}) => Provider.of<ToDoNotifier>(this, listen: listen);
  ThemeProvider themeProvider({bool listen = true}) => Provider.of<ThemeProvider>(this, listen: listen);
  LocaleProvider localeProvider({bool listen = true}) => Provider.of<LocaleProvider>(this, listen: listen);
}
