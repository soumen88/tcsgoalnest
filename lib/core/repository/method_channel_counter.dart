import 'dart:io';
import 'dart:math';

import 'package:flutter/services.dart';
import 'package:tcsgoalnest/core/dependency/injectable_setup.dart';
import 'package:tcsgoalnest/core/utils/pretty_logger_util.dart';

class MethodChannelCounter {
  ///Channel name is where we will create a pipeline. On same pipeline we can send the values as well
  ///as listen to incoming value
  static MethodChannel _channel = const MethodChannel("methodChannelDemo");
  static final _logger = locator<PrettyLoggerUtil>();
  static final _TAG = "MethodChannelCounter";
  static int presentCounterValue = 0;
  static Future<int> randomValue() async {
    if (Platform.isIOS) {
      var randomNumber = Random().nextInt(100);
      _logger.log(TAG: _TAG, message: "Random number generated $randomNumber");
      presentCounterValue = randomNumber;
      return randomNumber;
    } else {
      final result = await _channel.invokeMethod<int>("random");
      _logger.log(
        TAG: _TAG,
        message: "Result received from random function $result",
      );
      presentCounterValue = result ?? -1;
      return result ?? -1;
    }
  }

  static Future<int> increment() async {
    if (Platform.isIOS) {
      presentCounterValue = presentCounterValue + 1;
      return presentCounterValue;
    } else {
      final result = await _channel.invokeMethod<int>("increment", {
        'count': presentCounterValue,
      });
      _logger.log(TAG: _TAG, message: "Result from increment $result");
      presentCounterValue = result ?? -1;
      return presentCounterValue;
    }
  }

  static Future<int> decrement() async {
    if (Platform.isIOS) {
      presentCounterValue = presentCounterValue - 1;
      return presentCounterValue;
    } else {
      final result = await _channel.invokeMethod<int>("decrement", {
        'count': presentCounterValue,
      });
      _logger.log(TAG: _TAG, message: "Result from decrement $result");
      presentCounterValue = result ?? -1;
      return presentCounterValue;
    }
  }
}
