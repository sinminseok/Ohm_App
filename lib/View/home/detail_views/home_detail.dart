import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_tool/Controller/api/gymApi.dart';
import 'package:shopping_tool/Model/dto/gymDto.dart';
import 'package:shopping_tool/Model/dto/statisticsDto.dart';
import 'package:shopping_tool/Utils/constants.dart';
import 'package:animate_icons/animate_icons.dart';
import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:shopping_tool/View/home/widgets/chart_bottom.dart';

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
    var data = [
      widget.time_avg.one,
      widget.time_avg.two,
      widget.time_avg.three,
      widget.time_avg.four,
      widget.time_avg.five,
      widget.time_avg.six,
      widget.time_avg.seven,
      widget.time_avg.eight,
      widget.time_avg.nine,
      widget.time_avg.ten,
      widget.time_avg.eleven,
      widget.time_avg.twelve,
      widget.time_avg.thirteen,
      widget.time_avg.fourteen,
      widget.time_avg.fifteen,
      widget.time_avg.sixteen,
      widget.time_avg.seventeen,
      widget.time_avg.eighteen,
      widget.time_avg.nineteen,
      widget.time_avg.twenty,
      widget.time_avg.twenty_one,
      widget.time_avg.twenty_two,
      widget.time_avg.twenty_three,
      widget.time_avg.twenty_four
    ];
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 360.w,
                height: 200.h,
                margin: EdgeInsets.only(top: 0.h),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.17),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: Offset(0, 2), // changes position of shadow
                    ),
                  ],
                  color: kBottomColor,
                  borderRadius: BorderRadius.all(Radius.circular(0)),
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
                                margin: EdgeInsets.only(left: 20.w, top: 40.h),
                                child: Text(
                                  "${widget.gymDto?.name}",
                                  style: TextStyle(
                                      color: kTextWhiteColor,
                                      fontSize: 17.sp,
                                      fontFamily: "boldfont"),
                                ),
                              ),
                              InkWell(
                                child: Container(
                                  margin: EdgeInsets.only(left: 5.w, top: 40.h),
                                  child: AnimateIcons(
                                    startIcon: Icons.refresh,
                                    endIcon: Icons.refresh,

                                    controller: controller,

                                    startTooltip: 'Icons.refresh',
                                    // add this tooltip for the end icon
                                    endTooltip: 'Icons.add_circle_outline',
                                    size: 30.0,
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
                          margin: EdgeInsets.only(left: 83.w),
                          child: Text(
                            "현재 약",
                            style: TextStyle(
                                color: kTextWhiteColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 17.sp,
                                fontFamily: "lightfont"),
                          ),
                        ),
                        widget.current_count!.length == 1
                            ? Container(
                                margin:
                                    EdgeInsets.only(left: 24.h, right: 37.w),
                                child: Text(
                                  "${widget.current_count}",
                                  style: TextStyle(
                                      fontSize: 50,
                                      fontFamily: "boldfont",
                                      color: kTextWhiteColor),
                                ),
                              )
                            : Container(
                                margin: EdgeInsets.only(left: 13.h, right: 26),
                                child: Text(
                                  "${widget.current_count}",
                                  style: TextStyle(
                                      fontSize: 50,
                                      fontFamily: "boldfont",
                                      color: kTextWhiteColor),
                                ),
                              ),
                        Container(
                            margin:
                                EdgeInsets.only(top: 0.h, left: 0.w, right: 20),
                            child: Text(
                              "명",
                              style: TextStyle(
                                  fontFamily: "boldfont",
                                  color: kTextWhiteColor,
                                  fontSize: 23),
                            ))
                      ],
                    ),
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 15.h,left: 15.w,),
                child: Text("시간별 평균 인원",style: TextStyle(fontSize: 16.sp,fontFamily: "lightfont",fontWeight: FontWeight.bold),),
              ),
              Container(
                width: 360.w,
                margin: EdgeInsets.only(left: 10.w,right: 10.w,top: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: Colors.grey,width: 0.5)
                ),
                child: Row(

                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 5.w,bottom: 7.h),


                      width: 45.w,
                      height: 160.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${data.reduce(max)}"),
                          Text("${(data.reduce(max)+data.reduce(min))/2}"),
                          Text("${data.reduce(min)}"),
                        ],
                      ),
                    ),
                    Container(
                      width: 265.w,
                      margin: EdgeInsets.only(left: 10.w,right: 0.w,bottom: 20.h),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child:    Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 10.w,right: 10.w,bottom: 20.h),
                                  child: Sparkline(
                                    enableGridLines: true,


                                    max: data.reduce(max)+2,


                                    // pointsMode: PointsMode.all,
                                    lineColor: kPrimaryColor,
                                    pointSize: 8.0,
                                    fallbackHeight: 200.h,
                                    pointColor: kPrimaryColor,
                                    lineWidth: 4.0,
                                    fallbackWidth : 700.w,
                                    sharpCorners:true,


                                    data: data,
                                  ),
                                ),
                                Positioned(
                                    left: 686.w,
                                    child: Container(width: 40.w,height: 300.h,color: kBackgroundColor,))
                              ],
                            ),
                            Chart_Bottom()
                          ],
                        )
                      ),
                    ),
                  ],
                ),
              ),
              // Container(
              //     width: 360.w,
              //     height: 350.h,
              //     margin: EdgeInsets.only(left: 10.w, right: 10.w, top: 15.h),
              //     child: Dashboard(time_avg: widget.time_avg)),

              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 15.h, bottom: 30.h),
                  width: 340.w,
                  height: 100.h,
                  decoration: BoxDecoration(
                      color: kBoxColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.9),
                          blurRadius: 3.0,
                          spreadRadius: 0.0,
                          offset: const Offset(0,2),
                        )
                      ],
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
              ),
            ],
          ),
        ));
  }
}
