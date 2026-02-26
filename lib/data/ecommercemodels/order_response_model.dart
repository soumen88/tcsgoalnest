import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_response_model.freezed.dart';
part 'order_response_model.g.dart';

/// flutter pub run build_runner build --delete-conflicting-outputs
@freezed
abstract class OrderResponseModel with _$OrderResponseModel {
  const factory OrderResponseModel({
    @JsonKey(name: 'order_id') required int orderId,
    required String status,
    required String message,
  }) = _OrderResponseModel;

  factory OrderResponseModel.fromJson(Map<String, dynamic> json) =>
      _$OrderResponseModelFromJson(json);
}