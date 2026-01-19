import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@singleton
class LoggerUtil {
  void log({required String TAG, required String message}){
    if(kDebugMode){
      developer.log(message, name: TAG);
    }

  }
}