import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:tcsgoalnest/controller/ecommerce_splash_screen_controller/ecommerce_splash_bloc.dart';
import 'package:tcsgoalnest/controller/ecommerce_splash_screen_controller/events/ecommerce_splash_screen_events.dart';
import 'package:tcsgoalnest/controller/ecommerce_splash_screen_controller/states/ecommerce_splash_screen_states.dart';
import 'package:tcsgoalnest/ui/commonwidgets/bottom_navigation_button.dart';
import 'package:tcsgoalnest/ui/commonwidgets/custom_loader.dart';
import 'package:tcsgoalnest/ui/commonwidgets/display_error_widget.dart';
import 'package:tcsgoalnest/data/ecommercemodels/offer_details_model.dart';
import 'package:tcsgoalnest/ui/commonwidgets/display_logo_body_animation_widget.dart';
import 'package:tcsgoalnest/ui/commonwidgets/ecommercesplash/banner_card_widget.dart';
import 'package:tcsgoalnest/ui/commonwidgets/empty_widget.dart';
import 'package:tcsgoalnest/ui/commonwidgets/regular_text_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/constants/app_constants.dart';
import '../../core/constants/color_constants.dart';
import '../../core/constants/image_constants.dart';
import '../../core/routing/app_router.dart';
import '../../core/utils/on_boarding_enum.dart';
import '../commonwidgets/bold_text_widget.dart';

@RoutePage()
class EcommerceSplashScreen extends StatefulWidget {
  const EcommerceSplashScreen({super.key});

  @override
  State<EcommerceSplashScreen> createState() => _EcommerceSplashScreenState();
}

class _EcommerceSplashScreenState extends State<EcommerceSplashScreen> {
  int _currentCarouselIndex = 0;
  final CarouselSliderController _carouselController = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          EcommerceSplashBloc()..add(EcommerceSplashScreenEvents.loadOffersFromFirebase()),
      child: BlocConsumer<EcommerceSplashBloc, EcommerceSplashScreenStates>(
        builder: (BuildContext context, EcommerceSplashScreenStates state) {
          return state.maybeWhen(
            loadingView: () => CustomLoader(),
            errorView: (String errorMessage) =>
                DisplayErrorWidget(errorMessage: errorMessage),
            displaySplashScreen: (List<OfferDetailsModel> offerList) {
              return Scaffold(
                body: SafeArea(
                  child: Column(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Container(
                            color: ColorConstants.kDarkAzureColor,
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.all(10),
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
                        child: Column(
                          children: [
                            CarouselSlider.builder(
                              carouselController: _carouselController,
                              itemBuilder: (BuildContext context, int index, int realIndex) {
                                OfferDetailsModel currentOfferDetails = offerList[index];
                                return BannerCardWidget(offerDetails: currentOfferDetails);
                              },
                              itemCount: offerList.length,
                              options: CarouselOptions(
                                autoPlay: true,
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    _currentCarouselIndex = index;
                                  });
                                },
                              ),
                            ),
                            // Banner slider indicator for CarouselSlider
                            SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                offerList.length,
                                (dotIndex) {
                                  return Container(
                                    width: 8,
                                    height: 8,
                                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: _currentCarouselIndex == dotIndex
                                          ? ColorConstants.kDarkAzureColor
                                          : Colors.grey.withOpacity(0.5),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Row(
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
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                bottomNavigationBar: SafeArea(
                  child: BottomNavigationButton(
                      buttonCaption: "Let's Explore",
                      onButtonPress: () async{
                        /*var url = Uri.parse("https://www.jiosaavn.com/featured/lets-play-dino-james/uH8dwMs4YmbWCn-BpjaL7g__");
                        if (!await launchUrl(
                          url,
                          mode: LaunchMode.externalApplication,
                          browserConfiguration: const BrowserConfiguration(showTitle: true),
                        )) {
                          throw Exception('Could not launch $url');
                        }*/

                        BlocProvider.of<EcommerceSplashBloc>(context).add(EcommerceSplashScreenEvents.startNextScreen());
                      },
                  ),
                ),
              );
            },
            orElse: (){
              return EmptyWidget();
            }
          );
        },
        listener: (BuildContext context, EcommerceSplashScreenStates state) {
          state.whenOrNull(
            showNextScreen: (bool hasUserSignedIn) {
              if(hasUserSignedIn){
                context.router.replace(ProductListHomeRoute(onBoardType: OnBoardingEnum.GOOGLE_SIGN_METHOD));
              }
              else{
                context.router.replace(OnBoardingRoute());
              }
            },
          );
        },
      ),
    );
  }
}
