import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:operator_forvia/config/responsive.dart';
import 'package:operator_forvia/config/size_config.dart';
import 'package:operator_forvia/style/colors.dart';
import 'package:operator_forvia/style/style.dart';

class InfoCard extends StatelessWidget {
  final String? icon;
  final String? label;
  final String? amount;
  const InfoCard({this.icon, this.label, this.amount});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints:
          BoxConstraints(minWidth: Responsive.isDesktop(context) ? 200.0 : 160),
      padding: EdgeInsets.only(
          top: 20.0,
          left: 20.0,
          bottom: 20.0,
          right: Responsive.isDesktop(context) ? 40.0 : 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: AppColors.white,
      ),
      child: Column(
        children: [
          SvgPicture.asset(
            icon!,
            width: 35.0,
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical * 2,
          ),
          PrimaryText(
            text: label!,
            color: AppColors.secondary,
            size: 16.0,
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical * 2,
          ),
          PrimaryText(
            text: amount!,
            fontWeight: FontWeight.w700,
            color: AppColors.black,
            size: 18.0,
          ),
        ],
      ),
    );
  }
}
