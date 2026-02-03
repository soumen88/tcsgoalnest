import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:tcsgoalnest/core/constants/color_constants.dart';
import 'package:tcsgoalnest/core/dependency/injectable_setup.dart';
import 'package:tcsgoalnest/core/table/goal_store_manager.dart';
import 'package:tcsgoalnest/ui/commonwidgets/custom_app_bar.dart';
import 'package:tcsgoalnest/ui/commonwidgets/custom_loader.dart';
import 'package:tcsgoalnest/ui/commonwidgets/display_error_widget.dart';
import 'package:tcsgoalnest/ui/commonwidgets/home/no_goals_widget.dart';
import 'package:tcsgoalnest/ui/commonwidgets/home/top_bar_widget.dart';
import 'package:tcsgoalnest/ui/commonwidgets/regular_text_widget.dart';

import '../../core/routing/app_router.dart';
import '../../core/schema/goal_store_data.dart';
import '../commonwidgets/filled_button_widget.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  final _key = GlobalKey<ExpandableFabState>();
  final _goalManager = locator<GoalStoreManager>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        children: [
          TopBarWidget(),
          Expanded(
              child: StreamBuilder(
                  stream: _goalManager.listenToGoals(),
                  builder: (BuildContext context, AsyncSnapshot<List<GoalStoreData>> snapshot){
                    if(snapshot.connectionState == ConnectionState.waiting){
                      return SizedBox(
                          height: 200,
                          child: CustomLoader()
                      );
                    }
                    else{
                      if(snapshot.hasError){
                        return DisplayErrorWidget(
                          errorMessage: snapshot.error.toString(),
                        );
                      }
                      else{
                        List<GoalStoreData> goals = snapshot.data ?? [];
                        Map<String, int> goalCountByType = {};
                        Map<String, GoalStoreData> goalTypes = {};
                        for(var currentGoal in goals){
                          goalCountByType[currentGoal.goalType] = (goalCountByType[currentGoal.goalType] ?? 0) + 1;
                          if(!goalTypes.containsKey(currentGoal.goalType)){
                            goalTypes[currentGoal.goalType] = currentGoal;
                          }
                        }
                        return Builder(
                            builder: (BuildContext context){
                              if(goals.isEmpty){
                                return NoGoalsWidget();
                              }
                              else{
                                return GridView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                                    itemCount: goalTypes.length,
                                    itemBuilder: (BuildContext context, int index){
                                      GoalStoreData data = goalTypes.values.toList()[index];
                                      int goalsFound = goalCountByType[data.goalType] ?? 0;
                                      return Card(
                                        child: Column(
                                          children: [
                                            CircleAvatar(
                                              maxRadius: 70,
                                              child: Image.asset(
                                                data.goalAssetImage,
                                                width: 150,
                                                height: 150,
                                              ),
                                            ),
                                            RegularTextWidget(
                                                textToDisplay: "${data.goalType} (${goalsFound})"
                                            )
                                          ],
                                        ),
                                      );
                                    }
                                );

                              }
                            }
                        );
                      }
                    }
                  }
              )
          ),

          FilledButtonWidget(
            buttonCaption: "Create A Goal",
            onButtonPress: (){
              context.router.push(const GoalTrackerRoute());
            },
          )
        ],
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
