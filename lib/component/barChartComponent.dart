import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:operator_forvia/config/responsive.dart';
import 'package:operator_forvia/style/colors.dart';

class Barchartcomponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        borderData: FlBorderData(show: false),
        alignment: BarChartAlignment.spaceBetween,
        axisTitleData: FlAxisTitleData(
          leftTitle: AxisTitle(reservedSize: 20),
        ),
        gridData: FlGridData(
          drawHorizontalLine: true,
          horizontalInterval: 30,
        ),
        titlesData: FlTitlesData(
            leftTitles: SideTitles(
              reservedSize: 22,
              getTextStyles: (value) =>
                  const TextStyle(color: Colors.grey, fontSize: 12),
              getTitles: (value) {
                if (value == 0) {
                  return '0';
                } else if (value == 30) {
                  return '30k';
                } else if (value == 60) {
                  return '60k';
                } else if (value == 90) {
                  return '90k';
                } else {
                  return '';
                }
              },
            ),
            bottomTitles: SideTitles(
              showTitles: true,
              getTextStyles: (value) =>
                  const TextStyle(color: Colors.grey, fontSize: 12),
              getTitles: (value) {
                if (value == 0) {
                  return 'Premier';
                } else if (value == 1) {
                  return 'Deuxième';
                } else if (value == 2) {
                  return 'Troisième';
                } else if (value == 3) {
                  return 'Quatrième';
                } else if (value == 4) {
                  return 'Cinquième';
                } else if (value == 5) {
                  return 'Sixième';
                } else if (value == 6) {
                  return 'Septième';
                } else if (value == 7) {
                  return 'Huitième';
                } else if (value == 8) {
                  return 'Neuvième';
                } else if (value == 9) {
                  return 'Dixième';
                } else if (value == 10) {
                  return 'Onzième';
                } else if (value == 11) {
                  return 'Douzième';
                } else {
                  return '';
                }
              },
            )),
        barGroups: [
          BarChartGroupData(
            x: 0,
            barRods: [
              BarChartRodData(
                y: 10,
                colors: [Color.fromARGB(255, 9, 105, 137)],
                borderRadius: BorderRadius.circular(0),
                width: Responsive.isDesktop(context) ? 40 : 10,
                backDrawRodData: BackgroundBarChartRodData(
                  y: 90,
                  show: true,
                  colors: [AppColors.barBg],
                ),
              ),
            ],
          ),
          BarChartGroupData(
            x: 1,
            barRods: [
              BarChartRodData(
                y: 50,
                colors: [const Color.fromARGB(255, 9, 105, 137)],
                borderRadius: BorderRadius.circular(0),
                width: Responsive.isDesktop(context) ? 40 : 10,
                backDrawRodData: BackgroundBarChartRodData(
                  y: 90,
                  show: true,
                  colors: [AppColors.barBg],
                ),
              ),
            ],
          ),
          BarChartGroupData(
            x: 2,
            barRods: [
              BarChartRodData(
                y: 30,
                colors: [Color.fromARGB(255, 9, 105, 137)],
                borderRadius: BorderRadius.circular(0),
                width: Responsive.isDesktop(context) ? 40 : 10,
                backDrawRodData: BackgroundBarChartRodData(
                  y: 90,
                  show: true,
                  colors: [AppColors.barBg],
                ),
              ),
            ],
          ),
          BarChartGroupData(
            x: 3,
            barRods: [
              BarChartRodData(
                y: 80,
                colors: [Color.fromARGB(255, 9, 105, 137)],
                borderRadius: BorderRadius.circular(0),
                width: Responsive.isDesktop(context) ? 40 : 10,
                backDrawRodData: BackgroundBarChartRodData(
                  y: 90,
                  show: true,
                  colors: [AppColors.barBg],
                ),
              ),
            ],
          ),
          BarChartGroupData(
            x: 4,
            barRods: [
              BarChartRodData(
                y: 70,
                colors: [Color.fromARGB(255, 9, 105, 137)],
                borderRadius: BorderRadius.circular(0),
                width: Responsive.isDesktop(context) ? 40 : 10,
                backDrawRodData: BackgroundBarChartRodData(
                  y: 90,
                  show: true,
                  colors: [AppColors.barBg],
                ),
              ),
            ],
          ),
          BarChartGroupData(
            x: 5,
            barRods: [
              BarChartRodData(
                y: 20,
                colors: [Color.fromARGB(255, 9, 105, 137)],
                borderRadius: BorderRadius.circular(0),
                width: Responsive.isDesktop(context) ? 40 : 10,
                backDrawRodData: BackgroundBarChartRodData(
                  y: 90,
                  show: true,
                  colors: [AppColors.barBg],
                ),
              ),
            ],
          ),
          BarChartGroupData(
            x: 6,
            barRods: [
              BarChartRodData(
                y: 50,
                colors: [Color.fromARGB(255, 9, 105, 137)],
                borderRadius: BorderRadius.circular(0),
                width: Responsive.isDesktop(context) ? 40 : 10,
                backDrawRodData: BackgroundBarChartRodData(
                  y: 90,
                  show: true,
                  colors: [AppColors.barBg],
                ),
              ),
            ],
          ),
          BarChartGroupData(
            x: 7,
            barRods: [
              BarChartRodData(
                y: 60,
                colors: [Color.fromARGB(255, 9, 105, 137)],
                borderRadius: BorderRadius.circular(0),
                width: Responsive.isDesktop(context) ? 40 : 10,
                backDrawRodData: BackgroundBarChartRodData(
                  y: 90,
                  show: true,
                  colors: [AppColors.barBg],
                ),
              ),
            ],
          ),
          BarChartGroupData(
            x: 8,
            barRods: [
              BarChartRodData(
                y: 40,
                colors: [Color.fromARGB(255, 9, 105, 137)],
                borderRadius: BorderRadius.circular(0),
                width: Responsive.isDesktop(context) ? 40 : 10,
                backDrawRodData: BackgroundBarChartRodData(
                  y: 90,
                  show: true,
                  colors: [AppColors.barBg],
                ),
              ),
            ],
          ),
          BarChartGroupData(
            x: 9,
            barRods: [
              BarChartRodData(
                y: 20,
                colors: [Color.fromARGB(255, 9, 105, 137)],
                borderRadius: BorderRadius.circular(0),
                width: Responsive.isDesktop(context) ? 40 : 10,
                backDrawRodData: BackgroundBarChartRodData(
                  y: 90,
                  show: true,
                  colors: [AppColors.barBg],
                ),
              ),
            ],
          ),
          BarChartGroupData(
            x: 10,
            barRods: [
              BarChartRodData(
                y: 80,
                colors: [Color.fromARGB(255, 9, 105, 137)],
                borderRadius: BorderRadius.circular(0),
                width: Responsive.isDesktop(context) ? 40 : 10,
                backDrawRodData: BackgroundBarChartRodData(
                  y: 90,
                  show: true,
                  colors: [AppColors.barBg],
                ),
              ),
            ],
          ),
          BarChartGroupData(
            x: 11,
            barRods: [
              BarChartRodData(
                y: 10,
                colors: [Color.fromARGB(255, 9, 105, 137)],
                borderRadius: BorderRadius.circular(0),
                width: Responsive.isDesktop(context) ? 40 : 10,
                backDrawRodData: BackgroundBarChartRodData(
                  y: 90,
                  show: true,
                  colors: [AppColors.barBg],
                ),
              ),
            ],
          ),
        ],
      ),
      swapAnimationDuration: Duration(milliseconds: 150),
      swapAnimationCurve: Curves.linear,
    );
  }
}
