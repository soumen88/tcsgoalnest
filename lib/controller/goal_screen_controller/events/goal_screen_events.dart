import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tcsgoalnest/data/models/goal_model.dart';
import 'package:tcsgoalnest/data/models/goal_type_model.dart';

part 'goal_screen_events.freezed.dart';

///flutter pub run build_runner build --delete-conflicting-outputs
@freezed
sealed class GoalScreenEvents with _$GoalScreenEvents{
  const factory GoalScreenEvents.loadGoalsFromFirebase() = LoadGoalsFromFirebaseEvent;
  const factory GoalScreenEvents.goalSelected(GoalTypeModel goalSelected) = GoalSelectedEvent;
}