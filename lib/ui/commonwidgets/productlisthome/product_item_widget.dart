import 'package:flutter/material.dart';
import 'package:tcsgoalnest/core/constants/color_constants.dart';
import 'package:tcsgoalnest/core/constants/image_constants.dart';
import 'package:tcsgoalnest/core/dependency/injectable_setup.dart';
import 'package:tcsgoalnest/core/utils/logger_util.dart';
import 'package:tcsgoalnest/data/ecommercemodels/product_data_model.dart';
import 'package:tcsgoalnest/ui/commonwidgets/bold_text_widget.dart';
import 'package:tcsgoalnest/ui/commonwidgets/italic_text_widget.dart';
import 'package:tcsgoalnest/ui/commonwidgets/regular_text_widget.dart';

class ProductItemWidget extends StatelessWidget {
  final ProductDataModel productDetails;
  const ProductItemWidget({super.key, required this.productDetails});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 10,
          children: [
            Container(
              width: 140,
              height: 140,
              child: Stack(
                children: [
                  Positioned.fill(
                      child: ClipOval(
                        clipBehavior: Clip.none,
                        child: Image.asset(
                          "assets/images/product_images/${productDetails.assetImagePath}",
                          fit: BoxFit.cover,
                        ),
                      ),
                  ),
                  Positioned(
                      top: 10,
                      right: 0,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                        decoration: BoxDecoration(
                          color: ColorConstants.kDarkBlueColor,
                          borderRadius: BorderRadius.circular(6)
                        ),
                        child: Row(
                          children: [
                            Icon(
                                Icons.star,
                                color: Colors.orange,
                            ),
                            RegularTextWidget(
                                textToDisplay: "${productDetails.rating}",
                                textColor: ColorConstants.kWhiteColor,
                                fontSize: 20,
                            ),
                          ],
                        ),
                      )
                  )
                ],
              )
            ),
            Expanded(
              child: BoldTextWidget(
                  textToDisplay: productDetails.name,
                  fontSize: 18,
                  textAlignment: TextAlign.center,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RegularTextWidget(
                    textToDisplay: "Price: \u20B9${productDetails.price}",
                    displayStrikeThrough: true,
                ),

                ItalicTextWidget(
                    textToDisplay: "${productDetails.discount}% OFF"
                )
              ],
            ),
            Text.rich(
              TextSpan(
                children: <TextSpan>[
                  TextSpan(
                      text: 'Disc Price:',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                      ) // Bold style
                  ),
                  TextSpan(
                      text: '\u20B9${productDetails.discountedPrice}',
                      style: TextStyle(
                          color: ColorConstants.kBlackColor,
                          fontSize: 18
                      )
                  ),
                ],
              ),
              textAlign: TextAlign.center, // Aligns the entire text block
            ),
          ],
        ),
      ),
    );
  }
}
