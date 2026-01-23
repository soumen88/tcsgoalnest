// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goal_categories_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GoalCategoriesModel _$GoalCategoriesModelFromJson(Map<String, dynamic> json) =>
    _GoalCategoriesModel(
      goalCategories: (json['categories'] as List<dynamic>)
          .map((e) => GoalTypeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GoalCategoriesModelToJson(
  _GoalCategoriesModel instance,
) => <String, dynamic>{
  'categories': instance.goalCategories.map((e) => e.toJson()).toList(),
};
