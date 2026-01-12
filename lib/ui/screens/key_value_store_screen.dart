import 'package:flutter/material.dart';
import 'package:tcsgoalnest/core/schema/key_value_store_data.dart';
import 'package:tcsgoalnest/core/table/key_value_store_manager.dart';
import 'package:tcsgoalnest/core/utils/logger_util.dart';

class KeyValueStoreScreen extends StatefulWidget {
  const KeyValueStoreScreen({super.key});

  @override
  State<KeyValueStoreScreen> createState() => _KeyValueStoreScreenState();
}

class _KeyValueStoreScreenState extends State<KeyValueStoreScreen> {
  final KeyValueStoreManager _manager = KeyValueStoreManager();
  final _logger = LoggerUtil();
  final _TAG = "KeyValueStoreScreen";
  int dbCount = 0;
  @override
  void initState() {
    initialize();
    super.initState();
  }

  Future<void> initialize() async{
     await _manager.createAppDb();
     dbCount = _manager.getAllRowCount();
     _logger.log(TAG: _TAG, message: "Total rows found $dbCount");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text("Key Value Screen"),
      ),
      body: Column(
        children: [
          Row(
            children: [
              FilledButton(
                  onPressed: (){
                    //_manager.insert(objectKeyName: "Key One", objecValue: "Value for key one");
                    _manager.insert(objectKeyName: "X", objecValue: "Value for X");
                    _manager.insert(objectKeyName: "Z", objecValue: "Value for Z");
                    _manager.insert(objectKeyName: "G", objecValue: "Value for G");
                    if(dbCount == 0){
                      setState(() {

                      });
                    }

                  },
                  child: Text("Insert Data")
              ),
              FilledButton(
                  onPressed: (){
                    /*KeyValueStoreData keyValueStore = KeyValueStoreData(
                        keyName: "Age",
                        value: "33",
                        defaultValue: "25"
                    );*/
                    _manager.insert(objectKeyName: "AgeFour", objecValue: "33", defaultValue: "25");
                  },
                  child: Text("Insert with default")
              ),
              FilledButton(
                  onPressed: (){
                    String? value = _manager.getValueFromKeyStore(objectKeyName: "AgeOne");
                    _logger.log(TAG: _TAG, message: "Value found $value");
                  },
                  child: Text("Read Data")
              )
            ],
          ),
          Expanded(
              child: StreamBuilder(
                  stream: _manager.listenToKeyStore(),
                  builder: (BuildContext context, AsyncSnapshot<List<KeyValueStoreData>> snapshot){
                    if(snapshot.hasData){
                      List<KeyValueStoreData> dataList = snapshot.data!;
                      return ListView.builder(
                          itemCount: dataList.length,
                          itemBuilder: (BuildContext context, int index){
                            KeyValueStoreData keyStoreData = dataList[index];
                            return ListTile(
                              title: Text("Saved in DB ${keyStoreData.value}"),
                              subtitle: Row(
                                children: [
                                  Text("Key name ${keyStoreData.keyName}"),
                                  Builder(
                                      builder: (BuildContext context){
                                        if(keyStoreData.defaultValue != null){
                                          return Text("Default value ${keyStoreData.defaultValue}");
                                        }
                                        else{
                                          return SizedBox.shrink();
                                        }
                                      }
                                  ),
                                ],
                              ),
                            );
                          }
                      );
                    }
                    else{
                      return Text("No data found");
                    }
                  }
              )
          )
        ],
      ),
    );
  }
}
