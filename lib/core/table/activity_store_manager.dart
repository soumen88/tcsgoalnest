import 'package:injectable/injectable.dart' hide Order;
import 'package:injectable/injectable.dart' hide Order;
import 'package:tcsgoalnest/core/utils/logger_util.dart';
import '../../objectbox.g.dart';
import '../schema/activity_tracker_data.dart';

@lazySingleton
class ActivityStoreManager{

  final _logger = LoggerUtil();
  final _TAG = "ActivityStoreManager";
  final Box<ActivityTrackerData> activityBox;

  ActivityStoreManager(Store store) : activityBox = store.box<ActivityTrackerData>();

  Future<void> saveActivity(ActivityTrackerData activity) async {
    int trackIdReceived = await activityBox.put(activity);
    _logger.log(TAG: _TAG, message: "Track id received $trackIdReceived");
  }

  Future<void> deleteActivity(int activityId) async{
    activityBox.remove(activityId);
  }

  Stream<List<ActivityTrackerData>> listenToActivities() async*{
    final qBuilder = activityBox.query()
      ..order(ActivityTrackerData_.activityDate, flags: Order.descending);
    final Stream<Query<ActivityTrackerData>> watchedQuery = qBuilder.watch(triggerImmediately: true);
    Stream<List<ActivityTrackerData>> activitiesStream = watchedQuery.map((query) => query.find());
    yield* activitiesStream;
  }
}