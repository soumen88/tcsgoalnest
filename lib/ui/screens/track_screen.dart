import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:tcsgoalnest/ui/commonwidgets/regular_text_widget.dart';

@RoutePage()
class TrackScreen extends StatelessWidget {
  const TrackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RegularTextWidget(textToDisplay: "Inside Track screen"),
      ),
    );
  }
}
