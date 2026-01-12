import 'package:flutter/material.dart';
import 'package:tcsgoalnest/core/constants/color_constants.dart';

class ItalicTextWidget extends StatelessWidget {
  final String textToDisplay;
  final TextAlign textAlignment;
  final double fontSize;
  const ItalicTextWidget({super.key, required this.textToDisplay, this.textAlignment = TextAlign.left, this.fontSize = 16});

  @override
  Widget build(BuildContext context) {
    return Text(
      textToDisplay,
      style: TextStyle(
          color: ColorConstants.kBlackColor,
          fontSize: fontSize,
          fontStyle: FontStyle.italic,
          fontFamily: "GermaniaOne"
      ),
      textAlign: textAlignment,
    );
  }
}
