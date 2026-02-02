import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tcsgoalnest/core/constants/image_constants.dart';
import 'package:tcsgoalnest/core/schema/goal_store_data.dart';
import 'package:tcsgoalnest/ui/commonwidgets/bold_text_widget.dart';
import 'package:tcsgoalnest/ui/commonwidgets/empty_widget.dart';
import 'package:tcsgoalnest/ui/commonwidgets/filled_button_widget.dart';
import 'package:tcsgoalnest/ui/commonwidgets/regular_text_widget.dart';

class GoalDetailsCardWidget extends StatefulWidget {
  final GoalStoreData goalDetails;
  final VoidCallback? onEditGoalPress;
  const GoalDetailsCardWidget({super.key, required this.goalDetails, this.onEditGoalPress});

  @override
  State<GoalDetailsCardWidget> createState() => _GoalDetailsCardWidgetState();
}

class _GoalDetailsCardWidgetState extends State<GoalDetailsCardWidget> {

  String formattedStartDate = "";
  String formattedEndDate = "";

  @override
  void initState() {
    formattedStartDate = _formatDate(widget.goalDetails.startDate);
    formattedEndDate = _formatDate(widget.goalDetails.endDate);
    super.initState();
  }

  String normalize(String date) {
    final parts = date.split('-');
    if (parts.length != 3) return date;

    return '${parts[0]}-'
        '${parts[1].padLeft(2, '0')}-'
        '${parts[2].padLeft(2, '0')}';
  }

  String _formatDate(String dateStr) {
    try {
      var normalizedDate = normalize(dateStr);
      final date = DateTime.parse(normalizedDate);
      return DateFormat('d MMM yyyy', 'en_US').format(date);
    } catch (_) {
      return dateStr;
    }
  }


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Card(
        child: Stack(
            children: [
              Positioned(
                  top: 10,
                  child: BoldTextWidget(textToDisplay: widget.goalDetails.goalName)
              ),
              Positioned(
                  top: 40,
                  right: 30,
                  child: Column(
                    children: [
                      CircleAvatar(
                        maxRadius: 50,
                        child: Builder(
                            builder: (BuildContext context){
                              if(widget.goalDetails.goalAssetImage.isNotEmpty){
                                return Image.asset(
                                  widget.goalDetails.goalAssetImage,
                                  width: 100,
                                  height: 100,
                                ) ;
                              }
                              else{
                                return Image.asset(
                                  ImageConstants.kLogoOnly,
                                  width: 100,
                                  height: 100,
                                );
                              }
                            }
                        ),
                      ),
                      Builder(
                          builder: (BuildContext context){
                            if( widget.onEditGoalPress != null){
                                return FilledButtonWidget(
                                  buttonCaption: "Edit Goal",
                                  onButtonPress: (){
                                    widget.onEditGoalPress?.call();
                                  },
                                );
                            }
                            else{
                              return EmptyWidget();
                            }
                          }
                      ),
                    ],
                  )
              ),
              Positioned(
                  top: 50,
                  left: 30,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      RegularTextWidget(textToDisplay: "Start Date : $formattedStartDate"),
                      RegularTextWidget(textToDisplay: "End Date : $formattedEndDate"),
                      RegularTextWidget(textToDisplay: "Target Amount : ${widget.goalDetails.targetAmount}"),
                      RegularTextWidget(textToDisplay: "Current Amount : ${widget.goalDetails.currentAmount}"),
                    ],
                  )
              )
            ],
        ),
      ),
    );
  }
}
