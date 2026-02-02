import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tcsgoalnest/core/constants/app_constants.dart';
import 'package:tcsgoalnest/core/constants/image_constants.dart';
import 'package:tcsgoalnest/ui/commonwidgets/bold_text_widget.dart';
import 'package:tcsgoalnest/ui/commonwidgets/regular_text_widget.dart';

class NoGoalsWidget extends StatelessWidget {
  const NoGoalsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          spacing: 10,
          children: [
            BoldTextWidget(
                textToDisplay: AppConstants.kWhyCreateGoalTitle
            ),
            Lottie.asset(ImageConstants.kFallJson),
            RegularTextWidget(
                textToDisplay: AppConstants.kWhyCreateGoalDescription
            ),
          ],
        ),
      ),
    );
  }
}
