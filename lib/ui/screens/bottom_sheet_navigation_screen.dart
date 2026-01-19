import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:tcsgoalnest/core/constants/color_constants.dart';
import 'package:tcsgoalnest/core/routing/app_router.dart';
import 'package:tcsgoalnest/ui/commonwidgets/bold_text_widget.dart';

@RoutePage()
class BottomSheetNavigationScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      // list of your tab routes
      // routes used here must be declared as children
      // routes of /dashboard
      routes: const [
        FeaturesRoute(),
        HomeRoute(),
        TrackRoute(),
      ],
      transitionBuilder: (context,child,animation) => FadeTransition(
        opacity: animation,
        // the passed child is technically our animated selected-tab page
        child: child,
      ),
      bottomNavigationBuilder: (BuildContext context, TabsRouter router) {
          return SalomonBottomBar(
              backgroundColor: ColorConstants.kDarkAzureColor,
              selectedItemColor: ColorConstants.kWhiteColor,
              unselectedItemColor: ColorConstants.kDarkPurpleColor,
              items: [
                SalomonBottomBarItem(
                    icon: Icon(
                        Icons.webhook
                    ),
                    title: BoldTextWidget(
                        textToDisplay: "Features",
                        fontSize: 14,
                        textColor: ColorConstants.kWhiteColor,
                    )
                ),
                SalomonBottomBarItem(
                    icon: Icon(
                        Icons.home
                    ),
                    title: BoldTextWidget(
                      textToDisplay: "Home",
                      fontSize: 14,
                      textColor: ColorConstants.kWhiteColor,
                    )
                ),
                SalomonBottomBarItem(
                    icon: Icon(
                        Icons.track_changes
                    ),
                    title: BoldTextWidget(
                      textToDisplay: "Track",
                      fontSize: 14,
                      textColor: ColorConstants.kWhiteColor,
                    )
                )
              ],
              onTap: (int index){
                return router.setActiveIndex(index);
              },
              currentIndex: router.activeIndex,
          );
      },
    );
  }
}