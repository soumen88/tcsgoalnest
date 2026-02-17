import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../constants/app_constants.dart';
import '../utils/logger_util.dart';
import 'app_interceptor.dart';

@singleton
class DioUtils {
    final _logger = LoggerUtil();
    final _TAG = "DioUtils";

    Dio dio = Dio();

    Future<Dio> getDioInstance() async{
        final baseUrlOptions = BaseOptions(
            baseUrl: AppConstants.kBaseUrl,
            connectTimeout: Duration(seconds: 30),
            receiveTimeout: Duration(seconds: 60),
            sendTimeout: Duration(seconds: 30),
            /*connectTimeout: Duration(milliseconds: 1),
            receiveTimeout: Duration(milliseconds: 1),
            sendTimeout: Duration(milliseconds: 1),*/
            contentType: Headers.jsonContentType,
            responseType: ResponseType.json,
            followRedirects: true,
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json',
            },
        );

        dio = Dio(baseUrlOptions);
        dio.interceptors.add(AppInterceptor());
        return dio;
    }
}