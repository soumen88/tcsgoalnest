import 'package:flutter/material.dart';
import 'package:tcsgoalnest/core/constants/color_constants.dart';

class RegularTextWidget extends StatelessWidget {
  final String textToDisplay;
  final TextAlign textAlignment;
  final Color textColor;
  const RegularTextWidget({super.key, required this.textToDisplay, this.textAlignment = TextAlign.left, this.textColor = ColorConstants.kBlackColor});

  @override
  Widget build(BuildContext context) {
    return Text(
      textToDisplay,
      style: TextStyle(
        color: textColor,
        fontSize: 16
      ),
      textAlign: textAlignment,
    );
  }
}
