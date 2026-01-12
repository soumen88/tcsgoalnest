import 'package:flutter/material.dart';
import 'package:tcsgoalnest/core/constants/color_constants.dart';

class FilledButtonWidget extends StatelessWidget {
  final String buttonCaption;
  final VoidCallback? onButtonPress;
  const FilledButtonWidget({super.key, required this.buttonCaption, this.onButtonPress});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll<Color>(ColorConstants.kDarkBlueColor),
          shape: WidgetStatePropertyAll<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            )
          )
        ),
        onPressed: (){
            onButtonPress?.call();
        },
        child: Text(
            buttonCaption,
            style: TextStyle(
              color: ColorConstants.kWhiteColor,
              fontSize: 16
            ),
        )
    );
  }
}
