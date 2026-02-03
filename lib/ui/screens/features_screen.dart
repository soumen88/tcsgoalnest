import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tcsgoalnest/core/constants/color_constants.dart';
import 'package:tcsgoalnest/core/constants/image_constants.dart';
import 'package:tcsgoalnest/ui/commonwidgets/bottom_navigation_button.dart';
import 'package:tcsgoalnest/ui/commonwidgets/filled_button_widget.dart';
import 'package:tcsgoalnest/ui/commonwidgets/regular_text_widget.dart';
import 'package:introduction_screen/introduction_screen.dart';

@RoutePage()
class FeaturesScreen extends StatelessWidget {

  final introKey = GlobalKey<IntroductionScreenState>();
  void _onIntroEnd(BuildContext context) {
    AutoTabsRouter.of(context).setActiveIndex(1);
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset(assetName, width: width);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
    );
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      allowImplicitScrolling: true,
      autoScrollDuration: 3000,
      infiniteAutoScroll: true,
      globalHeader: Align(
        alignment: Alignment.topLeft,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 16, left: 16),
            child: _buildImage(ImageConstants.kLogoWithTagline, 100),
          ),
        ),
      ),
      globalFooter: SizedBox(
        width: double.infinity,
        height: 60,
        child: BottomNavigationButton(
            buttonCaption: 'Let\'s go right away!',
            onButtonPress: (){
              _onIntroEnd(context);
            },
        ),
      ),
      pages: [
        PageViewModel(
          title: "Create Goals That Matter",
          body: "Define what you’re saving for and turn your financial goals into clear, achievable plans.",
          image: _buildImage(ImageConstants.kFeature1),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Save Smarter, Not Harder",
          body: "Track your savings automatically and see your progress grow with every contribution.",
          image: _buildImage(ImageConstants.kFeature2),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Track Every Step Forward",
          body: "Stay motivated by watching your goal progress update in real time, one step at a time.",
          image: _buildImage(ImageConstants.kFeature3),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Turn Dreams Into Achievements",
          body: "Set goals, follow your plan, and reach milestones that truly matter to you.",
          image: _buildImage(ImageConstants.kFeature4),
          decoration: pageDecoration.copyWith(
            contentMargin: const EdgeInsets.symmetric(horizontal: 16),
            bodyFlex: 2,
            imageFlex: 3,
            safeArea: 100,
          ),
        ),
      ],
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: false,
      //rtl: true, // Display as right-to-left
      back: const Icon(Icons.arrow_back),
      skip: RegularTextWidget(
        textToDisplay: 'Skip',
        fontSize: 16,
        textColor: ColorConstants.kWhiteColor,
      ),
      next: const Icon(
          Icons.arrow_forward,
          color: ColorConstants.kWhiteColor,
      ),
      done: RegularTextWidget(
          textToDisplay: 'Done',
          fontSize: 16,
          textColor: ColorConstants.kWhiteColor,
      ),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),

      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: ColorConstants.kWhiteColor,
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: ColorConstants.kDarkAzureColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}



