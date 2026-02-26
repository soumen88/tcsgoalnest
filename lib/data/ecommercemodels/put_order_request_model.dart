import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tcsgoalnest/data/ecommercemodels/order_item_model.dart';

part 'put_order_request_model.freezed.dart';
part 'put_order_request_model.g.dart';

@freezed
abstract class PutOrderRequestModel with _$PutOrderRequestModel {
  const factory PutOrderRequestModel({
    @JsonKey(name: 'user_id') required int userId,
    required List<OrderItemModel> items,
  }) = _PutOrderRequestModel;

  factory PutOrderRequestModel.fromJson(Map<String, dynamic> json) =>
      _$PutOrderRequestModelFromJson(json);
}

