import 'package:intl/intl.dart';

class DateHelper {
  static String getTodayDate() {
    final now = DateTime.now();
    final formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(now);
  }
}
