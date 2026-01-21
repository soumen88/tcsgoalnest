import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tcsgoalnest/core/constants/app_constants.dart';
import 'package:tcsgoalnest/core/constants/color_constants.dart';
import 'package:tcsgoalnest/core/constants/image_constants.dart';
import 'package:tcsgoalnest/core/routing/app_router.dart';
import 'package:tcsgoalnest/ui/commonwidgets/regular_text_widget.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(
        color: ColorConstants.kDarkAzureColor
      ),
      title: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RegularTextWidget(
                  textToDisplay: AppConstants.kAppName,
                  textColor: ColorConstants.kWhiteColor,
                ),
                RegularTextWidget(
                  textToDisplay: AppConstants.kAppSubtitle,
                  textColor: ColorConstants.kWhiteColor,
                  fontSize: 10,
                )
              ],
            ),
            GestureDetector(
              onTap: (){
                context.router.push(const ExamplesRoute());
              },
              child: Image.asset(
                  ImageConstants.kLogoOnly,
                  height: 50,
                  width: 50,

              ),
            )
          ],
        ),
      ),
      backgroundColor: ColorConstants.kDarkAzureColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
