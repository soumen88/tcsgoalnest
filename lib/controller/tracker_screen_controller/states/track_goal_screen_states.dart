import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tcsgoalnest/core/schema/goal_store_data.dart';

part 'track_goal_screen_states.freezed.dart';

///flutter pub run build_runner build --delete-conflicting-outputs
@freezed
sealed class TrackGoalScreenStates with _$TrackGoalScreenStates{
  const factory TrackGoalScreenStates.displayLoadingView() = DisplayTrackerLoading;
  const factory TrackGoalScreenStates.error(String errorMessage) = DisplayTrackerError;
  const factory TrackGoalScreenStates.displaySingleGoal(GoalStoreData singleGoalDetails) = DisplaySingleGoal;
  const factory TrackGoalScreenStates.displayGoals() = DisplayAllGoals;
}