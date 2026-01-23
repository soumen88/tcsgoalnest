import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tcsgoalnest/data/models/goal_categories_model.dart';

part 'goal_screen_states.freezed.dart';

///flutter pub run build_runner build --delete-conflicting-outputs
@freezed
sealed class GoalScreenStates with _$GoalScreenStates{
  const factory GoalScreenStates.loadingView() = DisplayLoadingView;
  const factory GoalScreenStates.errorView(String errorMessage) = DisplayErrorView;
  const factory GoalScreenStates.displayAllGoals(GoalCategoriesModel goalCategories) = DisplayAllGoalsView;
}