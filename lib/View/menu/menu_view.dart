import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shopping_tool/Utils/constants.dart';
import 'package:shopping_tool/Utils/toast.dart';
import 'package:shopping_tool/View/menu/detail_views/introduce_view.dart';
import 'package:shopping_tool/View/menu/detail_views/question_view.dart';
import 'package:shopping_tool/View/menu/detail_views/useage_view.dart';
import 'package:shopping_tool/View/menu/popup/comumu_popup.dart';

import '../gymsearch/search_view.dart';




class Menu_View extends StatefulWidget {
  const Menu_View({Key? key}) : super(key: key);

  @override
  _Menu_View createState() => _Menu_View();
}

class _Menu_View extends State<Menu_View> {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: kTextColor, //change your color here
          ),
          automaticallyImplyLeading: false,
          backgroundColor: kBackgroundColor,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "메뉴",
                style: TextStyle(
                  fontSize: 21,
                  color: kTextColor,
                  fontFamily: "boldfont",
                  fontWeight: FontWeight.bold
                ),
              ),
              InkWell(
                  onTap: () {
                    showtoast("기능 개발중입니다 ㅜ");
                  },
                  child: Icon(Icons.notifications,size: 30,))
            ],
          ),
        ),
        backgroundColor: kBackgroundColor,
        body: SingleChildScrollView(
          child: Column(

            children: [

              InkWell(
                onTap: (){
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.fade,
                          child: Search_View()));
                },
                child: Center(
                  child: Container(
                      margin: EdgeInsets.only(top: 10),
                      width: 330.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.9),
                              blurRadius: 3.0,
                              spreadRadius: 0.0,
                              offset: const Offset(0,2),
                            )
                          ],
                          color: kBoxColor,
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      child: Row(
                        children: [
                          Container(
                              margin: EdgeInsets.only(left: 20.w,top: 5.h),
                              child: Icon(Icons.fitness_center,size: 30,color: kPrimaryColor,)),
                          Container(
                              margin: EdgeInsets.only(left: 15.w,top: 5.h),
                              child: Text("헬스장 변경",style: TextStyle(fontFamily: "lightfont",fontSize: 17,color: kPrimaryColor,fontWeight: FontWeight.bold),)),
                        ],
                      )
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.fade,
                          child: Useage_View()));
                },
                child: Center(
                  child: Container(
                      margin: EdgeInsets.only(top: 10),
                      width: 330.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.9),
                              blurRadius: 3.0,
                              spreadRadius: 0.0,
                              offset: const Offset(0,2),
                            )
                          ],
                          color: kBoxColor,
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      child: Row(
                        children: [
                          Container(
                              margin: EdgeInsets.only(left: 20.w,top: 5.h),
                              child: Icon(Icons.auto_stories,size: 30,color: kPrimaryColor,)),
                          Container(
                              margin: EdgeInsets.only(left: 15.w,top: 5.h),
                              child: Text("이용 방법",style: TextStyle(fontFamily: "lightfont",fontSize: 17,color: kPrimaryColor,fontWeight: FontWeight.bold),)),
                        ],
                      )
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.fade,
                          child: Question_View()));
                },
                child: Container(
                    margin: EdgeInsets.only(top: 10),
                    width: 330.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.9),
                            blurRadius: 3.0,
                            spreadRadius: 0.0,
                            offset: const Offset(0,2),
                          )
                        ],
                        color: kBoxColor,
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    child: Row(
                      children: [
                        Container(
                            margin: EdgeInsets.only(left: 20.w,top: 5.h),
                            child: Icon(Icons.help_outline,size: 30,color: kPrimaryColor,)),
                        Container(
                            margin: EdgeInsets.only(left: 15.w,top: 5.h),
                            child: Text("자주 묻는 질문",style: TextStyle(fontFamily: "lightfont",fontSize: 17,color: kPrimaryColor,fontWeight: FontWeight.bold),)),
                      ],
                    )
                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.fade,
                          child: Introduce_View()));
                },
                child: Container(
                    margin: EdgeInsets.only(top: 10),
                    width: 330.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.9),
                            blurRadius: 3.0,
                            spreadRadius: 0.0,
                            offset: const Offset(0,2),
                          )
                        ],
                        color: kBoxColor,
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    child: InkWell(
                      onTap: ()async{
                        const number = '01083131764'; //set the number here
                        bool? res = await FlutterPhoneDirectCaller.callNumber(number);
                      },
                      child: Row(
                        children: [
                          Container(
                              margin: EdgeInsets.only(left: 20.w,top: 3.h),
                              child: Icon(Icons.support_agent,size: 30,color: kPrimaryColor,)),
                          Container(
                              margin: EdgeInsets.only(left: 20.w,top: 5.h),
                              child: Text("고객센터",style: TextStyle(fontFamily: "lightfont",fontSize: 17,color: kPrimaryColor,fontWeight: FontWeight.bold),)),
                        ],
                      ),
                    )
                ),
              ),

              Container(
                width: 330.w,
                height: 80.h,
                margin: EdgeInsets.only(top
                    : 30.h),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.9),
                        blurRadius: 3.0,
                        spreadRadius: 0.0,
                        offset: const Offset(0,2),
                      )
                    ],
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: InkWell(
                  onTap: (){
                    Comumu_Popup().showDialog(context);
                  },
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 15.h,right: 15.w),

                        child: Icon(Icons.fitness_center,size: 34,color: kTextWhiteColor,),
                      ),
                      Text("헬스장을 운영 중이신가요?",style: TextStyle(fontFamily: "lightfont2",fontWeight: FontWeight.bold,fontSize: 17.sp,color: kTextWhiteColor),)
                    ],
                  ),
                ),
              ),

              SizedBox(
                height: 60.h,
              ),
              Column(
                children: [
                  SizedBox(
                    height: size.height * 0.06,
                  ),

                  Text(
                    "(주)코무무 | comumu",
                    style: TextStyle(color: Colors.black38),
                  ),
                  Text(
                    "@Copyright 신민석(CEO),김영솔(CTO)",
                    style: TextStyle(color: Colors.black38),
                  ),
                  Text(""),
                  Text(
                    "오늘 헬스 몇시에가지? 오헬몇 version : 1.0.0",
                    style: TextStyle(color: Colors.black38),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
