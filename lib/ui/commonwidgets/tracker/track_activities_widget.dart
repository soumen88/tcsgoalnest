import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tcsgoalnest/core/constants/color_constants.dart';
import 'package:tcsgoalnest/core/dependency/injectable_setup.dart';
import 'package:tcsgoalnest/core/table/activity_store_manager.dart';
import 'package:tcsgoalnest/core/enumerations/goal_status_enum.dart';
import 'package:tcsgoalnest/ui/commonwidgets/bold_text_widget.dart';
import 'package:tcsgoalnest/ui/commonwidgets/custom_loader.dart';
import 'package:tcsgoalnest/ui/commonwidgets/display_error_widget.dart';
import 'package:tcsgoalnest/ui/commonwidgets/empty_widget.dart';
import 'package:tcsgoalnest/ui/commonwidgets/regular_text_widget.dart';
import 'package:tcsgoalnest/ui/commonwidgets/tracker/circle_pie_chart_widget.dart';
import 'package:tcsgoalnest/ui/commonwidgets/tracker/no_completed_goals_widget.dart';

import '../../../core/schema/activity_tracker_data.dart';

class TrackActivitiesWidget extends StatelessWidget {
  final _activityStoreManager = locator<ActivityStoreManager>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _activityStoreManager.listenToActivities(),
        builder: (BuildContext context, AsyncSnapshot<List<ActivityTrackerData>> snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return CustomLoader();
            }
            else{
              if(snapshot.hasError){
                return DisplayErrorWidget(
                  errorMessage: snapshot.error.toString(),
                );
              }
              else if(snapshot.hasData){
                List<ActivityTrackerData> listOfActivities = snapshot.data ?? [];
                return Builder(
                    builder: (BuildContext context){
                      if(listOfActivities.isEmpty){
                        return NoCompletedGoalsWidget(
                          widgetEnum: GoalStatusEnum.NO_ACTIVITY_FOUND,
                        );
                      }
                      else{
                        return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (BuildContext context, int index){
                              ActivityTrackerData currentActivity = listOfActivities[index];
                              return Card(
                                margin: EdgeInsets.all(10),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    spacing: 10,
                                    children: [
                                      BoldTextWidget(
                                        textToDisplay: currentActivity.goalName,
                                        fontSize: 24,
                                      ),
                                      Row(

                                        children: [
                                          Expanded(
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Icon(Icons.date_range),
                                                    BoldTextWidget(
                                                      textToDisplay: "Activity Date",
                                                      fontSize: 14,
                                                    ),
                                                  ],
                                                ),
                                                RegularTextWidget(
                                                    textToDisplay: DateFormat('d MMM yyyy').format(currentActivity.activityDate)
                                                )
                                              ],
                                            ),
                                          ),
                                          Container(
                                            width: 3,
                                            height: 50,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                color: ColorConstants.kBlackColor
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              children: [
                                                BoldTextWidget(
                                                  textToDisplay: "\u{20B9} Amount Saved",
                                                  fontSize: 14,
                                                ),
                                                RegularTextWidget(
                                                    textToDisplay: currentActivity.amountSaved.toString()
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }
                        );
                      }
                    }
                );

              }
              else{
                return EmptyWidget();
              }
            }

        }
    );
  }
}
