import 'package:flutter/foundation.dart';

class Log {
  ///show debug logs in console
  static void d(String log) {
    if (kDebugMode) {
      print(log);
    }
  }

  /// show error logs in console
  static void e(String error) {
    if (kDebugMode) {
      print("Error:: ${error.toString()}");
    }
  }
}
