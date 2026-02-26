import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_item_model.freezed.dart';
part 'order_item_model.g.dart';

///flutter pub run build_runner build --delete-conflicting-outputs
@freezed
abstract class OrderItemModel with _$OrderItemModel {
  const factory OrderItemModel({
    @JsonKey(name: 'product_id') required int productId,
    required int quantity,
  }) = _OrderItemModel;

  factory OrderItemModel.fromJson(Map<String, dynamic> json) =>
      _$OrderItemModelFromJson(json);
}