import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:operator_forvia/component/AppBarActionItems.dart';
import 'package:operator_forvia/component/barChartComponent.dart';
import 'package:operator_forvia/component/historyTable.dart';
import 'package:operator_forvia/component/paymentDetailList.dart';
import 'package:operator_forvia/component/sidemenu.dart';
import 'package:operator_forvia/config/responsive.dart';
import 'package:operator_forvia/config/size_config.dart';
import 'package:operator_forvia/style/colors.dart';
import 'package:operator_forvia/style/style.dart';

class Dashboard2 extends StatefulWidget {
  @override
  _Dashboard2State createState() => _Dashboard2State();
}

class _Dashboard2State extends State<Dashboard2> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  late Stopwatch _stopwatch;
  late Timer _timer;
  String _display = '00:00:00';

  @override
  void initState() {
    super.initState();
    _stopwatch = Stopwatch();
    _timer = Timer.periodic(
        Duration(milliseconds: 10), (Timer t) => _updateDisplay());
  }

  void _updateDisplay() {
    if (_stopwatch.isRunning) {
      setState(() {
        _display = _stopwatch.elapsed.inHours.toString().padLeft(2, '0') +
            ':' +
            (_stopwatch.elapsed.inMinutes % 60).toString().padLeft(2, '0') +
            ':' +
            (_stopwatch.elapsed.inSeconds % 60).toString().padLeft(2, '0') +
            ':' +
            ((_stopwatch.elapsed.inMilliseconds % 1000) / 10)
                .floor()
                .toString()
                .padLeft(2, '0');
      });
    }
  }

  void _startStopwatch() {
    setState(() {
      _stopwatch.start();
    });
  }

  void _stopStopwatch() {
    setState(() {
      _stopwatch.stop();
    });
  }

  void _resetStopwatch() {
    setState(() {
      _stopwatch.reset();
      _display = '00:00:00';
    });
  }

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
                      PrimaryText(
                        text: 'Time Counting Interface',
                        size: 30,
                        fontWeight: FontWeight.w800,
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical * 4,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          PrimaryText(
                            text: _display,
                            size: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical * 4,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              // Add functionality to navigate to the quiz screen here
                              // For example:
                              // Navigator.push(context, MaterialPageRoute(builder: (context) => QuizScreen()));
                            },
                            child: Text('Take Quiz'),
                          ),
                          ElevatedButton(
                            onPressed: _startStopwatch,
                            child: Text('Start'),
                          ),
                          SizedBox(width: 20),
                          ElevatedButton(
                            onPressed: _stopStopwatch,
                            child: Text('Stop'),
                          ),
                          SizedBox(width: 20),
                          ElevatedButton(
                            onPressed: _resetStopwatch,
                            child: Text('Reset'),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical * 4,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              PrimaryText(
                                text: 'Historique',
                                size: 16,
                                fontWeight: FontWeight.w800,
                                color: AppColors.secondary,
                              ),
                              PrimaryText(
                                text: 'Operateur N°',
                                size: 30,
                                fontWeight: FontWeight.w800,
                              ),
                            ],
                          ),
                          PrimaryText(
                            text: 'Dérnier Test',
                            size: 16,
                            color: AppColors.secondary,
                          )
                        ],
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical * 3,
                      ),
                      Container(
                        height: 180,
                        child: Barchartcomponent(),
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical * 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PrimaryText(
                            text: 'Historique',
                            size: 30,
                            fontWeight: FontWeight.w800,
                          ),
                          PrimaryText(
                            text: 'Opération-Temps-Status',
                            size: 16,
                            color: AppColors.secondary,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical * 3,
                      ),
                      Historytable(),
                      if (!Responsive.isDesktop(context)) PaymentDetailList()
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
                      children: [AppBarActionItems(), PaymentDetailList()],
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

class PrimaryText extends StatelessWidget {
  final String text;
  final double size;
  final FontWeight fontWeight;
  final Color color;

  PrimaryText({
    required this.text,
    this.size = 14,
    this.fontWeight = FontWeight.normal,
    this.color = AppColors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
