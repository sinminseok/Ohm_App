import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_tool/Controller/api/gymApi.dart';
import 'package:shopping_tool/Model/dto/gymDto.dart';
import 'package:shopping_tool/Utils/constants.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:shopping_tool/View/home/widgets/time_chart.dart';
import '../../../Utils/get_date.dart';
import '../Widgets/bar_chart_widget.dart';
import 'package:animate_icons/animate_icons.dart';
import 'package:fl_chart/fl_chart.dart';

class Home_Detail extends StatefulWidget {
  GymDto? gymDto;
  String curent_date;
  String? current_count;
  List<double> time_avg;

  Home_Detail(
      {required this.time_avg,
      required this.gymDto,
      required this.curent_date,
      required this.current_count});

  @override
  _Home_DetailState createState() => _Home_DetailState();
}

class _Home_DetailState extends State<Home_Detail> {
  AnimateIconController controller = AnimateIconController();
  var current_count;


  refresh() async {
    final prefs = await SharedPreferences.getInstance();
    var gymId = prefs.getInt("gymId");
    var r = await GymApi().current_count(gymId.toString());
    setState(() {
      widget.current_count = r;
    });
  }
  @override
  Widget build(BuildContext context) {

    double  max_value(List<double> data){
      var v = [...data];
      v.sort();
      double max = v.last ;
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
                            "${widget.gymDto?.name}",
                            style: TextStyle(
                                color: kTextWhiteColor,
                                fontSize: 21,
                                fontFamily: "boldfont"),
                          ),
                        ),
                      ),
                      Text(
                        "${widget.curent_date}",
                        style: TextStyle(fontSize: 12, color: kTextWhiteColor),
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Row(
                    children: [
                      InkWell(
                        child: Container(
                          margin: EdgeInsets.only(left: 60.w),
                          child: AnimateIcons(
                            startIcon: Icons.refresh,
                            endIcon: Icons.refresh,

                            controller: controller,

                            startTooltip: 'Icons.refresh',
                            // add this tooltip for the end icon
                            endTooltip: 'Icons.add_circle_outline',
                            size: 50.0,
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
                      Container(
                        margin: EdgeInsets.only(left: 30.h),
                        child: Text(
                          "${widget.current_count}",
                          style: TextStyle(
                              fontSize: 50,
                              fontFamily: "boldfont",
                              color: kTextWhiteColor),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20.h),
                    child: Text(
                      "평소보다 회원들이 없습니다",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: "lightfont",
                          color: kTextWhiteColor),
                    ),
                  ),
                ],
              ),
            ),

            Stack(children: [
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

                            Container(child: LineChartSample1(time_data: widget.time_avg, max_value: max_value(widget.time_avg),))
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
                           margin: EdgeInsets.only(left: 30,top: 25.h),
                           child: Text("헬스장 현재 인원을 알려주는 ",style: TextStyle(fontWeight: FontWeight.bold,color: kPrimaryColor,fontSize: 21),),
                         ),
                         Container(
                           margin: EdgeInsets.only(left: 30),
                           child: Text("오헬몇!",style: TextStyle(fontWeight: FontWeight.bold,color: kPrimaryColor,fontSize: 24),),
                         )
                       ],
                     ),
                      Container(
                        margin: EdgeInsets.only(left: 20,right: 10,bottom: 10.h
                        ),
                        child:
                        Icon(Icons.emergency_share,size: 45,color: kPrimaryColor,),
                      ),

                    ],
                  ),
                ),
              )
            ],),

          ],

      ),
    );
  }
}
