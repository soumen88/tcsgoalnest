import 'package:injectable/injectable.dart' hide Order;
import 'package:tcsgoalnest/core/schema/key_value_store_data.dart';
import 'package:tcsgoalnest/core/utils/logger_util.dart';

import '../../objectbox.g.dart';
import '../schema/person_store_data.dart';

@lazySingleton
class KeyValueStoreManager {
  final _logger = LoggerUtil();
  final _TAG = "PersonStoreManager";
  final Box<KeyValueStoreData> _box;

  KeyValueStoreManager(Store objectBoxStore) : _box = objectBoxStore.box<KeyValueStoreData>();

  Future<void> insertKey({required String keyName, required String value}) async{
    KeyValueStoreData data = KeyValueStoreData(keyName: keyName, value: value);
    int rowIdInserted = _box.put(data);
    _logger.log(TAG: _TAG, message: "Inserted row id $rowIdInserted");
  }

  String? getValue(String key){
    var data = _box.query(KeyValueStoreData_.keyName.equals(key)).build().findFirst();
    return data?.value;
  }

  Stream<List<KeyValueStoreData>> listenToKeyValueStore() async*{
    /*final queryBuilder = _box.query(
      PersonStoreData_.personId > 5
    )
      ..order(PersonStoreData_.personId, flags: Order.descending);*/

    final queryBuilder = _box.query().order(KeyValueStoreData_.keyId);
    final Stream<Query<KeyValueStoreData>> queryToWatch = queryBuilder.watch(triggerImmediately: true);
    Stream<List<KeyValueStoreData>> rowsInStream = queryToWatch.map((query) => query.find());
    yield* rowsInStream;
  }
}