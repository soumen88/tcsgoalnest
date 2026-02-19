import 'package:flutter/material.dart';
import 'package:tcsgoalnest/core/constants/color_constants.dart';
import 'package:tcsgoalnest/core/dependency/injectable_setup.dart';
import 'package:tcsgoalnest/core/table/cart_store_manager.dart';
import 'package:tcsgoalnest/core/utils/logger_util.dart';

import '../bold_text_widget.dart';
import '../italic_text_widget.dart';
import '../regular_text_widget.dart';


class CartSummaryWidget extends StatefulWidget {
  @override
  State<CartSummaryWidget> createState() => _CartSummaryWidgetState();
}

class _CartSummaryWidgetState extends State<CartSummaryWidget> {

  double _totalPrice = 0.0;
  int _totalQuantity = 0;
  final _cartStoreManager = locator<CartStoreManager>();
  final _logger = locator<LoggerUtil>();
  final _TAG = "CartSummaryWidget";

  @override
  void initState() {
    super.initState();
    _calculateTotalPrice();
  } 

  Future<void> _calculateTotalPrice() async {
    var (double totalPriceReceived, int totalQuantityReceived) = await _cartStoreManager.getTotalPrice();
    _totalPrice = totalPriceReceived;
    _totalQuantity = totalQuantityReceived;
    _logger.log(TAG: _TAG, message: "Total price: $_totalPrice, Total quantity: $_totalQuantity");
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BoldTextWidget(
              textToDisplay: "Cart Summary",
              fontSize: 20,
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RegularTextWidget(
                  textToDisplay: "Total Items:",
                ),
                RegularTextWidget(
                  textToDisplay: _totalQuantity.toString(),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RegularTextWidget(
                  textToDisplay: "Total Price:",
                ),
                RegularTextWidget(
                  textToDisplay: "\u20B9${_totalPrice.toStringAsFixed(0)}",
                ),
              ],
            ),
            const SizedBox(height: 18),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Show dialog or navigate to shipping details
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text("Shipping Details"),
                      content: const Text(
                          "Please fill in your shipping details to proceed with your order."),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text("OK"),
                        )
                      ],
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorConstants.kDarkAzureColor,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: RegularTextWidget(
                  textToDisplay: "Fill Shipping Details",
                  fontSize: 16,
                  textColor: ColorConstants.kWhiteColor,
                ),
              ),
            ),
            const SizedBox(height: 8),
            ItalicTextWidget(
              textToDisplay: "Note: Products will be shipped in 7 days.",
            ),
          ],
        ),
      ),
    );
  }

}