import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tcsgoalnest/core/schema/goal_store_data.dart';
import 'package:tcsgoalnest/data/models/goal_model.dart';
import 'package:tcsgoalnest/data/models/goal_type_model.dart';

part 'track_goal_screen_events.freezed.dart';

///flutter pub run build_runner build --delete-conflicting-outputs
@freezed
sealed class TrackGoalScreenEvents with _$TrackGoalScreenEvents{
  const factory TrackGoalScreenEvents.loadGoalsFromDatabase() = LoadGoalsFromDatabaseEvent;
  const factory TrackGoalScreenEvents.editAGoal(GoalStoreData storeData) = EditAGoalEvent;
  const factory TrackGoalScreenEvents.saveAGoalInDb() = SaveAGoalInDbEvent;
}