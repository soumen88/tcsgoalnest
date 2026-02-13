import 'package:flutter/material.dart';

import '../../../core/constants/color_constants.dart';
import '../regular_text_widget.dart';

class CardChipWidget extends StatelessWidget {
  final String label;
  final IconData icon;
  const CardChipWidget({super.key, required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: ColorConstants.kDarkAzureColor.withOpacity(0.08),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: ColorConstants.kDarkAzureColor.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: ColorConstants.kDarkAzureColor),
          const SizedBox(width: 6),
          RegularTextWidget(
            textToDisplay: label,
            fontSize: 14,
          ),
        ],
      ),
    );
  }
}
