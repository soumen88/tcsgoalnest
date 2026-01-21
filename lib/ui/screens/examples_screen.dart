import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tcsgoalnest/ui/commonwidgets/custom_app_bar.dart';
import 'package:tcsgoalnest/ui/commonwidgets/custom_loader.dart';
import 'package:tcsgoalnest/ui/commonwidgets/display_error_widget.dart';

import '../../core/routing/app_router.dart';
import '../commonwidgets/filled_button_widget.dart';

@RoutePage()
class ExamplesScreen extends StatelessWidget {
  const ExamplesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                    height: 300,
                    child: CustomLoader()
                ),
                SizedBox(
                  height: 350,
                  child: DisplayErrorWidget(
                    errorMessage: "Failed to get API response",
                  ),
                ),
                FilledButtonWidget(
                  buttonCaption: "Display Common Widgets",
                  onButtonPress: () {
                    context.router.push(const DisplayCommonWidgetsRoute());
                  },
                ),
                FilledButtonWidget(
                  buttonCaption: "Display Stream Example",
                  onButtonPress: () {
                    context.router.push(const StreamExampleRoute());
                  },
                ),
                FilledButtonWidget(
                  buttonCaption: "Display Person Example",
                  onButtonPress: () {
                    context.router.push(const PersonSingletonDbInsertRoute());
                  },
                ),
              ],
            ),
          )
      ),
    );
  }
}
