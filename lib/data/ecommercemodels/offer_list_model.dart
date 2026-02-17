import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tcsgoalnest/data/ecommercemodels/offer_details_model.dart';

part 'offer_list_model.freezed.dart';
part 'offer_list_model.g.dart';

///flutter pub run build_runner build --delete-conflicting-outputs
@freezed
abstract class OfferListModel with _$OfferListModel {
    const factory OfferListModel({
        @JsonKey(name: "offers")
        required List<OfferDetailsModel> offerList,
    }) = _OfferListModel;

    factory OfferListModel.fromJson(Map<String, Object?> json) => _$OfferListModelFromJson(json);
}