import 'package:objectbox/objectbox.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tcsgoalnest/core/schema/person_store_data.dart';
import 'package:tcsgoalnest/core/utils/logger_util.dart';
import 'package:tcsgoalnest/objectbox.g.dart';
import 'package:path/path.dart' as pathPlugin;

class PersonStoreManager {
  final _logger = LoggerUtil();
  final _TAG = "PersonStoreManager";
  late Box<PersonStoreData> personBox;
  static final PersonStoreManager _instance = PersonStoreManager._internal();

  factory PersonStoreManager() {
    return _instance;
  }

  PersonStoreManager._internal();

  Future<void> createAppDb() async{
    _logger.log(TAG: _TAG, message: "Creating instance of db");
    var dbDirectory = await getApplicationDocumentsDirectory();
    var objectBoxStore = await openStore(directory: pathPlugin.join(dbDirectory.path, "app-db"));
    personBox = objectBoxStore.box<PersonStoreData>();
  }

  Future<int> insert({required String personName, required String personEmail, required String personPhone, required String personAddress}) async{
    var personStore = PersonStoreData(personName: personName, personEmail: personEmail, personPhone: personPhone, personAddress: personAddress);
    _logger.log(TAG: _TAG, message: "Person store data getting inserted $personStore");
    int insertedRowId = personBox.put(personStore);
    _logger.log(TAG: _TAG, message: "inserted row id $insertedRowId");
    return Future.value(insertedRowId);
  }
  
  
}