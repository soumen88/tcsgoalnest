import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tcsgoalnest/core/constants/color_constants.dart';
import 'package:tcsgoalnest/ui/commonwidgets/regular_text_widget.dart';

import '../../../core/constants/image_constants.dart';

class GoogleSignInButton extends StatelessWidget {
  final VoidCallback onButtonPress;
  const GoogleSignInButton({super.key, required this.onButtonPress});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Padding(
          padding: EdgeInsets.only(left: 14, right: 14),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  onButtonPress.call();
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.all(18),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),
                      color: ColorConstants.kWhiteColor
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        ImageConstants.kGoogleLogo,
                        width: 25,
                        height: 25,
                      ),
                      SizedBox(
                        width: 9,
                      ),
                      RegularTextWidget(
                        textToDisplay: "Sign in with Google",
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}
