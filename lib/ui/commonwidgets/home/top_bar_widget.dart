import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:tcsgoalnest/core/constants/app_constants.dart';
import 'package:tcsgoalnest/core/constants/color_constants.dart';
import 'package:tcsgoalnest/core/constants/image_constants.dart';
import 'package:tcsgoalnest/core/dependency/injectable_setup.dart';
import 'package:tcsgoalnest/core/schema/key_value_store_data.dart';
import 'package:tcsgoalnest/core/table/key_value_store_manager.dart';
import 'package:tcsgoalnest/core/utils/pretty_logger_util.dart';
import 'package:tcsgoalnest/ui/commonwidgets/bold_text_widget.dart';
import 'package:tcsgoalnest/ui/commonwidgets/display_text_field_widget.dart';
import 'package:tcsgoalnest/ui/commonwidgets/empty_widget.dart';

class TopBarWidget extends StatefulWidget {

  TopBarWidget({super.key});

  @override
  State<TopBarWidget> createState() => _TopBarWidgetState();
}

class _TopBarWidgetState extends State<TopBarWidget> {
  final TextEditingController nameController = TextEditingController();
  final _logger = locator<PrettyLoggerUtil>();
  final _TAG = "TopBarWidgetState";
  final GlobalKey<FormState> formKey = GlobalKey();
  final _storeManager = locator<KeyValueStoreManager>();
  String? userName;
  @override
  void initState() {
    userName = _storeManager.getValue(AppConstants.kStringUserName);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
        color: ColorConstants.kDarkAzureColor,
      ),
      child: Stack(
        children: [
          Positioned(
              left: 20,
              bottom: 30,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  BoldTextWidget(
                      textToDisplay: "Hi ",
                      textColor: ColorConstants.kWhiteColor,
                      fontSize: 36,
                  ),
                  Builder(

                      builder: (BuildContext context){
                        if(userName != null && userName!.isNotEmpty){
                          return BoldTextWidget(
                            textToDisplay: userName ?? '',
                            textColor: ColorConstants.kWhiteColor,
                            fontSize: 40,
                          );
                        }
                        else{
                          return GestureDetector(
                            onTap: (){
                              showPopup(context);
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.only(left: 16),
                              decoration: BoxDecoration(
                                  border: BoxBorder.all(
                                      width: 2,
                                      color: ColorConstants.kWhiteColor
                                  ),
                                  borderRadius: BorderRadius.circular(12)
                              ),
                              child: Image.asset(
                                ImageConstants.kPencilImage,
                                width: 50,
                                height: 50,
                              ),
                            ),
                          );
                        }
                      }
                  ),

                ],
              )
          ),
          SizedBox(
            width: 10,
          ),
          Positioned(
              top: 20,
              right: 20,
              child: Lottie.asset(
                  ImageConstants.kSplashAnimation,
                  width: 180,
                  height: 180,
                  fit: BoxFit.contain
              ),
          )
        ],
      ),
    );
  }

  Future<void> showPopup(BuildContext context) async{
    await Alert(
      context: context,
      title: AppConstants.kAppName,
      desc: "What should we call you?",
      content: Form(
          key: formKey,
          child: DisplayTextFieldWidget(
              inputController: nameController,
              hintText: "What should we call you?",
              maxLength: 50,
              inputType: TextInputType.name,
          ),
      ),
      type: AlertType.info,
      style: AlertStyle(
        backgroundColor: ColorConstants.kWhiteColor
      ),
      buttons: [
        DialogButton(
            child: BoldTextWidget(
                textToDisplay: "Save",
                fontSize: 14,
                textColor: ColorConstants.kWhiteColor,
            ),
            onPressed: (){

              if(formKey.currentState != null && formKey.currentState!.validate()){
                userName = nameController.text;
                _storeManager.insertKey(keyName: AppConstants.kStringUserName, value: nameController.text);
                setState(() {

                });
                context.router.pop();
              }
            },
            color: ColorConstants.kDarkPurpleColor,
        ),
        DialogButton(
          child: BoldTextWidget(
            textToDisplay: "Cancel",
            fontSize: 14,
            textColor: ColorConstants.kWhiteColor,
          ),
          onPressed: (){
            context.router.pop();
          },
          color: ColorConstants.kDarkPurpleColor,
        ),
      ]
    ).show();
  }
}
