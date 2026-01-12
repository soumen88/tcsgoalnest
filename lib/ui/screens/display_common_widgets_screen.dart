import 'package:flutter/material.dart';
import 'package:tcsgoalnest/core/utils/logger_util.dart';
import 'package:tcsgoalnest/ui/commonwidgets/bold_text_widget.dart';
import 'package:tcsgoalnest/ui/commonwidgets/filled_button_widget.dart';
import 'package:tcsgoalnest/ui/commonwidgets/italic_text_widget.dart';
import 'package:tcsgoalnest/ui/commonwidgets/outline_button_widget.dart';
import 'package:tcsgoalnest/ui/commonwidgets/regular_text_widget.dart';

class DisplayCommonWidgetsScreen extends StatelessWidget {
  final _logger = LoggerUtil();
  final _TAG = "DisplayCommonWidgetsScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BoldTextWidget(
                textToDisplay: "We are learning about common widgets",
                textAlignment: TextAlign.center,
                fontSize: 30,
            ),
            FilledButtonWidget(
                buttonCaption: "Let's Get Started",
                onButtonPress: (){
                  _logger.log(TAG: _TAG, message: "Button was pressed");
                },
            ),
            BoldTextWidget(
              textToDisplay: "Outline Button Sample",
              textAlignment: TextAlign.center,
            ),
            FilledButtonWidget(
              buttonCaption: "Login",
            ),
            OutlineButtonWidget(
              buttonCaption: "Continue",
            ),

            RegularTextWidget(
                textToDisplay: "Hi, I am a regular text"
            ),
            RegularTextWidget(
                textToDisplay: " Making it easy to implement sustainable resource-efficient architectures, reducing unnecessary cloud waste and enhancing data privacy options.",
                textAlignment: TextAlign.center,
            ),
            RegularTextWidget(
                textToDisplay: "Hi, below is a italic text widget"
            ),
            ItalicTextWidget(
                textToDisplay: "Building and maintaining a font collection on the computer you use for design work is an important part of life as a designer. "
            )
          ],
        ),
      ),
    );
  }
}
