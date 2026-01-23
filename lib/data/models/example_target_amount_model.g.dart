// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example_target_amount_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ExampleTargetAmountModel _$ExampleTargetAmountModelFromJson(
  Map<String, dynamic> json,
) => _ExampleTargetAmountModel(
  minAmount: (json['min'] as num?)?.toInt(),
  maxAmount: (json['max'] as num?)?.toInt(),
  currency: json['currency'] as String,
);

Map<String, dynamic> _$ExampleTargetAmountModelToJson(
  _ExampleTargetAmountModel instance,
) => <String, dynamic>{
  'min': instance.minAmount,
  'max': instance.maxAmount,
  'currency': instance.currency,
};
