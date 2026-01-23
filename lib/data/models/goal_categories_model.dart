import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tcsgoalnest/data/models/goal_type_model.dart';

part 'goal_categories_model.freezed.dart';
part 'goal_categories_model.g.dart';

///flutter pub run build_runner build --delete-conflicting-outputs
@freezed
abstract class GoalCategoriesModel with _$GoalCategoriesModel{
  @JsonSerializable(explicitToJson: true)
  const factory GoalCategoriesModel({
    @JsonKey(name: "categories")
    required List<GoalTypeModel> goalCategories,
  }) = _GoalCategoriesModel;

  factory GoalCategoriesModel.fromJson(Map<String, Object?> json) => _$GoalCategoriesModelFromJson(json);
}