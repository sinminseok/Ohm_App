import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shopping_tool/Utils/constants.dart';
import 'package:marquee/marquee.dart';

/// Spark Bar Example
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import '../../../Model/Chart_Bar_Model.dart';
import '../../../Utils/Ui/gray_line.dart';
import '../../../Utils/get_date.dart';
import '../Widgets/bar_chart_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //현재 시간
  var current_datetime;

  @override
  void initState() {
    current_datetime = fillter(DateTime.now().toString());
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(size.height * 0.1),
          child: AppBar(
            backgroundColor: kBackgroundColor,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/main_text.png',
                  fit: BoxFit.contain,
                  height: size.height * 0.068,
                ),
              ],
            ),
            elevation: 0,
          ),
        ),
        backgroundColor: kBackgroundColor,
        body: SingleChildScrollView(
            child: Column(
          children: [
            Gray_Line(size: size),
            SizedBox(
              height: size.height * 0.03,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: size.width * 0.9,
                height: size.height * 0.27,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 4,
                        blurRadius: 3,
                        offset: Offset(0, 1), // changes position of shadow
                      ),
                    ],
                    color: Colors.white70,
                    //kBackgroundColor.withAlpha(50),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              fillter(DateTime.now().toString());
                            },
                            child: Text(
                              "비나이더 안산점",
                              style: TextStyle(
                                  fontSize: 18, fontFamily: "boldfont"),
                            ),
                          ),
                        ),
                        Text(
                          "$current_datetime",
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    Center(
                      child: Text(
                        "14명",
                        style: TextStyle(fontSize: 50, fontFamily: "boldfont"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "평균보다 회원들이 없습니다",
                        style: TextStyle(fontSize: 18, fontFamily: "lightfont"),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  Center(
                    child: Container(
                      width: size.width * 0.9,
                      height: size.height * 0.3,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 4,
                              blurRadius: 3,
                              offset:
                                  Offset(0, 1), // changes position of shadow
                            ),
                          ],
                          color: Colors.white70,
                          //kBackgroundColor.withAlpha(50),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "평균 시간별 분표도",
                              style: TextStyle(
                                  fontFamily: "boldfont", fontSize: 21),
                            ),
                          ),
                          Center(
                            child: Container(
                              height: size.height * 0.2,
                              child: charts.BarChart(
                                Bar_Chart_Data_Widget.time_data(),
                                animate: true,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  Center(
                    child: Container(
                      width: size.width * 0.9,
                      height: size.height * 0.3,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 4,
                              blurRadius: 3,
                              offset:
                                  Offset(0, 1), // changes position of shadow
                            ),
                          ],
                          color: Colors.white70,
                          //kBackgroundColor.withAlpha(50),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "평균 요일 분포도",
                              style: TextStyle(
                                  fontFamily: "boldfont", fontSize: 21),
                            ),
                          ),
                          Center(
                            child: Container(
                              height: size.height * 0.2,
                              child: charts.BarChart(
                                Bar_Chart_Data_Widget.date_data(),
                                animate: true,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        )));
  }
}
