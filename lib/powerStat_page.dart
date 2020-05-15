import 'dart:async';
import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'more_info_template.dart';

class PowerStats extends StatefulWidget {
  PowerStats(
      {this.speed,
      this.combat,
      this.durability,
      this.intellect,
      this.strength,
      this.image,
      this.name});

  final double strength;
  final double speed;
  final double intellect;
  final double combat;
  final double durability;
  final String name;
  final String image;

  @override
  State<StatefulWidget> createState() => PowerStatsState();
}

class PowerStatsState extends State<PowerStats> {
  final Color barBackgroundColor = const Color(0xFF0A1033);
  final Duration animDuration = Duration(milliseconds: 250);

  int touchedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Power Stats'),
      ),
      backgroundColor: Color(0xFF0A1033),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          MoreInfoTemplate(
            name: widget.name,
            image: widget.image,
          ),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFF3e4370),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            height: MediaQuery.of(context).size.height / 2.0,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width / 20),
                      child: BarChart(
                        mainBarData(),
                        swapAnimationDuration: animDuration,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  BarChartGroupData makeGroupData(
    int x,
    double y, {
    bool isTouched = false,
    Color barColor = Colors.white,
    double width = 20,
    List<int> showTooltips = const [],
  }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          y: isTouched ? y + 1 : y,
          color: isTouched ? Color(0xFFFF0167) : barColor,
          width: width,
          isRound: true,
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            y: 100,
            color: barBackgroundColor,
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(5, (i) {
        switch (i) {
          case 0:
            return makeGroupData(0, widget.strength,
                isTouched: i == touchedIndex);
          case 1:
            return makeGroupData(1, widget.speed, isTouched: i == touchedIndex);
          case 2:
            return makeGroupData(2, widget.intellect,
                isTouched: i == touchedIndex);
          case 3:
            return makeGroupData(3, widget.combat,
                isTouched: i == touchedIndex);
          case 4:
            return makeGroupData(4, widget.durability,
                isTouched: i == touchedIndex);
          default:
            return null;
        }
      });

  BarChartData mainBarData() {
    return BarChartData(
      barTouchData: BarTouchData(
          touchTooltipData: BarTouchTooltipData(
              tooltipBgColor: Colors.blueGrey,
              getTooltipItem: (group, groupIndex, rod, rodIndex) {
                String weekDay;
                switch (group.x.toInt()) {
                  case 0:
                    weekDay = 'Strength';
                    break;
                  case 1:
                    weekDay = 'Speed';
                    break;
                  case 2:
                    weekDay = 'Intellect';
                    break;
                  case 3:
                    weekDay = 'Combat';
                    break;
                  case 4:
                    weekDay = 'Durability';
                    break;
                }
                return BarTooltipItem(
                    weekDay + '\n' + (rod.y - 1).toString(),
                    TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width / 32));
              }),
          touchCallback: (barTouchResponse) {
            setState(() {
              if (barTouchResponse.spot != null &&
                  barTouchResponse.touchInput is! FlPanEnd &&
                  barTouchResponse.touchInput is! FlLongPressEnd) {
                touchedIndex = barTouchResponse.spot.touchedBarGroupIndex;
              } else {
                touchedIndex = -1;
              }
            });
          }),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
            showTitles: true,
            textStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.width / 32),
            margin: 20,
            getTitles: (double value) {
              switch (value.toInt()) {
                case 0:
                  return 'Strength';
                case 1:
                  return 'Speed';
                case 2:
                  return 'Intellect';
                case 3:
                  return 'Combat';
                case 4:
                  return 'Durability';
                default:
                  return '';
              }
            }),
        leftTitles: SideTitles(
          showTitles: false,
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(),
    );
  }
}
