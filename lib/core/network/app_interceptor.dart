import 'package:dio/dio.dart';
import 'package:tcsgoalnest/core/dependency/injectable_setup.dart';
import 'package:tcsgoalnest/core/utils/logger_util.dart';

import 'custom_network_exception.dart';
import 'network_error_type_enum.dart';

class AppInterceptor extends Interceptor{
  final _logger = locator<LoggerUtil>();
  final _TAG = "AppInterceptor";
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _logger.log(TAG: _TAG, message: "Request: ${options.uri}");
    _logger.log(TAG: _TAG, message: "Request: ${options.data}");
    _logger.log(TAG: _TAG, message: "Request: ${options.headers}");
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _logger.log(TAG: _TAG, message: "Response: ${response.data}");
    if(isNullEmptyOrFalse(response.data)){

    }
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException error, ErrorInterceptorHandler handler) async{
    if(error.type == DioExceptionType.sendTimeout || error.type == DioExceptionType.receiveTimeout || error.type == DioExceptionType.connectionTimeout){
      final customNetworkException = await getCustomNetworkException(error.response);
      _logger.log(TAG: _TAG, message: "Custom network exception: ${customNetworkException.errorMessage}");
      error = DioException(
        requestOptions: error.requestOptions,
        type: DioExceptionType.badResponse,
        error: customNetworkException,
      );
    }
    handler.reject(error);
    
  }

  Future<CustomNetworkException> getCustomNetworkException(Response? response) async{
    if(response == null){
      return CustomNetworkException(
        errorResponseJsonMap: null,
        errorMessage: "No response from the server",
        errorCode: null,
        networkErrorType: NetworkErrorTypeEnum.SERVER_CONNECTION_ERROR,
      );
    }
    else{
      switch(response.statusCode){
        case 400:
          return CustomNetworkException(
            errorResponseJsonMap: response.data,
            errorMessage: response.statusMessage,
            errorCode: response.statusCode,
            networkErrorType: NetworkErrorTypeEnum.RESPONSE_ERROR,
          );
        case 401:
          return CustomNetworkException(
            errorResponseJsonMap: response.data,
            errorMessage: response.statusMessage,
            errorCode: response.statusCode,
            networkErrorType: NetworkErrorTypeEnum.UNAUTHORISED_ERROR,
          );
        case 404:
          return CustomNetworkException(
            errorResponseJsonMap: response.data,
            errorMessage: response.statusMessage,
            errorCode: response.statusCode,
            networkErrorType: NetworkErrorTypeEnum.INVALID_ENDPOINT_ERROR,
          );
        case 500:
          return CustomNetworkException(
            errorResponseJsonMap: response.data,
            errorMessage: response.statusMessage,
            errorCode: response.statusCode,
            networkErrorType: NetworkErrorTypeEnum.SERVER_CONNECTION_ERROR,
          );
        default:
          return CustomNetworkException(
            errorResponseJsonMap: response.data,
            errorMessage: response.statusMessage,
            errorCode: response.statusCode,
            networkErrorType: NetworkErrorTypeEnum.RESPONSE_ERROR,
          );
      }
    }
  }

  bool isNullEmptyOrFalse(dynamic value){
    if(value is Map<String, dynamic> || value is List<dynamic>){
      return value == null || value.length == 0;
    }
    else{
      return value == null || value == "" || value == false;
    } 
  }
}