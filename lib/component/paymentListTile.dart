import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:operator_forvia/style/colors.dart';
import 'package:operator_forvia/style/style.dart';

class PaymentListTile extends StatelessWidget {
  final String? icon;
  final String? label;
  final VoidCallback? onPressed;
  const PaymentListTile({
    @required this.icon,
    this.label,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.only(left: 0, right: 20.0),
      visualDensity: VisualDensity.standard,
      leading: Container(
        width: 50.0,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: SvgPicture.asset(
          icon!,
          width: 20.0,
        ),
      ),
      title: PrimaryText(
        text: label!,
        size: 14.0,
        fontWeight: FontWeight.w500,
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PrimaryText(
            text: 'Notes',
            size: 12.0,
            color: AppColors.secondary,
          ),
          // Check if onPressed is provided, if so, display as button
          if (onPressed != null)
            ElevatedButton(
              onPressed: onPressed, // Assign onPressed callback
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary, // Button color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              child: PrimaryText(
                text: 'Details', // Button text
                size: 14.0,
                color: AppColors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
        ],
      ),
    );
  }
}
