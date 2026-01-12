import 'package:flutter/material.dart';
import 'package:tcsgoalnest/core/constants/color_constants.dart';

class BoldTextWidget extends StatelessWidget {
  final String textToDisplay;
  final TextAlign textAlignment;
  final double fontSize;
  const BoldTextWidget({super.key, required this.textToDisplay, this.textAlignment = TextAlign.left, this.fontSize = 26});

  @override
  Widget build(BuildContext context) {
    return Text(
      textToDisplay,
      style: TextStyle(
          color: ColorConstants.kBlackColor,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          fontFamily: "Poppins"
      ),
      textAlign: textAlignment,
    );
  }
}
