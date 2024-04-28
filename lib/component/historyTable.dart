import 'package:flutter/material.dart';
import 'package:operator_forvia/config/responsive.dart';
import 'package:operator_forvia/config/size_config.dart';
import 'package:operator_forvia/data.dart';
import 'package:operator_forvia/style/colors.dart';
import 'package:operator_forvia/style/style.dart';

class Historytable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      scrollDirection:
          Responsive.isDesktop(context) ? Axis.vertical : Axis.horizontal,
      child: SizedBox(
        width: Responsive.isDesktop(context)
            ? double.infinity
            : SizeConfig.screenWidth,
        child: Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: List.generate(
            transactionHistory.length,
            (index) => TableRow(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(
                      top: 10.0, bottom: 10.0, left: 20.0),
                  child: CircleAvatar(
                    radius: 17,
                    backgroundImage:
                        NetworkImage(transactionHistory[index]['avatar']!),
                  ),
                ),
                PrimaryText(
                  text: transactionHistory[index]['label']!,
                  size: 16,
                  color: AppColors.secondary,
                ),
                PrimaryText(
                  text: transactionHistory[index]['time']!,
                  size: 16,
                  color: AppColors.secondary,
                ),
                PrimaryText(
                  text: transactionHistory[index]['amount']!,
                  size: 16,
                  color: AppColors.secondary,
                ),
                PrimaryText(
                  text: transactionHistory[index]['status']!,
                  size: 16,
                  color: AppColors.secondary,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
