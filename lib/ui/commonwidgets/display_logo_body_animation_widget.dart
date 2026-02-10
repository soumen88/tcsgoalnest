import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tcsgoalnest/ui/commonwidgets/regular_text_widget.dart';

import '../../core/constants/app_constants.dart';
import '../../core/constants/color_constants.dart';
import '../../core/constants/image_constants.dart';
import 'bold_text_widget.dart';

class DisplayLogoBodyAnimationWidget extends StatelessWidget {
  const DisplayLogoBodyAnimationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 2,
            child: Container(
              color: ColorConstants.kDarkAzureColor,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorConstants.kWhiteColor,
                ),
                child: Lottie.asset(ImageConstants.kSplashAnimation),
              ),
            )
        ),
        Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  ImageConstants.kLogoOnly,
                  width: 100,
                  height: 100,
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BoldTextWidget(
                      textToDisplay: AppConstants.kAppName,
                      fontSize: 32,
                    ),
                    RegularTextWidget(textToDisplay: AppConstants.kAppSubtitle)
                  ],
                ),
              ],
            )
        ),
      ],
    );
  }
}
