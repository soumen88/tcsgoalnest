import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:tcsgoalnest/core/dependency/injectable_setup.dart';
import 'package:tcsgoalnest/core/schema/person_store_data.dart';
import 'package:tcsgoalnest/core/table/person_data_manager.dart';
import 'package:tcsgoalnest/core/table/person_store_manager.dart';
import 'package:tcsgoalnest/ui/commonwidgets/bold_text_widget.dart';
import 'package:tcsgoalnest/ui/commonwidgets/custom_loader.dart';
import 'package:tcsgoalnest/ui/commonwidgets/display_error_widget.dart';
import 'package:tcsgoalnest/ui/commonwidgets/regular_text_widget.dart';

@RoutePage()
class PersonSingletonDbReadScreen extends StatelessWidget {

  var personDataManager = locator<PersonStoreManager>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RegularTextWidget(
                textToDisplay: "Hash Code for the singleton in read screen"
            ),
            BoldTextWidget(
                textToDisplay: "${personDataManager.hashCode}"
            ),
            Expanded(
              child: StreamBuilder(
                  stream: personDataManager.listenToPersonStore(),
                  builder: (BuildContext context, AsyncSnapshot<List<PersonStoreData>> snapshot){
                    if(snapshot.connectionState == ConnectionState.waiting){
                      return const CustomLoader();
                    }
                    else if(snapshot.hasError){
                      return DisplayErrorWidget(
                        errorMessage: snapshot.error.toString(),
                      );
                    }
                    else{
                      List<PersonStoreData> personList = snapshot.data!;
                      return ListView.builder(
                          itemCount: personList.length,
                          itemBuilder: (BuildContext context, int index){
                            PersonStoreData currentPersonData = personList[index];

                            return ListTile(
                              title: BoldTextWidget(
                                  textToDisplay: currentPersonData.personName
                              ),
                              subtitle: Column(
                                children: [
                                  RegularTextWidget(
                                      textToDisplay: currentPersonData.personEmail
                                  ),
                                  RegularTextWidget(
                                      textToDisplay: "Person id ${currentPersonData.personId}"
                                  ),
                                ],
                              ),

                            );
                          }
                      );
                    }
                  }
              ),
            )
          ],
        ),
      ),
    );
  }
}
