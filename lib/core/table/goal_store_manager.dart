import 'package:injectable/injectable.dart';

import '../../objectbox.g.dart';
import '../schema/goal_store_data.dart';
import '../utils/logger_util.dart';

@lazySingleton
class GoalStoreManager {
  final _logger = LoggerUtil();
  final _TAG = "GoalStoreManager";
  final Box<GoalStoreData> _box;

  GoalStoreManager(Store objectBoxStore) : _box = objectBoxStore.box<GoalStoreData>();

  Future<int> insertAGoal({required String goalName, required String goalType, required String startDate, required String endDate, required int targetAmount, String? imagePath}) async{
    GoalStoreData goalStoreData = GoalStoreData(
        goalName: goalName,
        goalType: goalType,
        startDate: startDate,
        endDate: endDate,
        targetAmount: targetAmount,
        goalAssetImage: imagePath ?? ''
    );
    int rowIdInserted = _box.put(goalStoreData);
    _logger.log(TAG: _TAG, message: "Inserted row id $rowIdInserted");
    return Future.value(rowIdInserted);
  }

  Future<void> markUpdatesOnAGoal(GoalStoreData updates) async{
    _box.put(updates);
    _logger.log(TAG: _TAG, message: "Goal with id ${updates.goalId} has been updated");
  }

  Stream<List<GoalStoreData>> listenToGoals() async*{
    final queryBuilder = _box.query().order(GoalStoreData_.goalId);
    final Stream<Query<GoalStoreData>> queryToWatch = queryBuilder.watch(triggerImmediately: true);
    Stream<List<GoalStoreData>> rowsInStream = queryToWatch.map((query) => query.find());

    yield* rowsInStream;
  }

  Stream<GoalStoreData?> listenToGoalById( int goalId) async*{
    final query = _box.query(GoalStoreData_.goalId.equals(goalId));
    var goalStream = query.watch(triggerImmediately: true).map((query) => query.findFirst());
    yield* goalStream;
  }


}