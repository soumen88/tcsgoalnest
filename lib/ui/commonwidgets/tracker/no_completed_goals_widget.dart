import 'package:flutter/material.dart';
import 'package:tcsgoalnest/core/constants/app_constants.dart';
import 'package:tcsgoalnest/core/constants/image_constants.dart';
import 'package:tcsgoalnest/core/enumerations/goal_status_enum.dart';
import 'package:tcsgoalnest/ui/commonwidgets/bold_text_widget.dart';
import 'package:tcsgoalnest/ui/commonwidgets/regular_text_widget.dart';

class NoCompletedGoalsWidget extends StatefulWidget {
  final GoalStatusEnum widgetEnum;
  const NoCompletedGoalsWidget({super.key, required this.widgetEnum});

  @override
  State<NoCompletedGoalsWidget> createState() => _NoCompletedGoalsWidgetState();
}

class _NoCompletedGoalsWidgetState extends State<NoCompletedGoalsWidget> {

  String? title;
  String? description;

  @override
  void initState() {
    switch(widget.widgetEnum){

      case GoalStatusEnum.NO_GOALS_COMPLETED:
        title = AppConstants.kNoGoalCompletedTitle;
        description = AppConstants.kNoGoalCompletedDescription;
      case GoalStatusEnum.NO_PENDING_GOALS:
        title = AppConstants.kNoPendingGoalsTitle;
        description = AppConstants.kNoPendingGoalDescription;
      case GoalStatusEnum.NO_ACTIVITY_FOUND:
        title = AppConstants.kNoActivityTitle;
        description = AppConstants.kNoActivityDescription;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Center(
        child: Column(
          spacing: 10,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.emoji_events_outlined,
              size: 72,
            ),
            BoldTextWidget(
                textToDisplay: title ?? ''
            ),
            Image.asset(
                ImageConstants.kLogoOnly,
                width: 100,
                height: 100,
            ),
            RegularTextWidget(
                textToDisplay: description ?? '',
                textAlignment: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
