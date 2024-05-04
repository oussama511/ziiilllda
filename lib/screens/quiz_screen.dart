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
      appBar: !Responsive.isDesktop(context)
          ? AppBar(
              elevation: 0,
              backgroundColor: Color.fromARGB(255, 193, 201, 242),
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
            Expanded(
              flex: 10,
              child: Container(
                width: double.infinity,
                height: screenHeight,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    vertical: 30.0,
                    horizontal: 30.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Header(),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical * 4,
                      ),
                      // Add your QuizScreen content here
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
