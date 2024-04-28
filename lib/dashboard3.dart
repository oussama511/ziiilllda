import 'package:flutter/material.dart';
import 'package:operator_forvia/dashboard4.dart';
import 'package:operator_forvia/models/questions.dart';
import 'package:operator_forvia/screens/result_screen.dart';
import 'package:operator_forvia/widgets/answer_card.dart';
import 'package:operator_forvia/widgets/next_button.dart';
import 'package:operator_forvia/component/sidemenu.dart'; // Import SideMenu
import 'package:operator_forvia/component/AppBarActionItems.dart';
import 'package:operator_forvia/component/paymentdetailList.dart';
import 'package:operator_forvia/component/header.dart';
import 'package:operator_forvia/config/responsive.dart';
import 'package:operator_forvia/config/size_config.dart';
import 'package:operator_forvia/screens/quiz_screen.dart';
import 'package:operator_forvia/style/colors.dart';

class Dashboard3 extends StatelessWidget {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      key: _drawerKey,
      drawer: SizedBox(
        width: 100,
        child: SideMenu(
          screenHeight: screenHeight,
        ),
      ),
      appBar: !Responsive.isDesktop(context)
          ? AppBar(
              elevation: 0,
              backgroundColor: AppColors.white,
              leading: IconButton(
                onPressed: () {
                  _drawerKey.currentState?.openDrawer();
                },
                icon: Icon(
                  Icons.menu,
                  color: AppColors.black,
                ),
              ),
              actions: [
                AppBarActionItems(),
              ],
            )
          : PreferredSize(
              child: SizedBox(),
              preferredSize: Size.zero,
            ),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              Expanded(
                flex: 1,
                child: SideMenu(screenHeight: screenHeight),
              ),
            Expanded(
              flex: 10,
              child: Container(
                width: double.infinity,
                height: screenHeight,
                child: SingleChildScrollView(
                  padding:
                      EdgeInsets.symmetric(vertical: 30.0, horizontal: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Header(),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical * 4,
                      ),
                      // Replace the text widget with QuizScreen
                      QuizScreen(),
                    ],
                  ),
                ),
              ),
            ),
            if (Responsive.isDesktop(context))
              Expanded(
                flex: 4,
                child: Container(
                  width: double.infinity,
                  height: screenHeight,
                  color: AppColors.secondaryBg,
                  padding:
                      EdgeInsets.symmetric(vertical: 30.0, horizontal: 30.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        AppBarActionItems(),
                        PaymentDetailList(),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
