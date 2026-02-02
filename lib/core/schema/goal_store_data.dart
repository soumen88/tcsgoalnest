import 'package:objectbox/objectbox.dart';

@Entity()
class GoalStoreData {
  @Id()
  int goalId;
  String goalName;
  String goalType;
  String startDate;
  String endDate;
  int targetAmount;
  int currentAmount;
  String goalAssetImage;
  bool isGoalCompleted;

  GoalStoreData({
    this.goalId = 0,
    required this.goalName,
    required this.goalType,
    required this.startDate,
    required this.endDate,
    required this.targetAmount,
    this.currentAmount = 0,
    this.goalAssetImage = "",
    this.isGoalCompleted = false,
});


}