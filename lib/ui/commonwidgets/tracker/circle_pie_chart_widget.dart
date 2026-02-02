import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/color_constants.dart';
import '../../../core/dependency/injectable_setup.dart';
import '../../../core/schema/goal_store_data.dart';
import '../../../core/table/goal_store_manager.dart';
import '../display_error_widget.dart';
import '../empty_widget.dart';
import '../regular_text_widget.dart';
import 'indicator.dart';

class CirclePieChartWidget extends StatefulWidget {
  final int goalId;
  const CirclePieChartWidget({super.key, required this.goalId});

  @override
  State<StatefulWidget> createState() => CirclePieChartState();
}

class CirclePieChartState extends State<CirclePieChartWidget> {
  int touchedIndex = -1;
  final _goalStoreManager = locator<GoalStoreManager>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<GoalStoreData?>(
        stream: _goalStoreManager.listenToGoalById(widget.goalId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return EmptyWidget();
          }
          if (snapshot.hasError) {
            return Center(child: DisplayErrorWidget(
                errorMessage: snapshot.error.toString())
            );
          }
          if (snapshot.data == null) {
            return Center(
                child: RegularTextWidget(textToDisplay: "No goal found")
            );
          }
          return Card(
            child: Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  flex: 1,
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: PieChart(
                      PieChartData(
                        pieTouchData: PieTouchData(
                          touchCallback: (FlTouchEvent event, pieTouchResponse) {
                            setState(() {
                              if (!event.isInterestedForInteractions ||
                                  pieTouchResponse == null ||
                                  pieTouchResponse.touchedSection == null) {
                                touchedIndex = -1;
                                return;
                              }
                              touchedIndex = pieTouchResponse
                                  .touchedSection!.touchedSectionIndex;
                            });
                          },
                        ),
                        borderData: FlBorderData(
                          show: false,
                        ),
                        sectionsSpace: 4,
                        centerSpaceRadius: 40,
                        sections: showingSections(
                            targetAmount: snapshot.data!.targetAmount.toDouble(),
                            currentAmount: snapshot.data!.currentAmount.toDouble()
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  flex: 1,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Indicator(
                        color:  Colors.yellow,
                        text: 'Target %',
                        isSquare: true,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Indicator(
                        color: Colors.blue,
                        text: 'Savings %',
                        isSquare: true,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
    );
  }

  List<PieChartSectionData> showingSections({required double targetAmount, required double currentAmount}) {
    double remainingAmount = targetAmount - currentAmount;
    double remainingPercentage = remainingAmount / targetAmount * 100;
    double currentPercentage = currentAmount / targetAmount * 100;
    return List.generate(2, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      return switch (i) {
        0 => PieChartSectionData(
          color: Colors.blue,
          value: currentPercentage,
          title: '${currentPercentage.toStringAsFixed(2)}%',
          radius: radius,
          titleStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: ColorConstants.kBlackColor,
            shadows: shadows,
          ),
        ),
        1 => PieChartSectionData(
          color: Colors.yellow,
          value: remainingPercentage,
          title: '${remainingPercentage.toStringAsFixed(2)}%',
          radius: radius,
          titleStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: ColorConstants.kBlackColor,
            shadows: shadows,
          ),
        ),
        _ => throw StateError('Invalid'),
      };
    });
  }

  List<PieChartSectionData> showingSectionsSample() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      return switch (i) {
        0 => PieChartSectionData(
          color: Colors.blue,
          value: 40,
          title: '40%',
          radius: radius,
          titleStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: ColorConstants.kBlackColor,
            shadows: shadows,
          ),
        ),
        1 => PieChartSectionData(
          color: Colors.yellow,
          value: 30,
          title: '30%',
          radius: radius,
          titleStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: ColorConstants.kBlackColor,
            shadows: shadows,
          ),
        ),
        2 => PieChartSectionData(
          color: Colors.purple,
          value: 15,
          title: '15%',
          radius: radius,
          titleStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: ColorConstants.kBlackColor,
            shadows: shadows,
          ),
        ),
        3 => PieChartSectionData(
          color: Colors.green,
          value: 15,
          title: '15%',
          radius: radius,
          titleStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: ColorConstants.kBlackColor,
            shadows: shadows,
          ),
        ),
        _ => throw StateError('Invalid'),
      };
    });
  }
}