import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:tcsgoalnest/core/constants/color_constants.dart';
import 'package:tcsgoalnest/ui/commonwidgets/custom_app_bar.dart';
import 'package:tcsgoalnest/ui/commonwidgets/custom_loader.dart';
import 'package:tcsgoalnest/ui/commonwidgets/display_error_widget.dart';
import 'package:tcsgoalnest/ui/commonwidgets/home/no_goals_widget.dart';
import 'package:tcsgoalnest/ui/commonwidgets/home/top_bar_widget.dart';
import 'package:tcsgoalnest/ui/commonwidgets/regular_text_widget.dart';

import '../../core/routing/app_router.dart';
import '../commonwidgets/filled_button_widget.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  final _key = GlobalKey<ExpandableFabState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopBarWidget(),
            NoGoalsWidget(),
            FilledButtonWidget(
                buttonCaption: "Create A Goal",
                onButtonPress: (){
                  context.router.push(const GoalTrackerRoute());
                },
            )
          ],
        ),
      ),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandableFab(
      key: _key,
      type: ExpandableFabType.up,
      childrenAnimation: ExpandableFabAnimation.none,
      distance: 70,
      overlayStyle: ExpandableFabOverlayStyle(
        color: Colors.black.withOpacity(0.9),
      ),
      children: [
        Row(
          children: [
            RegularTextWidget(
                textToDisplay: "Start a goal",
                textColor: ColorConstants.kWhiteColor,
            ),
            SizedBox(width: 20),
            FloatingActionButton.small(
              heroTag: null,
              onPressed: (){
                _key.currentState!.close();
                context.router.push(const GoalTrackerRoute());
              },
              child: Icon(Icons.plus_one_outlined),
            ),
          ],
        ),
        Row(
          children: [
            RegularTextWidget(
              textToDisplay: "How It works?",
              textColor: ColorConstants.kWhiteColor,
            ),
            SizedBox(width: 20),
            FloatingActionButton.small(
              heroTag: null,
              onPressed: (){
                _key.currentState!.close();
                AutoTabsRouter.of(context).setActiveIndex(0);
              },
              child: Icon(Icons.question_mark),
            ),
          ],
        ),
      ],
    ),
    );
  }
}
