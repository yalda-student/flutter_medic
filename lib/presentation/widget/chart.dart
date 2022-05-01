import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_medic_application/gen/fonts.gen.dart';
import 'dart:math' as math;

import 'package:flutter_medic_application/presentation/resources/color_manager.dart';
import 'package:flutter_medic_application/presentation/resources/font_manager.dart';
import 'package:flutter_medic_application/presentation/resources/style_manager.dart';
import 'package:flutter_medic_application/presentation/resources/value_manager.dart';

class AppBarChart extends StatefulWidget {
  const AppBarChart({Key? key}) : super(key: key);

  static const shadowColor = Color(0xFF5E8082);
  static const dataList = [
    _BarData(Color(0xff95CBCF), 195, 103),
    _BarData(Color(0xff95CBCF), 349, 204),
    _BarData(Color(0xff95CBCF), 327, 407),
    _BarData(Color(0xff95CBCF), 723, 368),
    _BarData(Color(0xff95CBCF), 230, 609),
    _BarData(Color(0xff95CBCF), 443, 826),
  ];

  @override
  State<AppBarChart> createState() => _AppBarChartState();
}

class _AppBarChartState extends State<AppBarChart> {
  BarChartGroupData generateBarGroup(
      int x, Color color, double value, double shadowValue) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(toY: value, color: color, width: AppSize.s12),
        BarChartRodData(
          toY: shadowValue,
          color: AppBarChart.shadowColor,
          width: AppSize.s12,
        ),
      ],
      showingTooltipIndicators: touchedGroupIndex == x ? [0] : [],
    );
  }

  int touchedGroupIndex = -1;

  @override
  Widget build(BuildContext context) {
    const week = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
                AppSize.s10, AppSize.s8, AppSize.s10, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "This Weeks's Stats",
                      style: getBoldStyle(
                          fontFamily: FontFamily.alegreyaSans,
                          color: ColorManager.white,
                          fontSize: FontSize.s15),
                    )),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Show All',
                      style: getBoldStyle(
                          fontFamily: FontFamily.alegreyaSans,
                          color: const Color(0xffC4C4C4),
                          fontSize: FontSize.s15),
                    )),
              ],
            ),
          ),
          Card(
            color: ColorManager.primary,
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                  AppSize.s25, AppSize.s14, AppSize.s25, AppSize.s0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AspectRatio(
                    aspectRatio: 1.4,
                    child: BarChart(
                      BarChartData(
                          alignment: BarChartAlignment.spaceBetween,
                          borderData: FlBorderData(
                            show: true,
                            border: const Border.symmetric(
                              horizontal: BorderSide(
                                color: Colors.transparent,
                              ),
                            ),
                          ),
                          titlesData: FlTitlesData(
                            show: true,
                            leftTitles: AxisTitles(
                              drawBehindEverything: true,
                              sideTitles: SideTitles(
                                showTitles: true,
                                reservedSize: 30,
                                getTitlesWidget: (value, meta) {
                                  return Text(
                                    value.toInt().toString(),
                                    style:  TextStyle(
                                      color: ColorManager.white.withOpacity(0.5),
                                    ),
                                    textAlign: TextAlign.left,
                                  );
                                },
                              ),
                            ),
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                reservedSize: 26,
                                getTitlesWidget: (value, meta) {
                                  final index = value.toInt();
                                  return Padding(
                                      padding: const EdgeInsets.only(top: AppSize.s4),
                                      child: Text(
                                        week[index],
                                        style: getRegularStyle(
                                            fontFamily: FontFamily.alegreyaSans,
                                            color: ColorManager.white
                                                .withOpacity(0.5)),
                                      ));
                                },
                              ),
                            ),
                            rightTitles: AxisTitles(),
                            topTitles: AxisTitles(),
                          ),
                          gridData: FlGridData(
                            show: true,
                            drawVerticalLine: false,
                            getDrawingHorizontalLine: (value) => FlLine(
                              color: const Color(0xFF606060),
                              dashArray: [3, 2],
                              strokeWidth: 1,
                            ),
                          ),
                          barGroups:
                              AppBarChart.dataList.asMap().entries.map((e) {
                            final index = e.key;
                            final data = e.value;
                            return generateBarGroup(index, data.color,
                                data.value, data.shadowValue);
                          }).toList(),
                          maxY: 999,
                          minY: 50),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BarData {
  final Color color;
  final double value;
  final double shadowValue;

  const _BarData(this.color, this.value, this.shadowValue);
}
