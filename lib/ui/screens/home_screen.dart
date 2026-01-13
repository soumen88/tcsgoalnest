import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:tcsgoalnest/ui/commonwidgets/custom_loader.dart';
import 'package:tcsgoalnest/ui/commonwidgets/display_error_widget.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(child: CustomLoader()),
            Expanded(
                child: DisplayErrorWidget(
                  errorMessage: "Failed to get API response",
                )
            ),
          ],
        )
      ),
    );
  }
}
