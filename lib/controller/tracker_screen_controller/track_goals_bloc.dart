import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcsgoalnest/controller/tracker_screen_controller/events/track_goal_screen_events.dart';
import 'package:tcsgoalnest/controller/tracker_screen_controller/states/track_goal_screen_states.dart';
import 'package:tcsgoalnest/core/dependency/injectable_setup.dart';
import 'package:tcsgoalnest/core/utils/pretty_logger_util.dart';

class TrackGoalsBloc extends Bloc<TrackGoalScreenEvents, TrackGoalScreenStates>{
  final _logger = locator<PrettyLoggerUtil>();
  final _TAG = "TrackGoalsBloc";

  TrackGoalsBloc() : super(TrackGoalScreenStates.displayLoadingView()){
    on<TrackGoalScreenEvents>((event, emit) async{
      await event.map(
          loadGoalsFromDatabase: (event) async => _loadAllGoals(event, emit),
          editAGoal: (event) async => _editAGoal(event, emit),
          saveAGoalInDb: (event) async => _saveAGoal(event, emit),
      );
    });
  }

  Future<void> _loadAllGoals(LoadGoalsFromDatabaseEvent event, Emitter<TrackGoalScreenStates> emit) async{
    emit(TrackGoalScreenStates.displayGoals());

    /*await Future.delayed(Duration(seconds: 2), (){

    });*/

  }

  Future<void> _editAGoal(EditAGoalEvent event, Emitter<TrackGoalScreenStates> emit) async{
    emit(TrackGoalScreenStates.displaySingleGoal(event.storeData));
  }

  Future<void> _saveAGoal(SaveAGoalInDbEvent event, Emitter<TrackGoalScreenStates> emit) async{

  }

}