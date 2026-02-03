import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tcsgoalnest/core/dependency/injectable_setup.dart';
import 'package:tcsgoalnest/core/schema/activity_tracker_data.dart';
import 'package:tcsgoalnest/core/schema/goal_store_data.dart';
import 'package:tcsgoalnest/core/table/goal_store_manager.dart';
import 'package:tcsgoalnest/data/models/goal_model.dart';
import 'package:tcsgoalnest/ui/commonwidgets/custom_app_bar.dart';
import 'package:tcsgoalnest/ui/commonwidgets/display_text_field_widget.dart';
import 'package:tcsgoalnest/ui/commonwidgets/filled_button_widget.dart';
import 'package:tcsgoalnest/ui/commonwidgets/outline_button_widget.dart';
import 'package:tcsgoalnest/ui/commonwidgets/regular_text_widget.dart';

import '../../../core/table/activity_store_manager.dart';
import '../../../data/models/goal_type_model.dart';
import '../bold_text_widget.dart';

class FillGoalDetailsWidget extends StatefulWidget {
  final GoalTypeModel goalSelectedByUser;
  final VoidCallback? chooseDifferentGoalPress;
  final VoidCallback? addAGoalPress;

  const FillGoalDetailsWidget({super.key, required this.goalSelectedByUser, this.addAGoalPress, this.chooseDifferentGoalPress });

  @override
  State<FillGoalDetailsWidget> createState() => _FillGoalDetailsWidgetState();
}

class _FillGoalDetailsWidgetState extends State<FillGoalDetailsWidget> {
  final TextEditingController goalNameController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  final _goalStoreManager = locator<GoalStoreManager>();
  final _activityStoreManager = locator<ActivityStoreManager>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            child: Form(
                key: formKey,
                child: Column(
                  spacing: 20,
                  children: [
                    BoldTextWidget(
                      textToDisplay: "Add details for your goal ${widget.goalSelectedByUser.name}",
                      textAlignment: TextAlign.center,
                    ),
                    RegularTextWidget(
                        textToDisplay: "Give a name to your goal..."
                    ),
                    DisplayTextFieldWidget(
                        inputController: goalNameController,
                        hintText: "Enter Goal Name"
                    ),
                    RegularTextWidget(
                      textToDisplay: "Hey there, when do you think is a good date to start this...",
                      textAlignment: TextAlign.center,
                    ),
                    DisplayTextFieldWidget(
                      inputController: startDateController,
                      hintText: "Enter Goal Start Date",
                      isEnabled: false,
                    ),
                    OutlineButtonWidget(
                      buttonCaption: "Choose Start Date",
                      onButtonPress: () async{
                        var startDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now().subtract(Duration(days: 15)),
                            lastDate: DateTime.now().add(Duration(days: 365))
                        );
                        if(startDate != null){
                          startDateController.text = "${startDate.day}-${startDate.month}-${startDate.year}";
                          setState(() {

                          });
                        }
                      },
                    ),
                    RegularTextWidget(
                      textToDisplay: "By what date would you want this goal to be completed...",
                      textAlignment: TextAlign.center,
                    ),
                    DisplayTextFieldWidget(
                      inputController: endDateController,
                      hintText: "Enter Goal End Date",
                      isEnabled: false,
                    ),
                    OutlineButtonWidget(
                      buttonCaption: "Choose End Date",
                      onButtonPress: () async{
                        var endDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now().subtract(Duration(days: 15)),
                            lastDate: DateTime.now().add(Duration(days: 7300))
                        );
                        if(endDate != null){
                          endDateController.text = "${endDate.day}-${endDate.month}-${endDate.year}";
                          setState(() {

                          });
                        }
                      },
                    ),
                    RegularTextWidget(
                      textToDisplay: "How much do you want to save?",
                    ),
                    DisplayTextFieldWidget(
                      inputController: amountController,
                      hintText: "Enter Amount",
                      inputType: TextInputType.number,
                    ),
                  ],
                )
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(bottom: 20, left: 20, right: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width ,
                  child: FilledButtonWidget(
                    buttonCaption: "Choose A Different Goal",
                    onButtonPress: (){
                        widget.chooseDifferentGoalPress?.call();
                    },
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: FilledButtonWidget(
                    buttonCaption: "Add a goal",
                    onButtonPress: () async{
                      if(formKey.currentState != null && formKey.currentState!.validate()){

                        var goalIdCreated = await _goalStoreManager.insertAGoal(
                            goalName: goalNameController.text,
                            goalType: widget.goalSelectedByUser.name,
                            startDate: startDateController.text,
                            endDate: endDateController.text,
                            targetAmount: int.parse(amountController.text),
                            imagePath: widget.goalSelectedByUser.image
                        );

                        var activity = ActivityTrackerData(
                            goalId: goalIdCreated,
                            goalName: goalNameController.text,
                            goalType: widget.goalSelectedByUser.name,
                            activityDate: DateTime.now(),
                            amountSaved: 0
                        );

                        //_activityStoreManager.saveActivity(activity);
                        widget.addAGoalPress?.call();
                        context.router.pop();
                      }

                    },
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}
