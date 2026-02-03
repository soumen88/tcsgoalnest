import 'package:flutter/material.dart';
import 'package:tcsgoalnest/core/utils/goal_status_enum.dart';
import 'package:tcsgoalnest/ui/commonwidgets/filled_button_widget.dart';

import '../../../core/schema/goal_store_data.dart';
import '../goaltracker/goal_details_card_widget.dart';
import 'no_completed_goals_widget.dart';

class CompletedGoalsWidget extends StatelessWidget {
  final List<GoalStoreData> allCompletedGoals;
  const CompletedGoalsWidget({super.key, required this.allCompletedGoals});

  @override
  Widget build(BuildContext context) {
    return Builder(
        builder: (BuildContext context){
          if(allCompletedGoals.isEmpty){
            return NoCompletedGoalsWidget(
              widgetEnum: GoalStatusEnum.NO_GOALS_COMPLETED,
            );
          }
          else{
            return ListView.builder(
              itemCount: allCompletedGoals.length,
              itemBuilder: (BuildContext context, int index) {
                GoalStoreData currentGoalData = allCompletedGoals[index];
                return GoalDetailsCardWidget(
                  goalDetails: currentGoalData,
                );
              },
            );
          }
        }
    );

  }
}
