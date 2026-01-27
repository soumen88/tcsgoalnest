import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcsgoalnest/controller/goal_screen_controller/events/goal_screen_events.dart';
import 'package:tcsgoalnest/controller/goal_screen_controller/states/goal_screen_states.dart';
import 'package:tcsgoalnest/core/constants/app_constants.dart';
import 'package:tcsgoalnest/core/dependency/injectable_setup.dart';
import 'package:tcsgoalnest/core/utils/firebase_remote_config_service.dart';
import 'package:tcsgoalnest/core/utils/pretty_logger_util.dart';
import 'package:tcsgoalnest/data/models/goal_categories_model.dart';

///This class goal bloc is a diligent teacher and it will be commanding all
///actions for the students to follow
class GoalsBloc extends Bloc<GoalScreenEvents, GoalScreenStates>{

  final _logger = locator<PrettyLoggerUtil>();
  final _TAG = "GoalsBloc";
  final FirebaseRemoteConfigService _remoteConfigService = FirebaseRemoteConfigService();

  //GoalsBloc() : super(const GoalScreenStates.errorView(" Something went wrong in loading goals"));
  GoalsBloc() : super(const GoalScreenStates.loadingView()){
    on<GoalScreenEvents>((event, emit) async{
      await event.map(
          loadGoalsFromFirebase: (event) async => await _getDataFromFirebase(event, emit),
          goalSelected: (event) async => await _onGoalSelected(event, emit),
      );
    });
  }

  Future<void> _getDataFromFirebase(LoadGoalsFromFirebaseEvent event, Emitter<GoalScreenStates> emit) async{
    try{
      _logger.log(TAG: _TAG, message: "Received event to get data from firebase");
      String goalJson = await _remoteConfigService.getString(AppConstants.kGoalJsonKey);
      ///Deserialize above goal json and convert to a model
      GoalCategoriesModel categoriesModel = GoalCategoriesModel.fromJson(jsonDecode(goalJson));
      emit(GoalScreenStates.displayAllGoals(categoriesModel));
    }
    catch(exception, stackTrace){
      _logger.log(TAG: _TAG, message: "Exception occurred $exception and stackTrace $stackTrace");
      emit(GoalScreenStates.errorView("Exception occurred $exception and stackTrace $stackTrace"));
    }
  }

  Future<void> _onGoalSelected(GoalSelectedEvent event, Emitter<GoalScreenStates> emit) async{
    emit(GoalScreenStates.fillGoalDetailsView(event.goalSelected));
  }
}