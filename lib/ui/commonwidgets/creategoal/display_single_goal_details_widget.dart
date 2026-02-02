import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tcsgoalnest/core/constants/app_constants.dart';
import 'package:tcsgoalnest/core/schema/goal_store_data.dart';
import 'package:tcsgoalnest/ui/commonwidgets/bold_text_widget.dart';
import 'package:tcsgoalnest/ui/commonwidgets/bottom_navigation_button.dart';
import 'package:tcsgoalnest/ui/commonwidgets/custom_app_bar.dart';
import 'package:tcsgoalnest/ui/commonwidgets/tracker/carousel_row_widget.dart';
import 'package:tcsgoalnest/ui/commonwidgets/tracker/circle_pie_chart_widget.dart';

import '../display_text_field_widget.dart';
import '../regular_text_widget.dart';

class DisplaySingleGoalDetailsWidget extends StatefulWidget {
  final GoalStoreData goalDetails;
  final Function(GoalStoreData updateGoal) saveGoalPressed;

  const DisplaySingleGoalDetailsWidget({super.key, required this.goalDetails, required this.saveGoalPressed});

  @override
  State<DisplaySingleGoalDetailsWidget> createState() => _DisplaySingleGoalDetailsWidgetState();
}

class _DisplaySingleGoalDetailsWidgetState extends State<DisplaySingleGoalDetailsWidget> {

  final TextEditingController _goalNameController = TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();
  final TextEditingController _goalAmountController = TextEditingController();
  final TextEditingController _currentAmountController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  bool isGoalCompleted = false;

  @override
  void initState() {
    _goalNameController.text = widget.goalDetails.goalName;
    _startDateController.text = widget.goalDetails.startDate;
    _endDateController.text = widget.goalDetails.endDate;
    _goalAmountController.text = widget.goalDetails.targetAmount.toString();
    _currentAmountController.text = widget.goalDetails.currentAmount.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  spacing: 20,
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                          aspectRatio: 1,
                          autoPlay: true,
                          autoPlayAnimationDuration: Duration(seconds: 3),
                          viewportFraction: 1,
                          height: 220
                      ),
                      items: [
                        CirclePieChartWidget(
                            goalId: widget.goalDetails.goalId
                        ),
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Column(
                              spacing: 8,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                 CarouselRowWidget(title: "Goal Name : ", value: widget.goalDetails.goalName),
                                 CarouselRowWidget(title: "Goal Type : ", value: widget.goalDetails.goalType),
                                 CarouselRowWidget(title: "Target Amount : ", value: widget.goalDetails.targetAmount.toString()),
                                 CarouselRowWidget(title: "Saved Amount : ", value: widget.goalDetails.currentAmount.toString()),
                              ],
                            ),
                          ),
                        )
                      ]
                    ),

                    BoldTextWidget(
                        textToDisplay: "Edit details for ${widget.goalDetails.goalName}"
                    ),
                    RegularTextWidget(
                        textToDisplay: "Here is what we call your goal as "
                    ),
                    DisplayTextFieldWidget(
                      inputController: _goalNameController,
                      hintText: "Enter Goal Name",
                      isEnabled: false,
                    ),
                    BoldTextWidget(
                      textToDisplay: AppConstants.kWhyMarkAsCompletedDescription,
                      fontSize: 16,
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: isGoalCompleted,
                          fillColor: WidgetStatePropertyAll<Color>(Colors.green),
                          onChanged: (bool? isChecked){
                            isGoalCompleted = isChecked ?? false;
                            if(isGoalCompleted){
                              var remainingAmount = widget.goalDetails.targetAmount - widget.goalDetails.currentAmount;
                              _currentAmountController.text = remainingAmount.toString();
                            }
                            setState(() {

                            });
                          },
                        ),
                        RegularTextWidget(textToDisplay: "Mark as completed")
                      ],
                    ),
                    RegularTextWidget(
                        textToDisplay: "When did you start saving for this "
                    ),
                    DisplayTextFieldWidget(
                      inputController: _startDateController,
                      hintText: "Goal Start Date",
                      isEnabled: false,
                    ),
                    RegularTextWidget(
                        textToDisplay: "End date on which you want to finish this goal"
                    ),
                    DisplayTextFieldWidget(
                      inputController: _endDateController,
                      hintText: "Goal End Date",
                      isEnabled: false,
                    ),
                    RegularTextWidget(
                        textToDisplay: "Amount that you want to save"
                    ),
                    DisplayTextFieldWidget(
                      inputController: _goalAmountController,
                      hintText: "Enter Goal Amount",
                      isEnabled: false,
                    ),
                    RegularTextWidget(
                        textToDisplay: "How much is present contribution to this goal for?"
                    ),
                    DisplayTextFieldWidget(
                      inputController: _currentAmountController,
                      hintText: "Current amount to save",
                      inputType: TextInputType.number,
                    ),
                  ],
                ),
              ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationButton(
          buttonCaption: "Save Goal",
          onButtonPress: (){
            if(_formKey.currentState != null && _formKey.currentState!.validate()){

                GoalStoreData goalStoreData = widget.goalDetails;
                goalStoreData.currentAmount = int.parse(_currentAmountController.text);
                goalStoreData.isGoalCompleted = isGoalCompleted;
                widget.saveGoalPressed.call(goalStoreData);
            }
          },
      ),
    );
  }
}
