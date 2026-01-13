import 'package:flutter/material.dart';
import 'package:tcsgoalnest/core/constants/color_constants.dart';

class BottomNavigationButton extends StatelessWidget {
  final String buttonCaption;
  final VoidCallback? onButtonPress;
  const BottomNavigationButton({super.key, required this.buttonCaption, this.onButtonPress});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(

        style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll<Color>(ColorConstants.kDarkAzureColor),
            minimumSize: WidgetStatePropertyAll<Size>(Size(double.infinity, 56.0)), // Sets
            shape: WidgetStatePropertyAll<OutlinedBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0)
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
