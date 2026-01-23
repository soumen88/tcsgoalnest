import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tcsgoalnest/data/models/example_target_amount_model.dart';

part 'goal_model.freezed.dart';
part 'goal_model.g.dart';

///flutter pub run build_runner build --delete-conflicting-outputs
@freezed
abstract class GoalModel with _$GoalModel{
  @JsonSerializable(explicitToJson: true)
  const factory GoalModel({
    required String name,
    required String description,
    @JsonKey(name: "typicalTimeFrame")
    required String timeFrame,
    required ExampleTargetAmountModel exampleTargetAmount,
  }) = _GoalModel;

  factory GoalModel.fromJson(Map<String, Object?> json) => _$GoalModelFromJson(json);
}