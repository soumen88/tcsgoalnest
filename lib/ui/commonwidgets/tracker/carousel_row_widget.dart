import 'package:flutter/material.dart';

import '../bold_text_widget.dart';
import '../regular_text_widget.dart';

class CarouselRowWidget extends StatelessWidget {

  final String title;
  final String value;


  const CarouselRowWidget({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BoldTextWidget(
          textToDisplay: title,
          fontSize: 16,
        ),
        RegularTextWidget(textToDisplay: value)
      ],
    );
  }
}
