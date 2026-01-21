import 'package:injectable/injectable.dart' hide Order;
import 'package:tcsgoalnest/core/utils/logger_util.dart';

import '../../objectbox.g.dart';
import '../schema/person_store_data.dart';

@lazySingleton
class PersonStoreManager {
  final _logger = LoggerUtil();
  final _TAG = "PersonStoreManager";
  final Box<PersonStoreData> _box;

  PersonStoreManager(Store objectBoxStore) : _box = objectBoxStore.box<PersonStoreData>();

  Future<void> insertPersonDetails({required String name,required int age,required String email}) async{
    PersonStoreData personData = PersonStoreData(personName: name, age: age, personEmail: email);
    int rowIdInserted = _box.put(personData);
    _logger.log(TAG: _TAG, message: "Inserted row id $rowIdInserted");
  }

  Stream<List<PersonStoreData>> listenToPersonStore() async*{
    /*final queryBuilder = _box.query(
      PersonStoreData_.personId > 5
    )
      ..order(PersonStoreData_.personId, flags: Order.descending);*/

    final queryBuilder = _box.query().order(PersonStoreData_.personId, flags: Order.descending);
    final Stream<Query<PersonStoreData>> queryToWatch = queryBuilder.watch(triggerImmediately: true);
    Stream<List<PersonStoreData>> rowsInStream = queryToWatch.map((query) => query.find());
    yield* rowsInStream;
  }
}