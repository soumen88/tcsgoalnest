import 'package:flutter/material.dart';
import 'package:tcsgoalnest/core/constants/color_constants.dart';
import 'package:tcsgoalnest/ui/commonwidgets/regular_text_widget.dart';

class CartWidget extends StatelessWidget {
  final int itemCount;
  final VoidCallback? onCartTap;
  final double iconSize;

  const CartWidget({
    super.key,
    required this.itemCount,
    this.onCartTap,
    this.iconSize = 28.0,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onCartTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Shopping Cart Icon
          Icon(
            Icons.shopping_cart_outlined,
            size: iconSize,
            color: ColorConstants.kWhiteColor,
          ),
          // Badge showing item count
          if (itemCount > 0)
            Positioned(
              right: -8,
              top: -8,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: ColorConstants.kDarkPurpleColor,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: ColorConstants.kWhiteColor,
                    width: 1.5,
                  ),
                ),
                constraints: const BoxConstraints(
                  minWidth: 20,
                  minHeight: 20,
                ),
                child: Center(
                  child: RegularTextWidget(
                    textToDisplay: itemCount > 99 ? '99+' : itemCount.toString(),
                    textColor: ColorConstants.kWhiteColor,
                    fontSize: 10,
                    textAlignment: TextAlign.center,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}