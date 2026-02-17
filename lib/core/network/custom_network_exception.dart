import 'package:tcsgoalnest/core/network/network_error_type_enum.dart';

class CustomNetworkException implements Exception{
  final String? errorResponseJsonMap;
  final String? errorMessage;
  final int? errorCode;
  final NetworkErrorTypeEnum? networkErrorType;

  CustomNetworkException({this.errorResponseJsonMap, this.errorMessage, this.errorCode, this.networkErrorType});

}