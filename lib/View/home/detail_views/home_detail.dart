import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_tool/Controller/api/gymApi.dart';
import 'package:shopping_tool/Model/dto/gymDto.dart';
import 'package:shopping_tool/Model/dto/statisticsDto.dart';
import 'package:shopping_tool/Utils/constants.dart';
import 'package:shopping_tool/View/home/detail_views/chart_view.dart';
import 'package:animate_icons/animate_icons.dart';

class Home_Detail extends StatefulWidget {
  GymDto? gymDto;
  String curent_date;
  String? current_count;
  String? count_string;
  StatisticsDto time_avg;

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

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kBottomColor,
      body: SingleChildScrollView(
        child: Column(

          children: [
            Container(

              width: 340.w,
              height: 160.h,
              margin: EdgeInsets.only(top: 70.h),
              decoration: BoxDecoration(
                color: kBoxColor,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 340.w,
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 20.w,top: 10.h),
                              child: Text(
                                "${widget.gymDto?.name}",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 19.sp,
                                    fontFamily: "boldfont"),
                              ),
                            ),
                            InkWell(
                              child: Container(
                                margin: EdgeInsets.only(left: 5.w,top: 10.h
                                ),
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
                    height: 10.h,
                  ),
                  Row(

                    children: [
                      Container(

                        margin: EdgeInsets.only(left: 80.w),
                        child: Text(
                          "현재 약",
                          style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 17.sp,fontFamily: "lightfont"),
                        ),
                      ),
                      widget.current_count!.length == 1?
                      Container(
                        margin: EdgeInsets.only(left: 24.h,right: 37.w),
                        child: Text(
                          "${widget.current_count}",
                          style: TextStyle(
                              fontSize: 50,
                              fontFamily: "boldfont",
                              color: kPrimaryColor),
                        ),
                      )
                          :Container(
                        margin: EdgeInsets.only(left: 13.h,right: 26),
                        child: Text(
                          "${widget.current_count}",
                          style: TextStyle(
                              fontSize: 50,
                              fontFamily: "boldfont",
                              color: kPrimaryColor),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 0.h, left: 0.w,right: 20),
                          child: Text(
                            "명",
                            style:
                            TextStyle(fontFamily: "boldfont",color: kTextBlackColor, fontSize: 23),
                          ))
                    ],
                  ),
                ],
              ),
            ),
            Container(
                width: 360.w,
                height: 330.h,
                margin: EdgeInsets.only(left: 10.w,right: 10.w,top: 25.h),
                child: Dashboard(time_avg: widget.time_avg)),
            Container(
              margin: EdgeInsets.only(top: 30.h),
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
          ],
        ),
      )
    );
  }
}
