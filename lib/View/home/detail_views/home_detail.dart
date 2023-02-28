import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_tool/Controller/api/gymApi.dart';
import 'package:shopping_tool/Model/dto/countDto.dart';
import 'package:shopping_tool/Model/dto/gymDto.dart';
import 'package:shopping_tool/Utils/constants.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:shopping_tool/Utils/toast.dart';
import 'package:shopping_tool/View/home/widgets/time_chart.dart';
import '../../../Utils/get_date.dart';
import '../Widgets/bar_chart_widget.dart';
import 'package:animate_icons/animate_icons.dart';
import 'package:fl_chart/fl_chart.dart';

class Home_Detail extends StatefulWidget {
  GymDto? gymDto;
  String curent_date;
  String? current_count;
  String? count_string;
  List<double> time_avg;

  Home_Detail(
      {required this.time_avg,
      required this.gymDto,
      required this.count_string,
      required this.curent_date,
      required this.current_count});

  @override
  _Home_DetailState createState() => _Home_DetailState();
}

class _Home_DetailState extends State<Home_Detail> {
  AnimateIconController controller = AnimateIconController();
  var current_count;
  String? countDto;

  refresh() async {
    final prefs = await SharedPreferences.getInstance();
    var gymId = prefs.getInt("gymId");
    String? r = await GymApi().current_count(gymId.toString(), context);
    setState(() {
      widget.current_count = r!.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    double max_value(List<double> data) {
      var v = [...data];
      v.sort();
      double max = v.last;
      return max;
    }

    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: 360.w,
            height: 200.h,
            decoration: BoxDecoration(
              color: kBottomColor,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(0.0),
                  bottomLeft: Radius.circular(0.0)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 340.w,
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10.w),
                            child: Text(
                              "${widget.gymDto?.name}",
                              style: TextStyle(
                                  color: kTextWhiteColor,
                                  fontSize: 19.sp,
                                  fontFamily: "boldfont"),
                            ),
                          ),
                          InkWell(
                            child: Container(
                              margin: EdgeInsets.only(left: 0.w),
                              child: AnimateIcons(
                                startIcon: Icons.refresh,
                                endIcon: Icons.refresh,

                                controller: controller,

                                startTooltip: 'Icons.refresh',
                                // add this tooltip for the end icon
                                endTooltip: 'Icons.add_circle_outline',
                                size: 35.0,
                                onStartIconPress: () {
                                  refresh();
                                  return true;
                                },
                                onEndIconPress: () {
                                  refresh();
                                  return true;
                                },

                                duration: Duration(milliseconds: 500),
                                startIconColor: kPrimaryColor,
                                endIconColor: kPrimaryColor,
                                clockwise: false,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(

                  children: [
                    Container(

                      margin: EdgeInsets.only(left: 80.w),
                      child: Text(
                        "현재 약",
                        style: TextStyle(color: kTextWhiteColor, fontSize: 17.sp,fontFamily: "lightfont"),
                      ),
                    ),
                    widget.current_count!.length == 1?
                    Container(
                      margin: EdgeInsets.only(left: 26.h,right: 37.w),
                      child: Text(
                        "${widget.current_count}",
                        style: TextStyle(
                            fontSize: 50,
                            fontFamily: "boldfont",
                            color: kTextWhiteColor),
                      ),
                    )
                        :Container(
                      margin: EdgeInsets.only(left: 17.h,right: 26),
                      child: Text(
                        "${widget.current_count}",
                        style: TextStyle(
                            fontSize: 50,
                            fontFamily: "boldfont",
                            color: kTextWhiteColor),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 0.h, left: 0.w,right: 20),
                        child: Text(
                          "명",
                          style:
                              TextStyle(fontFamily: "boldfont",color: kTextWhiteColor, fontSize: 23),
                        ))
                  ],
                ),
                // Center(
                //   child: Container(
                //     margin: EdgeInsets.only(top: 24.h),
                //     child: Text(
                //       "${widget.curent_date}",
                //       style: TextStyle(fontSize: 15.sp, color: kTextWhiteColor),
                //     ),
                //   ),
                // )
                // InkWell(
                //   onTap: () {
                //     showAlertDialog(context, "알림",
                //         "초기 등록된 헬스장은 데이터 수집중에 있어 중앙에 표시된 인원수는 정확하지만, 원활,혼잡 판단이 완전하지 않을 수 있습니다. \n\n불편 드려 죄송합니다.");
                //   },
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       Container(
                //           margin: EdgeInsets.only(top: 20.h, right: 10),
                //           child: Icon(
                //             Icons.error,
                //             color: kPrimaryColor,
                //           )),
                //       Container(
                //         margin: EdgeInsets.only(top: 20.h),
                //         child: Text(
                //           "${widget.count_string}",
                //           style: TextStyle(
                //               fontSize: 18,
                //               fontFamily: "lightfont",
                //               color: kTextWhiteColor),
                //         ),
                //       ),
                //     ],
                //   ),
                // )
              ],
            ),
          ),
          Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10.h),
                child: Stack(
                  children: [
                    Center(
                      child: Container(
                        width: 350.w,
                        height: 400.h,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            //kBackgroundColor.withAlpha(50),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                child: LineChartSample1(
                              time_data: widget.time_avg,
                              max_value: max_value(widget.time_avg),
                            ))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 250.h,
                left: 10.w,
                child: Container(
                  width: 340.w,
                  height: 100.h,
                  decoration: BoxDecoration(
                      color: kBoxColor,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 30, top: 25.h),
                            child: Text(
                              "헬스장 현재 인원을 알려주는 ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: kPrimaryColor,
                                  fontSize: 17.sp,
                                  fontFamily: "lightfont"),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 30, top: 3.h),
                            child: Text(
                              "오헬몇!",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: kPrimaryColor,
                                  fontSize: 24,
                                  fontFamily: "boldfont"),
                            ),
                          )
                        ],
                      ),
                      Container(
                        margin:
                            EdgeInsets.only(left: 20, right: 10, bottom: 10.h),
                        child: Icon(
                          Icons.emergency_share,
                          size: 45,
                          color: kPrimaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
