import 'package:flutter/material.dart';
import 'package:tcsgoalnest/core/constants/color_constants.dart';

class RegularTextWidget extends StatelessWidget {
  final String textToDisplay;
  final TextAlign textAlignment;
  final Color textColor;
  final double fontSize;
  final bool displayStrikeThrough;
  const RegularTextWidget({super.key, required this.textToDisplay, this.textAlignment = TextAlign.left, this.textColor = ColorConstants.kBlackColor, this.fontSize = 16, this.displayStrikeThrough = false});

  @override
  Widget build(BuildContext context) {
    return Text(
      textToDisplay,
      style: displayStrikeThrough ? TextStyle(
        color: textColor,
        fontSize: fontSize,
        decoration: TextDecoration.lineThrough,
        decorationColor: Colors.red,
        decorationThickness: 2.0, // Thicker line
      ) : TextStyle(
        color: textColor,
        fontSize: fontSize,

      ),
      textAlign: textAlignment,
    );
  }
}
