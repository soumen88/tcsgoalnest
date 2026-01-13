import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tcsgoalnest/core/constants/app_constants.dart';
import 'package:tcsgoalnest/core/constants/color_constants.dart';
import 'package:tcsgoalnest/core/constants/image_constants.dart';
import 'package:tcsgoalnest/core/routing/app_router.dart';
import 'package:tcsgoalnest/ui/commonwidgets/bold_text_widget.dart';
import 'package:tcsgoalnest/ui/commonwidgets/bottom_navigation_button.dart';
import 'package:tcsgoalnest/ui/commonwidgets/filled_button_widget.dart';
import 'package:tcsgoalnest/ui/commonwidgets/regular_text_widget.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.kWhiteColor,
      body: Column(
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
      ),
      bottomNavigationBar: SafeArea(
          child: BottomNavigationButton(
              buttonCaption: "Let's Get Started",
              onButtonPress: (){
                  context.router.push(const HomeRoute());
              },
          )
      ),
    );
  }
}
