import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@singleton
class PrettyLoggerUtil {

  var logger = Logger(
    printer: PrettyPrinter(),
  );

  void log({required String TAG, required String message}){
    logger.e(message, time: DateTime.timestamp());
  }

}