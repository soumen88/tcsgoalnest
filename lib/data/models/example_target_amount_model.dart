import 'package:freezed_annotation/freezed_annotation.dart';

part 'example_target_amount_model.freezed.dart';
part 'example_target_amount_model.g.dart';

///flutter pub run build_runner build --delete-conflicting-outputs
@freezed
abstract class ExampleTargetAmountModel with _$ExampleTargetAmountModel{
  @JsonSerializable(explicitToJson: true)
  const factory ExampleTargetAmountModel({
    @JsonKey(name: "min")
    int? minAmount,
    @JsonKey(name: "max")
    int? maxAmount,
    required String currency,
  }) = _ExampleTargetAmountModel;

  factory ExampleTargetAmountModel.fromJson(Map<String, Object?> json) => _$ExampleTargetAmountModelFromJson(json);
}