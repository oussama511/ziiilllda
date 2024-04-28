import 'package:flutter/material.dart';
import 'package:operator_forvia/component/AppBarActionItems.dart';
import 'package:operator_forvia/component/header.dart';
import 'package:operator_forvia/component/paymentdetailList.dart';
import 'package:operator_forvia/component/sidemenu.dart';
import 'package:operator_forvia/config/responsive.dart';
import 'package:operator_forvia/config/size_config.dart';
import 'package:operator_forvia/dashboard4.dart';
// Import QuizScreen
import 'package:operator_forvia/style/colors.dart';

// ignore: must_be_immutable
class QuizScreenWithDashboard extends StatelessWidget {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  QuizScreenWithDashboard({super.key});

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
                icon: const Icon(
                  Icons.menu,
                  color: AppColors.black,
                ),
              ),
              actions: const [
                AppBarActionItems(),
              ],
            )
          : const PreferredSize(
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
                  padding: const EdgeInsets.symmetric(
                      vertical: 30.0, horizontal: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Header(),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical * 4,
                      ),
                      // Replace the text widget with QuizScreen
                      QuizScreen(),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical * 4,
                      ),
                      if (!Responsive.isDesktop(context)) PaymentDetailList(),
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
                        if (Responsive.isDesktop(context)) PaymentDetailList(),
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
