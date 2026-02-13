import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:tcsgoalnest/core/constants/color_constants.dart';
import 'package:tcsgoalnest/data/ecommercemodels/product_data_model.dart';
import 'package:tcsgoalnest/data/ecommercemodels/product_review_model.dart';

import '../commonwidgets/bold_text_widget.dart';
import '../commonwidgets/custom_app_bar.dart';
import '../commonwidgets/italic_text_widget.dart';
import '../commonwidgets/productdescription/card_chip_widget.dart';
import '../commonwidgets/regular_text_widget.dart';

@RoutePage()
class ProductDescriptionScreen extends StatelessWidget {
  final ProductDataModel productDataModel;

  const ProductDescriptionScreen({
    super.key,
    required this.productDataModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildProductImage(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BoldTextWidget(
                    textToDisplay: productDataModel.name,
                    fontSize: 22,
                    textAlignment: TextAlign.left,
                  ),
                  const SizedBox(height: 8),
                  _buildMetaRow(),
                  const SizedBox(height: 12),
                  _buildPriceSection(),
                  const SizedBox(height: 12),
                  _buildAvailabilityChip(),
                  const SizedBox(height: 16),
                  _buildSectionTitle('Description'),
                  const SizedBox(height: 6),
                  RegularTextWidget(
                    textToDisplay: productDataModel.description,
                    fontSize: 15,
                    textAlignment: TextAlign.left,
                  ),
                  if (productDataModel.reviewsList != null &&
                      productDataModel.reviewsList!.isNotEmpty) ...[
                    const SizedBox(height: 20),
                    _buildSectionTitle('Reviews (${productDataModel.reviewsList!.length})'),
                    const SizedBox(height: 8),
                    _buildReviewsList(),
                  ],
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductImage() {
    return Container(
      height: 280,
      width: double.infinity,
      color: Colors.grey.shade100,
      child: Image.asset(
        'assets/images/product_images/${productDataModel.assetImagePath}',
        fit: BoxFit.contain,
        errorBuilder: (_, __, ___) => const Center(
          child: Icon(Icons.image_not_supported, size: 64, color: Colors.grey),
        ),
      ),
    );
  }

  Widget _buildMetaRow() {
    return Row(
      children: [
        CardChipWidget(label: productDataModel.brand, icon: Icons.branding_watermark),
        const SizedBox(width: 8),
        CardChipWidget(label: productDataModel.category, icon: Icons.category),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: ColorConstants.kDarkBlueColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.star, color: Colors.amber, size: 20),
              const SizedBox(width: 4),
              RegularTextWidget(
                textToDisplay: productDataModel.rating.toStringAsFixed(1),
                textColor: ColorConstants.kWhiteColor,
                fontSize: 16,
              ),
            ],
          ),
        ),
      ],
    );
  }

  
  Widget _buildPriceSection() {
    final discountedPrice = productDataModel.discountedPrice > 0
        ? productDataModel.discountedPrice
        : (productDataModel.price * (1 - productDataModel.discount / 100)).round();

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: ColorConstants.kDarkBlueColor.withOpacity(0.06),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: ColorConstants.kDarkBlueColor.withOpacity(0.2)),
      ),
      child: Row(
        children: [
          if (productDataModel.discount > 0) ...[
            RegularTextWidget(
              textToDisplay: '\u20B9${productDataModel.price}',
              displayStrikeThrough: true,
              fontSize: 16,
            ),
            const SizedBox(width: 12),
            ItalicTextWidget(
              textToDisplay: '${productDataModel.discount}% OFF',
              fontSize: 14,
            ),
            const SizedBox(width: 12),
          ],
          BoldTextWidget(
            textToDisplay: '\u20B9$discountedPrice',
            fontSize: 22,
            textColor: ColorConstants.kDarkAzureColor,
          ),
          const SizedBox(width: 6),
          RegularTextWidget(
            textToDisplay: '/ ${productDataModel.unit}',
            fontSize: 14,
          ),
        ],
      ),
    );
  }

  Widget _buildAvailabilityChip() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: productDataModel.availability
              ? Colors.green.withOpacity(0.15)
              : Colors.red.withOpacity(0.15),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: productDataModel.availability ? Colors.green : Colors.red,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              productDataModel.availability ? Icons.check_circle : Icons.cancel,
              size: 20,
              color: productDataModel.availability ? Colors.green : Colors.red,
            ),
            const SizedBox(width: 6),
            RegularTextWidget(
              textToDisplay: productDataModel.availability ? 'In stock' : 'Out of stock',
              fontSize: 14,
              textColor: productDataModel.availability ? Colors.green.shade800 : Colors.red.shade800,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return BoldTextWidget(
      textToDisplay: title,
      fontSize: 18,
      textAlignment: TextAlign.left,
      textColor: ColorConstants.kDarkAzureColor,
    );
  }

  Widget _buildReviewsList() {
    final reviews = productDataModel.reviewsList!;
    return Column(
      children: reviews.map((review) => _buildReviewTile(review)).toList(),
    );
  }

  Widget _buildReviewTile(ProductReviewModel review) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: ColorConstants.kDarkBlueColor,
                  radius: 16,
                  child: RegularTextWidget(
                    textToDisplay: 'U${review.userId}',
                    textColor: ColorConstants.kWhiteColor,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(width: 10),
                ...List.generate(5, (i) => Icon(
                  i < review.rating ? Icons.star : Icons.star_border,
                  size: 18,
                  color: Colors.amber,
                )),
                const SizedBox(width: 6),
                RegularTextWidget(
                  textToDisplay: '${review.rating}/5',
                  fontSize: 14,
                ),
              ],
            ),
            const SizedBox(height: 8),
            RegularTextWidget(
              textToDisplay: review.comment,
              fontSize: 14,
              textAlignment: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }
}
