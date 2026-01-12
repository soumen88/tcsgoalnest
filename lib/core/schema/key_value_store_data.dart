import 'package:objectbox/objectbox.dart';

@Entity()
class KeyValueStoreData {
  @Id()
  int keyId;
  String keyName;
  String value;
  bool isKeyActive;

  KeyValueStoreData({ this.keyId = 0,required this.keyName, required this.value, this.isKeyActive = true});

  @override
  String toString() {

    return "KeyValue has id ${keyId}, name ${keyName} and value ${value}";
  }
}