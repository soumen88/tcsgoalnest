import 'package:objectbox/objectbox.dart';
import 'package:path_provider/path_provider.dart' ;
import 'package:path/path.dart' as pathPlugin;
import 'package:tcsgoalnest/core/schema/person_store_data.dart';
import 'package:tcsgoalnest/core/utils/logger_util.dart';

import '../../objectbox.g.dart';
class PersonDataManager {
  static final PersonDataManager _instance = PersonDataManager._internal();

  factory PersonDataManager(){
    return _instance;
  }

  PersonDataManager._internal();

  late Box<PersonStoreData> _box;
  final _logger = LoggerUtil();
  final _TAG = "PersonDataManager";

  Future<void> createAppDb() async{
    var dbDirectory = await getApplicationDocumentsDirectory();
    var objectBoxStore = await openStore(directory: pathPlugin.join(dbDirectory.path, "app-db"));
    _box = objectBoxStore.box<PersonStoreData>();
  }

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

    final queryBuilder = _box.query(
        PersonStoreData_.personId > 5
    )
      .order(PersonStoreData_.personId, flags: Order.descending);
    final Stream<Query<PersonStoreData>> queryToWatch = queryBuilder.watch(triggerImmediately: true);
    Stream<List<PersonStoreData>> rowsInStream = queryToWatch.map((query) => query.find());
    yield* rowsInStream;
  }
}