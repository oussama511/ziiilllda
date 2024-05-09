import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:operator_forvia/component/comportementale.dart';
import 'package:operator_forvia/component/couturepage.dart';
import 'package:operator_forvia/component/formationcouturepage.dart';
import 'package:operator_forvia/component/machinepage.dart';
import 'package:operator_forvia/component/paymentListTile.dart';
import 'package:operator_forvia/config/size_config.dart';
import 'package:operator_forvia/data.dart';
import 'package:operator_forvia/style/colors.dart';
import 'package:operator_forvia/style/style.dart';

class PaymentDetailList extends StatefulWidget {
  const PaymentDetailList({
    Key? key,
  }) : super(key: key);

  @override
  _PaymentDetailListState createState() => _PaymentDetailListState();
}

class _PaymentDetailListState extends State<PaymentDetailList> {
  String selectedOperator = 'Operator 1'; // Default value

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
            DropdownButton<String>(
              value: selectedOperator,
              onChanged: (String? newValue) {
                setState(() {
                  selectedOperator = newValue!;
                });
              },
              items: <String>[
                'Operator 1',
                'Operator 2',
                'Operator 3',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: PrimaryText(
                    text: value,
                    size: 18,
                    fontWeight: FontWeight.w800,
                  ),
                );
              }).toList(),
            ),
            PrimaryText(
              text: 'Détail',
              size: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.secondary,
            ),
          ],
        ),
        SizedBox(
          height: SizeConfig.blockSizeVertical * 2,
        ),
        if (selectedOperator == 'Operator 1')
          Column(
            children: List.generate(
              recentActivities.length,
              (index) {
                VoidCallback? onPressed;
                switch (index) {
                  case 0:
                    onPressed = () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ComportementalePage(),
                        ),
                      );
                    };
                    break;
                  case 1:
                    onPressed = () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Formationcouturepage(),
                        ),
                      );
                    };
                    break;
                  case 2:
                    onPressed = () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Machinepage(),
                        ),
                      );
                    };
                    break;
                  case 3:
                    onPressed = () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Couturepage(),
                        ),
                      );
                    };
                    break;
                }
                return InkWell(
                  onTap: () {},
                  child: PaymentListTile(
                    icon: recentActivities[index]["icon"],
                    label: recentActivities[index]["label"],
                    onPressed: onPressed,
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}
