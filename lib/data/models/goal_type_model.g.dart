// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goal_type_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GoalTypeModel _$GoalTypeModelFromJson(Map<String, dynamic> json) =>
    _GoalTypeModel(
      id: json['id'] as String,
      name: json['name'] as String,
      image: json['image'] as String,
      goals: (json['goals'] as List<dynamic>)
          .map((e) => GoalModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GoalTypeModelToJson(_GoalTypeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'goals': instance.goals.map((e) => e.toJson()).toList(),
    };
