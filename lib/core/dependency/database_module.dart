import 'package:injectable/injectable.dart';
import 'package:objectbox/objectbox.dart';
import 'package:tcsgoalnest/objectbox.g.dart';

@module
abstract class DatabaseModule {
  @preResolve
  @singleton
  Future<Store> openDbStore() async{
    return await openStore();
  }
}