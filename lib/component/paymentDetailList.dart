import 'package:flutter/material.dart';
import 'package:operator_forvia/component/paymentListTile.dart';
import 'package:operator_forvia/config/size_config.dart';
import 'package:operator_forvia/data.dart';
import 'package:operator_forvia/style/colors.dart';
import 'package:operator_forvia/style/style.dart';

class PaymentDetailList extends StatelessWidget {
  const PaymentDetailList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: SizeConfig.blockSizeVertical * 5,
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              boxShadow: [
                BoxShadow(
                    color: AppColors.iconGray,
                    blurRadius: 15.0,
                    offset: const Offset(10.0, 15.0))
              ]),
          child: Image.asset('images/card.png'),
        ),
        SizedBox(
          height: SizeConfig.blockSizeVertical * 5,
        ),
        Column(
          children: [
            PrimaryText(
              text: 'Recent Activities',
              size: 18,
              fontWeight: FontWeight.w800,
            ),
            PrimaryText(
              text: '02 Mar 2024',
              size: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.secondary,
            ),
          ],
        ),
        SizedBox(
          height: SizeConfig.blockSizeVertical * 2,
        ),
        Column(
          children: List.generate(
            recentActivities.length,
            (index) => PaymentListTile(
              icon: recentActivities[index]["icon"],
              label: recentActivities[index]["label"],
              amount: recentActivities[index]["amount"],
              onPressed: () {},
            ),
          ),
        ),
        SizedBox(
          height: SizeConfig.blockSizeVertical * 2,
        ),
        Column(
          children: [
            PrimaryText(
              text: 'Upcoming Projects',
              size: 18,
              fontWeight: FontWeight.w800,
            ),
            PrimaryText(
              text: '02 Mar 2024',
              size: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.secondary,
            ),
          ],
        ),
        SizedBox(
          height: SizeConfig.blockSizeVertical * 2,
        ),
        Column(
          children: List.generate(
            upcomingPayments.length,
            (index) => PaymentListTile(
              icon: upcomingPayments[index]["icon"],
              label: upcomingPayments[index]["label"],
              amount: upcomingPayments[index]["amount"],
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }
}
