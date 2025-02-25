import '../packages/default_packages.dart';

class LocaleProvider extends ChangeNotifier {
  Locale _locale = Locale('en'); // Default language

  Locale get locale => _locale;

  void setLocale(Locale locale) {
    _locale = locale;
    notifyListeners();
  }

  Future<void> loadLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final languageCode = prefs.getString('language_code') ?? 'en';
    _locale = Locale(languageCode);
    notifyListeners();
  }

  Future<void> saveLocale() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('language_code', _locale.languageCode);
  }
}
