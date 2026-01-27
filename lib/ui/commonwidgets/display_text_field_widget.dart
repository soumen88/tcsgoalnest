import 'package:flutter/material.dart';
import 'package:tcsgoalnest/core/constants/color_constants.dart';

class DisplayTextFieldWidget extends StatelessWidget {
  final TextEditingController inputController;
  final String hintText;
  final int maxLength;
  final TextInputType inputType;
  final bool isEnabled;
  const DisplayTextFieldWidget({ required this.inputController, required this.hintText, this.maxLength = 50, this.inputType = TextInputType.text, this.isEnabled = true ,super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: inputController,
      enabled: isEnabled,
      keyboardType: inputType,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: ColorConstants.kDarkBlueColor
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              width: 2,
              color: ColorConstants.kDarkBlueColor
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              width: 2,
              color: Colors.grey
          ),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: Colors.red
          )
        )
      ),
      validator: (String? input){
        if(input != null && input.isNotEmpty){
          return null;
        }
        else{
          return "Enter valid inputs";
        }
      },
    );
  }
}
