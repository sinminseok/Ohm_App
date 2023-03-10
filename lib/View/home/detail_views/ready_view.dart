import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shopping_tool/View/home/popup/phone_popup.dart';

import '../../../Utils/constants.dart';
import '../../../Utils/get_date.dart';
import '../../gymsearch/detail_views/search_view2.dart';

class Ready_View extends StatefulWidget {
  String currentdate;

  Ready_View({required this.currentdate});

  @override
  _Ready_ViewState createState() => _Ready_ViewState();
}

class _Ready_ViewState extends State<Ready_View> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: 360.w,
            height: 250.h,
            decoration: BoxDecoration(
                color: kBottomColor,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(0),
                    bottomLeft: Radius.circular(0))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: 360.w,
                    height: 130.h,
                    decoration: BoxDecoration(
                      color: kBottomColor,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(0.0),
                          bottomLeft: Radius.circular(0.0)),
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              bottom: 10, top: 85.h, right: 15.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.priority_high,
                                color: kPrimaryColor,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () {
                                    fillter(DateTime.now().toString());
                                  },
                                  child: Text(
                                    "등록된 헬스장이 없습니다.",
                                    style: TextStyle(
                                        color: kTextWhiteColor,
                                        fontSize: 17.sp,
                                        fontFamily: "boldfont"),
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),

                      ],
                    )),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade, child: Search_View2()));
                  },
                  child: Center(
                    child: Container(
                        width: 250.w,
                        height: 60.h,
                        decoration: BoxDecoration(
                            color: kContainerColor,
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        margin: EdgeInsets.only(top: 20),
                        child: Row(
                          children: [
                            Container(
                                margin: EdgeInsets.only(left: 15.w, right: 20.w),
                                child: Icon(
                                  Icons.emergency_share,
                                  color: kPrimaryColor,
                                  size: 30,
                                )),
                            Center(

                                child: Container(
                                  margin: EdgeInsets.only(left: 14.w),
                                  child: Text(
                                    "헬스장 등록하기",
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        color: kPrimaryColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
                          ],
                        )),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 180.h,),

          Container(
              width: 330.w,
              height: 80.h,
              decoration: BoxDecoration(
                  color: kContainerColor,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              margin: EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 15.w, right: 20.w),
                      child: Icon(
                        Icons.info_outline,
                        color: kPrimaryColor,
                        size: 40,
                      )),
                  Center(
                      child: Text(
                    "이용방법",
                    style: TextStyle(
                        fontSize: 18,
                        color: kButtonColor,
                        fontWeight: FontWeight.bold),
                  )),
                ],
              )),
// PhoneNumber_Popup().showDialog(context);
          Container(
              width: 330.w,
              height: 80.h,
              decoration: BoxDecoration(
                  color: kBoxColor,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              margin: EdgeInsets.only(top: 10.h),
              child: InkWell(
                onTap: () {
                  PhoneNumber_Popup().showDialog(context);
                },
                child: Row(
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: 15.w, right: 20.w),
                        child: Icon(
                          Icons.fitness_center,
                          color: kPrimaryColor,
                          size: 34,
                        )),
                    Center(
                        child: Text(
                      "헬스장을 운영중이면 \n오헬몇 서비스를 도입해보세요!",
                      style: TextStyle(
                          fontFamily: "lightfont2",
                          fontSize: 18,
                          color: kPrimaryColor,
                          fontWeight: FontWeight.bold),
                    )),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
