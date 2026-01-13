import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tcsgoalnest/core/constants/image_constants.dart';
import 'package:tcsgoalnest/ui/commonwidgets/regular_text_widget.dart';

class DisplayErrorWidget extends StatelessWidget {
  final String? errorMessage;
  const DisplayErrorWidget({super.key, this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
                ImageConstants.kErrorImage,
                width: 300,
                height: 300,
            ),
            RegularTextWidget(
                textToDisplay: errorMessage ?? '',
                textColor: Colors.red,

            )
          ],
        ),
      ),
    );
  }
}
