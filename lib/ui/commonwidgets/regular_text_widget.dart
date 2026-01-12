import 'package:flutter/material.dart';
import 'package:tcsgoalnest/core/constants/color_constants.dart';

class RegularTextWidget extends StatelessWidget {
  final String textToDisplay;
  final TextAlign textAlignment;
  const RegularTextWidget({super.key, required this.textToDisplay, this.textAlignment = TextAlign.left});

  @override
  Widget build(BuildContext context) {
    return Text(
      textToDisplay,
      style: TextStyle(
        color: ColorConstants.kBlackColor,
        fontSize: 16
      ),
      textAlign: textAlignment,
    );
  }
}
