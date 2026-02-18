import 'package:flutter/material.dart';
import 'package:tcsgoalnest/core/constants/color_constants.dart';
import 'package:tcsgoalnest/ui/commonwidgets/regular_text_widget.dart';
import 'package:tcsgoalnest/core/dependency/injectable_setup.dart';
import 'package:tcsgoalnest/core/table/cart_store_manager.dart';
import 'package:tcsgoalnest/core/schema/cart_tracker_data.dart';
import 'package:tcsgoalnest/ui/commonwidgets/empty_widget.dart';
import 'package:tcsgoalnest/ui/commonwidgets/display_error_widget.dart';

class CartWidget extends StatelessWidget {
  final VoidCallback? onCartTap;
  final double iconSize;
  final int productId;
  final _cartStoreManager = locator<CartStoreManager>();
  CartWidget({
    super.key,
    this.onCartTap,
    this.iconSize = 32.0,
    required this.productId,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onCartTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Shopping Cart Icon
          CircleAvatar(
            maxRadius: 30,
            child: Icon(
              Icons.shopping_cart_outlined,
              size: iconSize,
              color: ColorConstants.kDarkBlueColor,
            ),
          ),
          StreamBuilder<List<CartTrackerData>>(
            stream: _cartStoreManager.listenToCart(productId),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return EmptyWidget();
              } else if (snapshot.hasError) {
                return DisplayErrorWidget(
                  errorMessage: snapshot.error.toString(),
                );
              } else if (snapshot.hasData) {
                int itemCount = snapshot.data?.length ?? 0;
                return Positioned(
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
                      minWidth: 30,
                      minHeight: 30,
                    ),
                    child: Center(
                      child: RegularTextWidget(
                        textToDisplay: itemCount > 99
                            ? '99+'
                            : itemCount.toString(),
                        textColor: ColorConstants.kWhiteColor,
                        fontSize: 16,
                        textAlignment: TextAlign.center,
                      ),
                    ),
                  ),
                );
              }
              else{
                return EmptyWidget();
              }
            },
          ),
        ],
      ),
    );
  }
}
