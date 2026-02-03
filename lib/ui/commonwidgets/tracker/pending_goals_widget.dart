import 'package:flutter/material.dart';
import 'package:tcsgoalnest/core/schema/goal_store_data.dart';

import '../../../core/utils/goal_status_enum.dart';
import '../goaltracker/goal_details_card_widget.dart';
import 'no_completed_goals_widget.dart';

class PendingGoalsWidget extends StatelessWidget {

  final List<GoalStoreData> allPendingGoals;
  final Function(int indexOfEditGoal) onEditPress;

  const PendingGoalsWidget({super.key, required this.allPendingGoals, required this.onEditPress});

  @override
  Widget build(BuildContext context) {
    return Builder(
        builder: (BuildContext context){
          if(allPendingGoals.isEmpty){
            return NoCompletedGoalsWidget(
              widgetEnum: GoalStatusEnum.NO_PENDING_GOALS,
            );
          }
          else{
            return ListView.builder(
              itemCount: allPendingGoals.length,
              itemBuilder: (BuildContext context, int index) {
                GoalStoreData currentGoalData = allPendingGoals[index];
                return GoalDetailsCardWidget(
                  goalDetails: currentGoalData,
                  onEditGoalPress: (){
                    onEditPress.call(index);
                  },
                );
              },
            );
          }
        }
    );

  }
}
