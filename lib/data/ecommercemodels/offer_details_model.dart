import 'package:freezed_annotation/freezed_annotation.dart';

import 'image_model.dart';

part 'offer_details_model.freezed.dart';
part 'offer_details_model.g.dart';

@freezed
abstract class OfferDetailsModel with _$OfferDetailsModel {
    const factory OfferDetailsModel({
        @JsonKey(name: "id")
        required int offerId,
        @JsonKey(name: "headline")
        required String headline,
        @JsonKey(name: "description")
        required String description,
        @JsonKey(name: "image")
        required ImageModel image,
        @JsonKey(name: "valid_until")
        required String validUntil,
        @JsonKey(name: "discount_percentage")
        required int discountPercentage,
    }) = _OfferDetailsModel;

  factory OfferDetailsModel.fromJson(Map<String, Object?> json) => _$OfferDetailsModelFromJson(json);
}