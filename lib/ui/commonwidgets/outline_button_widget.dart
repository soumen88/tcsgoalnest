import 'package:flutter/material.dart';
import 'package:tcsgoalnest/core/constants/color_constants.dart';
import 'package:tcsgoalnest/ui/commonwidgets/regular_text_widget.dart';

class OutlineButtonWidget extends StatelessWidget {
  final String buttonCaption;
  final VoidCallback? onButtonPress;
  const OutlineButtonWidget({super.key, required this.buttonCaption, this.onButtonPress});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 100,
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll<Color>(ColorConstants.kWhiteColor),
              shape: WidgetStatePropertyAll<OutlinedBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                        color: ColorConstants.kDarkBlueColor,
                        width: 2
                      )
                  )
              ),

          ),
          onPressed: (){
            onButtonPress?.call();
          },
          child: Text(
            buttonCaption,
            style: TextStyle(
                color: ColorConstants.kBlackColor,
                fontSize: 16
            ),
          )
      ),
    );
  }
}
