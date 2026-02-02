import 'package:objectbox/objectbox.dart';

@Entity()
class ActivityTrackerData {
  @Id()
  int activityId;
  int goalId;
  String goalName;
  String goalType;
  DateTime activityDate;
  double amountSaved;

  ActivityTrackerData(
  {
    this.activityId = 0,
    required this.goalId,
    required this.goalName,
    required this.goalType,
    required this.activityDate,
    required this.amountSaved
}
  );


}