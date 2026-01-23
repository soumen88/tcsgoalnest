import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tcsgoalnest/data/models/goal_model.dart';

part 'goal_type_model.freezed.dart';
part 'goal_type_model.g.dart';

///flutter pub run build_runner build --delete-conflicting-outputs
@freezed
abstract class GoalTypeModel with _$GoalTypeModel{
  @JsonSerializable(explicitToJson: true)
  const factory GoalTypeModel({
    required String id,
    required String name,
    required String image,
    required List<GoalModel> goals,
  }) = _GoalTypeModel;

  factory GoalTypeModel.fromJson(Map<String, Object?> json) => _$GoalTypeModelFromJson(json);
}