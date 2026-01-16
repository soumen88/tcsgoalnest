import 'package:objectbox/objectbox.dart';

@Entity()
class PersonStoreData {
  @Id()
  int personId;
  String personName;
  int age;
  String personEmail;

  PersonStoreData({this.personId = 0, required this.personName, required this.age, required this.personEmail});

  @override
  String toString() {
    return "Person id ${personId} and name ${personName}";
  }
}