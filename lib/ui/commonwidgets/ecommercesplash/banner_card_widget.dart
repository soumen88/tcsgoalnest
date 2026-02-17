import 'package:flutter/material.dart';
import 'package:tcsgoalnest/core/constants/color_constants.dart';
import 'package:tcsgoalnest/data/ecommercemodels/offer_details_model.dart';
import 'package:tcsgoalnest/ui/commonwidgets/regular_text_widget.dart';

class BannerCardWidget extends StatelessWidget {
  final OfferDetailsModel offerDetails;

  const BannerCardWidget({
    super.key,
    required this.offerDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
    
            // Gradient Overlay for better text readability
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      ColorConstants.kDarkBlueColor,
                      ColorConstants.kBlackColor.withOpacity(0.7),
                    ],
                  ),
                ),
              ),
            ),
            // Content
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Discount Badge
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: ColorConstants.kGreenColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: RegularTextWidget(
                        textToDisplay: '${offerDetails.discountPercentage}% OFF',
                        textColor: ColorConstants.kBlackColor,
                        fontSize: 14,
                        textAlignment: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Headline
                    RegularTextWidget(
                      textToDisplay: offerDetails.headline,
                      textColor: ColorConstants.kWhiteColor,
                      fontSize: 20,
                      textAlignment: TextAlign.left,
                    ),
                    const SizedBox(height: 4),
                    // Description
                    RegularTextWidget(
                      textToDisplay: offerDetails.description,
                      textColor: ColorConstants.kWhiteColor.withOpacity(0.9),
                      fontSize: 12,
                      textAlignment: TextAlign.left,
                    ),
                    const SizedBox(height: 8),
                    // Valid Until
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          size: 14,
                          color: ColorConstants.kWhiteColor.withOpacity(0.8),
                        ),
                        const SizedBox(width: 4),
                        RegularTextWidget(
                          textToDisplay: 'Valid until ${offerDetails.validUntil}',
                          textColor: ColorConstants.kWhiteColor.withOpacity(0.8),
                          fontSize: 11,
                          textAlignment: TextAlign.left,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}