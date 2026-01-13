import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tcsgoalnest/core/constants/color_constants.dart';
import 'package:tcsgoalnest/core/constants/image_constants.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.kWhiteColor,
      body: Center(
        child: Lottie.asset(ImageConstants.kLoadingJson),
      ),
    );
  }
}
