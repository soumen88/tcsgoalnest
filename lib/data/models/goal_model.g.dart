// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goal_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GoalModel _$GoalModelFromJson(Map<String, dynamic> json) => _GoalModel(
  name: json['name'] as String,
  description: json['description'] as String,
  timeFrame: json['typicalTimeFrame'] as String,
  exampleTargetAmount: ExampleTargetAmountModel.fromJson(
    json['exampleTargetAmount'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$GoalModelToJson(_GoalModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'typicalTimeFrame': instance.timeFrame,
      'exampleTargetAmount': instance.exampleTargetAmount.toJson(),
    };
