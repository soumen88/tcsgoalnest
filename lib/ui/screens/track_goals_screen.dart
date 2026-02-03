import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcsgoalnest/controller/tracker_screen_controller/events/track_goal_screen_events.dart';
import 'package:tcsgoalnest/controller/tracker_screen_controller/track_goals_bloc.dart';
import 'package:tcsgoalnest/core/constants/color_constants.dart';
import 'package:tcsgoalnest/core/dependency/injectable_setup.dart';
import 'package:tcsgoalnest/core/schema/goal_store_data.dart';
import 'package:tcsgoalnest/core/table/activity_store_manager.dart';
import 'package:tcsgoalnest/core/table/goal_store_manager.dart';
import 'package:tcsgoalnest/ui/commonwidgets/bold_text_widget.dart';
import 'package:tcsgoalnest/ui/commonwidgets/creategoal/display_single_goal_details_widget.dart';
import 'package:tcsgoalnest/ui/commonwidgets/custom_loader.dart';
import 'package:tcsgoalnest/ui/commonwidgets/display_error_widget.dart';
import 'package:tcsgoalnest/ui/commonwidgets/empty_widget.dart';
import 'package:tcsgoalnest/ui/commonwidgets/goaltracker/goal_details_card_widget.dart';
import 'package:tcsgoalnest/ui/commonwidgets/regular_text_widget.dart';
import 'package:tcsgoalnest/ui/commonwidgets/tracker/completed_goals_widget.dart';
import 'package:tcsgoalnest/ui/commonwidgets/tracker/no_completed_goals_widget.dart';
import 'package:tcsgoalnest/ui/commonwidgets/tracker/pending_goals_widget.dart';
import 'package:tcsgoalnest/ui/commonwidgets/tracker/track_activities_widget.dart';

import '../../controller/tracker_screen_controller/states/track_goal_screen_states.dart';
import '../../core/schema/activity_tracker_data.dart';

@RoutePage()
class TrackGoalsScreen extends StatelessWidget {
  final _goalStoreManager = locator<GoalStoreManager>();
  final _activityManager = locator<ActivityStoreManager>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => TrackGoalsBloc()..add(TrackGoalScreenEvents.loadGoalsFromDatabase()),
      child: BlocConsumer<TrackGoalsBloc, TrackGoalScreenStates>(
        listener: (BuildContext context, TrackGoalScreenStates states) {},
        builder: (BuildContext context, TrackGoalScreenStates states) {
          return states.when(
            displayLoadingView: () {
              return CustomLoader();
            },
            error: (String errorMessage) {
              return DisplayErrorWidget(errorMessage: errorMessage);
            },
            displayGoals: () {
              return SafeArea(
                child: StreamBuilder<List<GoalStoreData>>(
                  stream: _goalStoreManager.listenToGoals(),
                  builder: (
                      BuildContext context,
                      AsyncSnapshot<List<GoalStoreData>> snapshot,
                      ) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CustomLoader();
                    }
                    else {
                      if (snapshot.hasError) {
                        return DisplayErrorWidget(
                          errorMessage: snapshot.error.toString(),
                        );
                      } else {
                        List<GoalStoreData> allGoals = snapshot.data!;
                        List<GoalStoreData> completedGoalsList = allGoals.where((GoalStoreData data) => data.isGoalCompleted == true).toList();
                        List<GoalStoreData> pendingGoalList = allGoals.where((GoalStoreData data) => data.isGoalCompleted == false).toList();;
                        return DefaultTabController(
                          length: 3,
                          child: Column(
                            children: [
                              TabBar(
                                indicatorColor: ColorConstants.kDarkAzureColor,
                                labelColor: ColorConstants.kDarkAzureColor,
                                indicatorSize: TabBarIndicatorSize.tab,
                                tabs: [
                                  Tab(
                                    text: "Pending Goals",
                                    icon: Icon(Icons.pending_actions_rounded),
                                  ),
                                  Tab(
                                    text: "Completed Goals",
                                    icon: Icon(Icons.check_circle_rounded),
                                  ),
                                  Tab(
                                    text: "Activities",
                                    icon: Icon(Icons.play_for_work),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: TabBarView(

                                  children: [
                                    PendingGoalsWidget(
                                        allPendingGoals: pendingGoalList,
                                        onEditPress: (int index){
                                          /*GoalStoreData storeData = pendingGoalList[index];
                                          storeData.isGoalCompleted = true;
                                          _goalStoreManager.markUpdatesOnAGoal(storeData);*/
                                          BlocProvider.of<TrackGoalsBloc>(context).add( TrackGoalScreenEvents.editAGoal(pendingGoalList[index]));
                                        },
                                    ),
                                    CompletedGoalsWidget(
                                      allCompletedGoals: completedGoalsList,
                                    ),
                                    TrackActivitiesWidget()
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                    }
                  },
                ),

              );
            },
            displaySingleGoal: (GoalStoreData singleGoalDetails){
              return DisplaySingleGoalDetailsWidget(
                  goalDetails: singleGoalDetails,
                  saveGoalPressed: (GoalStoreData updatedGoal){
                    _goalStoreManager.markUpdatesOnAGoal(updatedGoal);
                    var activity = ActivityTrackerData(
                        goalId: updatedGoal.goalId,
                        goalName: updatedGoal.goalName,
                        goalType: updatedGoal.goalType,
                        activityDate: DateTime.now(),
                        amountSaved: updatedGoal.currentAmount.toDouble()
                    );

                    _activityManager.saveActivity(activity);
                    BlocProvider.of<TrackGoalsBloc>(context).add(TrackGoalScreenEvents.loadGoalsFromDatabase());

                  },
              );
            }
          );
        },
      ),
    );
    return Scaffold(
      body: Center(
        child: RegularTextWidget(textToDisplay: "Inside Track screen"),
      ),
    );
  }
}
