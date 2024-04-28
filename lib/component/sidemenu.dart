import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:operator_forvia/dashboard.dart';
import 'package:operator_forvia/dashboard2.dart';
import 'package:operator_forvia/dashboard3.dart'; // Import dashboard3.dart
import 'package:operator_forvia/dashboard4.dart';
import 'package:operator_forvia/screens/quiz_screen.dart';
import 'package:operator_forvia/style/colors.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
    required this.screenHeight,
  }) : super(key: key);

  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: Container(
        width: double.infinity,
        height: screenHeight,
        color: AppColors.secondaryBg,
        child: Column(
          children: [
            Container(
              height: 100,
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(top: 20),
              child: Center(
                child: SizedBox(
                  width: 35,
                  height: 35,
                  child: SvgPicture.asset('images/mac-action.svg'),
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Dashboard()),
                );
              },
              icon: Container(
                width: 40,
                height: 50,
                child: Image.asset(
                  'images/abc.png',
                  color: AppColors.iconGray,
                ),
              ),
              iconSize: 20,
              padding: EdgeInsets.symmetric(vertical: 30.0),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Dashboard2()),
                );
              },
              icon: Container(
                width: 40,
                height: 50,
                child: Image.asset(
                  'images/chrono123.png',
                  color: AppColors.iconGray,
                ),
              ),
              iconSize: 20,
              padding: const EdgeInsets.symmetric(vertical: 30.0),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const QuizScreen()), // Use Dashboard3
                );
              },
              icon: Container(
                width: 40,
                height: 50,
                child: Image.asset(
                  'images/profile2.png',
                  color: AppColors.iconGray,
                ),
              ),
              iconSize: 20,
              padding: const EdgeInsets.symmetric(vertical: 30.0),
            ),
          ],
        ),
      ),
    );
  }
}
