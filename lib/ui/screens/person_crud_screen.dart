import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import '../../core/table/person_store_manager.dart';
import '../../core/utils/logger_util.dart';

@RoutePage()
class PersonCrudScreen extends StatefulWidget {
  const PersonCrudScreen({super.key});

  @override
  State<PersonCrudScreen> createState() => _PersonCrudScreenState();
}

class _PersonCrudScreenState extends State<PersonCrudScreen> {
  final PersonStoreManager _manager1 = PersonStoreManager();
  final PersonStoreManager _manager2 = PersonStoreManager();
  final _logger = LoggerUtil();
  final _TAG = "PersonCrudScreen";
  int dbCount = 0;
  @override
  void initState() {
    initialize();
    super.initState();
  }

  Future<void> initialize() async{

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Person Crud Screen"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FilledButton(
            onPressed: () {
                _logger.log(TAG: _TAG, message: "Hash code 1 ${_manager1.hashCode}");
            },
            child: Text("Insert Data 1"),
          ),
          FilledButton(
            onPressed: () {
              _logger.log(TAG: _TAG, message: "Hash code 2 ${_manager2.hashCode}");
            },
            child: Text("Insert Data 2"),
          ),
        ],
      ),
    )
    );
  }
}