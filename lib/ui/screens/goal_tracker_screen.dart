import 'dart:convert';
import 'dart:math';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcsgoalnest/controller/goal_screen_controller/events/goal_screen_events.dart';
import 'package:tcsgoalnest/controller/goal_screen_controller/goals_bloc.dart';
import 'package:tcsgoalnest/controller/goal_screen_controller/states/goal_screen_states.dart';
import 'package:tcsgoalnest/core/constants/image_constants.dart';
import 'package:tcsgoalnest/core/dependency/injectable_setup.dart';
import 'package:tcsgoalnest/core/utils/firebase_remote_config_service.dart';
import 'package:tcsgoalnest/core/utils/logger_util.dart';
import 'package:tcsgoalnest/data/models/goal_categories_model.dart';
import 'package:tcsgoalnest/data/models/goal_model.dart';
import 'package:tcsgoalnest/data/models/goal_type_model.dart';
import 'package:tcsgoalnest/ui/commonwidgets/bold_text_widget.dart';
import 'package:tcsgoalnest/ui/commonwidgets/creategoal/fill_goal_details_widget.dart';
import 'package:tcsgoalnest/ui/commonwidgets/custom_app_bar.dart';
import 'package:tcsgoalnest/ui/commonwidgets/custom_loader.dart';
import 'package:tcsgoalnest/ui/commonwidgets/display_error_widget.dart';
import 'package:tcsgoalnest/ui/commonwidgets/filled_button_widget.dart';
import 'package:tcsgoalnest/ui/commonwidgets/outline_button_widget.dart';
import 'package:tcsgoalnest/ui/commonwidgets/regular_text_widget.dart';

///This class is a obedient student that would follow all the commands from teacher
@RoutePage()
class GoalTrackerScreen extends StatelessWidget {
  final _logger = locator<LoggerUtil>();
  final _TAG = "GoalTrackerScreen";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => GoalsBloc()..add(const GoalScreenEvents.loadGoalsFromFirebase()),
        child: BlocConsumer<GoalsBloc, GoalScreenStates>(
          listener: (BuildContext context, GoalScreenStates states){

          },
          builder: (BuildContext context, GoalScreenStates states){
              return states.when(
                  loadingView: (){
                    return CustomLoader();
                  },
                  errorView: (String errorMessageReceived){
                    return DisplayErrorWidget(
                      errorMessage: errorMessageReceived,
                    );
                  },
                  displayAllGoals: (GoalCategoriesModel categories){

                    return Scaffold(
                      appBar: CustomAppBar(),
                      body: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: BoldTextWidget(
                                textToDisplay: "Choose A goal from below categories",
                                fontSize: 20,
                                textAlignment: TextAlign.center,
                            ),
                          ),
                          Expanded(
                              child: ListView.builder(
                                  itemCount: categories.goalCategories.length,
                                  itemBuilder: (BuildContext context, int index){
                                    GoalTypeModel goalTypeModel = categories.goalCategories[index];
                                    return ExpansionTile(
                                      title: Row(
                                        children: [
                                          CircleAvatar(
                                            minRadius: 30,
                                            maxRadius: 30,
                                            child: Image.asset(
                                                goalTypeModel.image,
                                                fit: BoxFit.contain,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          BoldTextWidget(
                                              textToDisplay: goalTypeModel.name,
                                              fontSize: 22,
                                          )
                                        ],
                                      ),
                                      children: [
                                        ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: goalTypeModel.goals.length,
                                            itemBuilder: (BuildContext context, int index){
                                              GoalModel currentGoalModel = goalTypeModel.goals[index];
                                              return GestureDetector(
                                                onTap: (){
                                                  BlocProvider.of<GoalsBloc>(context).add(GoalScreenEvents.goalSelected(currentGoalModel));
                                                },
                                                child: Card(
                                                  child: Padding(
                                                      padding: EdgeInsets.all(10),
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Icon(Icons.info),
                                                              SizedBox(
                                                                width: 10,
                                                              ),
                                                              RegularTextWidget(
                                                                  textToDisplay: currentGoalModel.name
                                                              )
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          Row(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              RegularTextWidget(
                                                                  textToDisplay: "Here you can include - "
                                                              ),
                                                              Expanded(child: RegularTextWidget(textToDisplay: currentGoalModel.description))
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                  ),
                                                ),
                                              );
                                            }
                                        )
                                      ],
                                    );
                                  }
                              )
                          )
                        ],
                      )
                    );
                  },
                  fillGoalDetailsView: (GoalModel goalSelectedByUser){
                    return FillGoalDetailsWidget(
                        goalSelectedByUser: goalSelectedByUser,
                        chooseDifferentGoalPress: (){
                          BlocProvider.of<GoalsBloc>(context).add(GoalScreenEvents.loadGoalsFromFirebase());
                        },
                    );
                  }
              );
          },
        ),
    );
  }
}
