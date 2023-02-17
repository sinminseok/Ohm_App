import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shopping_tool/Utils/constants.dart';
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
                "",
                style: TextStyle(
                  fontSize: 21,
                  color: kTextColor,
                ),
              ),
              InkWell(
                  onTap: () {
                    setState(() {

                    });
                  },
                  child: Icon(Icons.notifications,size: 30,))
            ],
          ),
        ),
        backgroundColor: kBackgroundColor,
        body: Column(

          children: [


            Center(
              child: Container(
                  margin: EdgeInsets.only(top: 10),
                  width: 330.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                      color: kBoxColor,
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: Row(
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 20.w,top: 3.h),
                          child: Icon(Icons.auto_stories,size: 30,color: kPrimaryColor,)),
                      Container(
                          margin: EdgeInsets.only(left: 20.w,top: 5.h),
                          child: Text("이용 방법",style: TextStyle(fontSize: 17,color: kPrimaryColor,fontWeight: FontWeight.bold),)),
                    ],
                  )
              ),
            ),

            Container(
                margin: EdgeInsets.only(top: 10),
                width: 330.w,
                height: 50.h,
                decoration: BoxDecoration(
                    color: kBoxColor,
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: Row(
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: 20.w,top: 3.h),
                        child: Icon(Icons.alarm,size: 30,color: kPrimaryColor,)),
                    Container(
                        margin: EdgeInsets.only(left: 20.w,top: 5.h),
                        child: Text("오헬몇 이란?",style: TextStyle(fontSize: 17,color: kPrimaryColor,fontWeight: FontWeight.bold),)),
                  ],
                )
            ),

            Container(
              width: 330.w,
              height: 80.h,
              margin: EdgeInsets.only(top
                  : 30.h),
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 15.h,right: 15.w),
                    child: Icon(Icons.fitness_center,size: 30,color: kTextWhiteColor,),
                  ),
                  Text("헬스장을 운영중이면 \n오헬몇 서비스를 도입해보세요!",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,color: kTextWhiteColor),)
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 13),
                width: 330.w,
                height: 70.h,
                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 15.h,right: 0.w,top: 23.h),
                          child: Icon(Icons.support_agent,size: 30,color: kTextWhiteColor,),
                        ),
                        Column(
                          children: [
                            Container(
                                margin: EdgeInsets.only(left: 10.w,top: 20.h),
                                child: Text("카카오톡으로 문의하기",style: TextStyle(fontSize: 17,color: kTextWhiteColor,fontWeight: FontWeight.bold),)),
                            Container(
                                margin: EdgeInsets.only(left: 20.w,top: 0.h),
                                child: Text("소중한 피드백을 보내주세요.",style: TextStyle(fontSize: 15,color: kTextWhiteColor,fontWeight: FontWeight.bold),)),
                          ],
                        ),

                      ],
                    ),



                  ],
                )
            ),

            SizedBox(
              height: 130.h,
            ),
            Column(
              children: [
                SizedBox(
                  height: size.height * 0.06,
                ),

                Text(
                  "(주)코무무 | komumu",
                  style: TextStyle(color: Colors.black38),
                ),
                Text(
                  "@Copyright 신민석,김영솔",
                  style: TextStyle(color: Colors.black38),
                )
              ],
            ),
          ],
        ));
  }
}
