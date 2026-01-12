import 'package:objectbox/objectbox.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tcsgoalnest/core/schema/key_value_store_data.dart';
import 'package:tcsgoalnest/core/utils/logger_util.dart';
import 'package:tcsgoalnest/objectbox.g.dart';
import 'package:path/path.dart' as pathPlugin;

class KeyValueStoreManager {
  final _logger = LoggerUtil();
  final _TAG = "KeyValueStoreManager";
  late Box<KeyValueStoreData> keyValueBox;

  Future<void> createAppDb() async{
    _logger.log(TAG: _TAG, message: "Creating instance of db");
    var dbDirectory = await getApplicationDocumentsDirectory();
    var objectBoxStore = await openStore(directory: pathPlugin.join(dbDirectory.path, "app-db"));
    keyValueBox = objectBoxStore.box<KeyValueStoreData>();
  }

  Future<int> insert({required String objectKeyName, required String objecValue, String? defaultValue}) async{
    var keyValueStore = KeyValueStoreData(keyName: objectKeyName, value: objecValue, defaultValue: defaultValue);
    _logger.log(TAG: _TAG, message: "Key Value store data getting inserted $keyValueStore");
    int insertedRowId = keyValueBox.put(keyValueStore);
    _logger.log(TAG: _TAG, message: "inserted row id $insertedRowId");
    return Future.value(insertedRowId);
  }

  Future<void> delete({required int objectKeyId}) async{
    bool wasDeleteSuccess = keyValueBox.remove(objectKeyId);
    _logger.log(TAG: _TAG, message: "Was delete success $wasDeleteSuccess");
  }

  int getAllRowCount() {
     var count = keyValueBox.getAll().length;
      return count;
  }

  String? getValueFromKeyStore({required String objectKeyName}){
    var keyValueData = keyValueBox.query(KeyValueStoreData_.keyName.equals(objectKeyName)).build().findFirst();
    _logger.log(TAG: _TAG, message: "Found value for key $keyValueData");
    return keyValueData?.value;
  }

  Stream<List<KeyValueStoreData>> listenToKeyStore() async*{
    final queryBuilder = keyValueBox.query()..order(KeyValueStoreData_.keyName);
    final Stream<Query<KeyValueStoreData>> queryToWatch = queryBuilder.watch(triggerImmediately: true);
    Stream<List<KeyValueStoreData>> rowsInStream = queryToWatch.map((query) => query.find());
    yield* rowsInStream;
  }
}