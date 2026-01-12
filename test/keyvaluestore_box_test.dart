import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:objectbox/objectbox.dart';
import 'package:tcsgoalnest/core/schema/key_value_store_data.dart';
import 'package:path/path.dart' as pathPlugin;
import 'package:tcsgoalnest/objectbox.g.dart';
void main(){
  late Store keyValueStore;
  late Box<KeyValueStoreData> keyValueBox;
  var dbDirectory = Directory(pathPlugin.join(Directory.current.path, "app-db"));

  ///This function ensures that the DB exists in local storage..
  ///If it does not exist, this function should create a new DB
  setUpAll(() async{
    if(dbDirectory.existsSync()){
        debugPrint("the db already exists so no need to initialize");
        dbDirectory.deleteSync(recursive: true);
    }
    keyValueStore = await openStore(directory: dbDirectory.path);
    keyValueBox = keyValueStore.box<KeyValueStoreData>();
  });

  tearDownAll((){
    keyValueStore.close();
    if(dbDirectory.existsSync()){
      debugPrint("the db already exists so no need to initialize");
      //dbDirectory.deleteSync(recursive: true);
    }
    expect((){
      KeyValueStoreData dummyKey = KeyValueStoreData(keyName: "Dummy", value: "poiuytrewq");
      int insertRowIdAfterClose = keyValueBox.put(dummyKey);
      debugPrint("Insert row id after closing $insertRowIdAfterClose");
    },
      throwsA(
        isA<Exception>().having(
              (e) => e,
          'message',
          'Value cannot be negative',
        ),
      ),
    );
  });

  test("Checking whether insert data is correct working", (){
      KeyValueStoreData keyOne = KeyValueStoreData(keyName: "Token", value: "abcd1234");
      KeyValueStoreData keyTwo = KeyValueStoreData(keyName: "Name", value: "John Doe");
      KeyValueStoreData keyThree = KeyValueStoreData(keyName: "Age", value: "33");
      int insertedRowId = keyValueBox.put(keyOne);
      int insertedRowId2 = keyValueBox.put(keyTwo);
      int insertedRowId3 = keyValueBox.put(keyThree);
      debugPrint("Inserted row id is $insertedRowId, $insertedRowId2, $insertedRowId3");
      expect(insertedRowId, 1);
      var storedValue = keyValueBox.get(insertedRowId);
      expect(storedValue?.keyName, "Token");
      expect(storedValue?.value, "abcd1234");
  });
}