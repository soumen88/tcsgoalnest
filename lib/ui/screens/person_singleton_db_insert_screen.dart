import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tcsgoalnest/core/routing/app_router.dart';
import 'package:tcsgoalnest/core/table/person_data_manager.dart';
import 'package:tcsgoalnest/core/table/person_store_manager.dart';
import 'package:tcsgoalnest/core/utils/logger_util.dart';
import 'package:tcsgoalnest/ui/commonwidgets/filled_button_widget.dart';
import 'package:tcsgoalnest/ui/commonwidgets/outline_button_widget.dart';
import 'package:tcsgoalnest/ui/commonwidgets/regular_text_widget.dart';

import '../../core/dependency/injectable_setup.dart';

@RoutePage()
class PersonSingletonDbInsertScreen extends StatelessWidget {
  final _logger = LoggerUtil();
  final _TAG = "PersonSingletonDbInsertScreen";
  var personDataManagerOne = PersonDataManager();
  var personDataManagerTwo = PersonDataManager();
  var personStoreManagerOne = locator<PersonStoreManager>();
  var personStoreManagerTwo = locator<PersonStoreManager>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RegularTextWidget(
                textToDisplay: "Inside insert screen for learning singletons",
                fontSize: 28,
            ),
            FilledButtonWidget(
                buttonCaption: "Insert Button 1",
                onButtonPress: (){
                  personDataManagerOne.createAppDb();
                  _logger.log(TAG: _TAG, message: "Hash code for the first button ${personDataManagerOne.hashCode}");
                  _logger.log(TAG: _TAG, message: "Hash code for the first button in store manager ${personStoreManagerOne.hashCode}");
                },
            ),
            OutlineButtonWidget(
              buttonCaption: "Insert Button 2",
              onButtonPress: (){
                personStoreManagerTwo.insertPersonDetails(name: "Kishore Doe 12", age: 12, email: "example13@gmail.com");
                personStoreManagerTwo.insertPersonDetails(name: "Kishore Doe 3", age: 12, email: "example14@gmail.com");
                personStoreManagerTwo.insertPersonDetails(name: "Kishore Doe 4", age: 12, email: "example15@gmail.com");
                personStoreManagerTwo.insertPersonDetails(name: "Kishore Doe 5", age: 12, email: "example16@gmail.com");
                personStoreManagerTwo.insertPersonDetails(name: "Kishore Doe 6", age: 12, email: "example18@gmail.com");
                _logger.log(TAG: _TAG, message: "Hash code for the Second button ${personDataManagerTwo.hashCode}");
                _logger.log(TAG: _TAG, message: "Hash code for the Second button in store manager ${personStoreManagerTwo.hashCode}");
              },
            ),
            FilledButtonWidget(
                buttonCaption: "Open Read screen",
                onButtonPress: (){
                  context.router.push(const PersonSingletonDbReadRoute());
                },
            )
          ],
        ),
      ),
    );
  }
}
