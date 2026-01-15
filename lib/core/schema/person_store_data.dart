import 'package:objectbox/objectbox.dart';
///flutter pub run build_runner build --delete-conflicting-outputs
@Entity()
class PersonStoreData {
  @Id()
  int personId;
  String personName;
  String personEmail;
  String personPhone;
  String personAddress;

  PersonStoreData({ this.personId = 0,required this.personName, required this.personEmail, required this.personPhone, required this.personAddress});

  @override
  String toString() {
    return "Person has id ${personId}, name ${personName}, email ${personEmail}, phone ${personPhone} and address ${personAddress}";
  }
}