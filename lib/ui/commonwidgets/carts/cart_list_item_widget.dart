import 'package:flutter/material.dart';
import 'package:tcsgoalnest/core/constants/color_constants.dart';
import 'package:tcsgoalnest/core/schema/cart_tracker_data.dart';
import 'package:tcsgoalnest/ui/commonwidgets/bold_text_widget.dart';
import 'package:tcsgoalnest/ui/commonwidgets/regular_text_widget.dart';

class CartListItemWidget extends StatelessWidget {
  final CartTrackerData cartTrackerData;
  final VoidCallback? onRemove;

  const CartListItemWidget({
    super.key,
    required this.cartTrackerData,
    this.onRemove,
  });

  String get _imagePath {
    final path = cartTrackerData.productImage;
    if (path.startsWith('assets/')) return path;
    return 'assets/images/product_images/$path';
  }

  double get _lineTotal =>
      cartTrackerData.price * cartTrackerData.quantity;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product image
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                width: 88,
                height: 88,
                color: Colors.grey.shade100,
                child: Image.asset(
                  _imagePath,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => const Icon(
                    Icons.image_not_supported,
                    size: 36,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            // Product info and price
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BoldTextWidget(
                    textToDisplay: cartTrackerData.productName,
                    fontSize: 16,
                    textColor: ColorConstants.kDarkAzureColor,
                  ),
                  if (cartTrackerData.productCategory.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    RegularTextWidget(
                      textToDisplay: cartTrackerData.productCategory,
                      fontSize: 12,
                      textColor: Colors.grey.shade700,
                    ),
                  ],
                  if (cartTrackerData.productDescription.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    RegularTextWidget(
                      textToDisplay: cartTrackerData.productDescription,
                      fontSize: 12,
                      textColor: Colors.grey.shade600,
                      textAlignment: TextAlign.left,
                    ),
                    const SizedBox(height: 6),
                  ],
                  const SizedBox(height: 6),
                  // Quantity
                  RegularTextWidget(
                    textToDisplay: 'Qty: ${cartTrackerData.quantity}',
                    fontSize: 13,
                    textColor: ColorConstants.kBlackColor,
                  ),
                  const SizedBox(height: 8),
                  // Highlighted price for this item
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: ColorConstants.kDarkBlueColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: ColorConstants.kDarkBlueColor.withOpacity(0.3),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        BoldTextWidget(
                          textToDisplay: '\u20B9${_lineTotal.toStringAsFixed(0)}',
                          fontSize: 18,
                          textColor: ColorConstants.kDarkAzureColor,
                        ),
                        const SizedBox(width: 6),
                        RegularTextWidget(
                          textToDisplay:
                              '(\u20B9${cartTrackerData.price.toStringAsFixed(0)} × ${cartTrackerData.quantity})',
                          fontSize: 11,
                          textColor: Colors.grey.shade700,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Remove button
            if (onRemove != null)
              IconButton(
                onPressed: onRemove,
                icon: const Icon(Icons.delete_outline),
                color: Colors.red.shade400,
                tooltip: 'Remove from cart',
              ),
          ],
        ),
      ),
    );
  }
}
