import 'dart:developer' as logger;
import 'package:flutter/foundation.dart';

class Logger {
  /// Boolean flag indicating weather we want to print logs in release mode or not.
  static bool printInRelease = false;

  /// Logs a given object.
  static void log(String o) {
    if (kDebugMode) {
      logger.log(o);
    } else if (printInRelease) {
      debugPrint(o);
    }
  }
}
