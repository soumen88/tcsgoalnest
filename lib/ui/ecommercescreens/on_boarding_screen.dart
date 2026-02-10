import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:objectbox/objectbox.dart';
import 'package:tcsgoalnest/controller/onboarding_screen_controller/events/on_boarding_screen_events.dart';
import 'package:tcsgoalnest/controller/onboarding_screen_controller/on_boarding_bloc.dart';
import 'package:tcsgoalnest/controller/onboarding_screen_controller/states/on_boarding_screen_states.dart';
import 'package:tcsgoalnest/core/constants/color_constants.dart';
import 'package:tcsgoalnest/core/constants/image_constants.dart';
import 'package:tcsgoalnest/ui/commonwidgets/bold_text_widget.dart';
import 'package:tcsgoalnest/ui/commonwidgets/custom_app_bar.dart';
import 'package:tcsgoalnest/ui/commonwidgets/custom_loader.dart';
import 'package:tcsgoalnest/ui/commonwidgets/display_error_widget.dart';
import 'package:tcsgoalnest/ui/commonwidgets/filled_button_widget.dart';
import 'package:tcsgoalnest/ui/commonwidgets/onboarding/google_sign_in_button.dart';
import 'package:tcsgoalnest/ui/commonwidgets/outline_button_widget.dart';
import 'package:tcsgoalnest/ui/commonwidgets/regular_text_widget.dart';

import '../commonwidgets/display_logo_body_animation_widget.dart';

@RoutePage()
class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => OnBoardingBloc()..add(const OnBoardingScreenEvents.initOnBoardingEvent()),
        child: BlocConsumer<OnBoardingBloc, OnBoardingScreenStates>(
            builder: (BuildContext context, OnBoardingScreenStates states){
              return states.when(
                  displayLoadingView: (){
                    return CustomLoader();
                  },
                  error: (String errorMessage){
                    return DisplayErrorWidget(errorMessage: errorMessage,);
                  },
                  displayUserDetails: (GoogleSignInAccount? user){
                    return Scaffold(
                      body: Column(
                        children: [
                          BoldTextWidget(
                              textToDisplay: "Found User Details"
                          ),
                          Row(
                            children: [
                                Image.asset(
                                    ImageConstants.kEmailTag,
                                    width: 100,
                                    height: 100,
                                ),
                                RegularTextWidget(
                                    textToDisplay: user?.email ?? ''
                                )
                            ],
                          )
                        ],
                      ),
                    );
                  },
                  displayOnBoardingView: (){
                    return Scaffold(
                      appBar: CustomAppBar(),
                      body: DisplayLogoBodyAnimationWidget(),
                      bottomNavigationBar: SafeArea(
                        child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                                color: ColorConstants.kDarkAzureColor
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                GoogleSignInButton(
                                  onButtonPress: (){
                                    BlocProvider.of<OnBoardingBloc>(context).add(const OnBoardingScreenEvents.onGoogleSigninEvent());
                                  },
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width - 70,
                                  child: FilledButtonWidget(
                                    buttonCaption: "Skip this time",
                                    onButtonPress: (){

                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            )
                        ),
                      ),

                    );
                  }
              );

            },
            listener: (BuildContext context, OnBoardingScreenStates states){

            }
        ),
    );

  }
}
