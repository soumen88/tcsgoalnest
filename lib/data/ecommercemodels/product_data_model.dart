import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tcsgoalnest/data/ecommercemodels/product_review_model.dart';

part 'product_data_model.freezed.dart';
part 'product_data_model.g.dart';

///flutter pub run build_runner build --delete-conflicting-outputs
@freezed
abstract class ProductDataModel with _$ProductDataModel{
  @JsonSerializable(explicitToJson: true)
  const factory ProductDataModel({
    @JsonKey(name: "product_id")
    required int productId,
    required String name,
    required String description,
    required num price,
    required String unit,
    @JsonKey(name: "image")
    required String assetImagePath,
    required int discount,
    required bool availability,
    required String brand,
    required String category,
    required double rating,
    @JsonKey(name: "reviews")
    List<ProductReviewModel>? reviewsList,
    @JsonKey(includeToJson: false)
    @Default(0)
    int discountedPrice,
  }) = _ProductDataModel;

  factory ProductDataModel.fromJson(Map<String, Object?> json) => _$ProductDataModelFromJson(json);
}