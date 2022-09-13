import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class AppLoger {
  static final _logger = Logger();

  static void logVerbose(Object msg) {
    if (kDebugMode) {
      _logger.v(msg);
    }
  }

  static void logDebug(Object msg) {
    if (kDebugMode) {
      _logger.d(msg);
    }
  }

  static void logInfo(Object msg) {
    if (kDebugMode) {
      _logger.i(msg);
    }
  }

  static void logWarning(Object msg) {
    if (kDebugMode) {
      _logger.w(msg);
    }
  }

  static void logError(Object msg) {
    if (kDebugMode) {
      _logger.e(msg);
    }
  }

  static void logWTF(Object msg) {
    if (kDebugMode) {
      _logger.wtf(msg);
    }
  }

  static void logNetworkError(Exception e){
    if(e is DioError && kDebugMode){
      logError('msg - ${e.message}, status code - ${e.response?.statusCode}');
    }
  }
}
