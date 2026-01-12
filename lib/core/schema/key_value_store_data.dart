import 'package:objectbox/objectbox.dart';
///flutter pub run build_runner build --delete-conflicting-outputs
@Entity()
class KeyValueStoreData {
  @Id()
  int keyId;
  String keyName;
  String value;
  String? defaultValue;

  KeyValueStoreData({ this.keyId = 0,required this.keyName, required this.value, this.defaultValue});

  @override
  String toString() {

    return "KeyValue has id ${keyId}, name ${keyName} and value ${value} and default value ${defaultValue}";
  }
}