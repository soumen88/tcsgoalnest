import 'package:flutter/material.dart';
import 'package:tcsgoalnest/core/constants/app_constants.dart';
import 'package:tcsgoalnest/core/constants/image_constants.dart';
import 'package:tcsgoalnest/ui/commonwidgets/bold_text_widget.dart';
import 'package:tcsgoalnest/ui/commonwidgets/regular_text_widget.dart';

class NoCompletedGoalsWidget extends StatelessWidget {
  const NoCompletedGoalsWidget({super.key});

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
                textToDisplay: AppConstants.kNoGoalCompletedTitle
            ),
            Image.asset(
                ImageConstants.kLogoOnly,
                width: 100,
                height: 100,
            ),
            RegularTextWidget(
                textToDisplay: AppConstants.kNoGoalCompletedDescription,
                textAlignment: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
