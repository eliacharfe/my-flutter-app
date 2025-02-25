import '../packages/default_packages.dart';

class LocaleProvider extends ChangeNotifier {
  Locale _locale = Locale('en');

  Locale get locale => _locale;

  LocaleProvider() {
    loadLocale();
  }

  Future<void> setLocale(Locale locale) async {
    if (_locale == locale) return;
    _locale = locale;
    notifyListeners();
    await saveLocale();
  }

  Future<void> loadLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final languageCode = prefs.getString('language_code') ?? 'en';
    _locale = Locale(languageCode);
    notifyListeners();
  }

  Future<void> saveLocale() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language_code', _locale.languageCode);
  }
}
