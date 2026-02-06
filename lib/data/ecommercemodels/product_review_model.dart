import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_review_model.freezed.dart';
part 'product_review_model.g.dart';

///flutter pub run build_runner build --delete-conflicting-outputs
@freezed
abstract class ProductReviewModel with _$ProductReviewModel{
  @JsonSerializable(explicitToJson: true)
  const factory ProductReviewModel({
    @JsonKey(name: "user_id")
    required int userId,
    required int rating,
    required String comment,
  }) = _ProductReviewModel;

  factory ProductReviewModel.fromJson(Map<String, Object?> json) => _$ProductReviewModelFromJson(json);
}