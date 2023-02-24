import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shopping_tool/Utils/constants.dart';
import 'package:shopping_tool/Utils/toast.dart';
import 'package:shopping_tool/View/menu/detail_views/introduce_view.dart';
import 'package:shopping_tool/View/menu/detail_views/question_view.dart';
import 'package:shopping_tool/View/menu/detail_views/useage_view.dart';
import 'package:shopping_tool/View/menu/popup/comumu_popup.dart';
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
                          child: Useage_View()));
                },
                child: Center(
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
                        color: kBoxColor,
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    child: Row(
                      children: [
                        Container(
                            margin: EdgeInsets.only(left: 20.w,top: 3.h),
                            child: Icon(Icons.help_outline,size: 30,color: kPrimaryColor,)),
                        Container(
                            margin: EdgeInsets.only(left: 20.w,top: 5.h),
                            child: Text("자주 묻는 질문",style: TextStyle(fontSize: 17,color: kPrimaryColor,fontWeight: FontWeight.bold),)),
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
                              child: Text("고객센터",style: TextStyle(fontSize: 17,color: kPrimaryColor,fontWeight: FontWeight.bold),)),
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
                        child: Icon(Icons.fitness_center,size: 30,color: kTextWhiteColor,),
                      ),
                      Text("헬스장을 운영중이면 \n오헬몇 서비스를 도입해보세요!",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,color: kTextWhiteColor),)
                    ],
                  ),
                ),
              ),
              // InkWell(
              //   onTap: (){
              //     showtoast("서비스 준비중입니다.");
              //   },
              //   child: Container(
              //       margin: EdgeInsets.only(top: 13),
              //       width: 330.w,
              //       height: 70.h,
              //       decoration: BoxDecoration(
              //           color: kPrimaryColor,
              //           borderRadius: BorderRadius.all(Radius.circular(10))
              //       ),
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Row(
              //             children: [
              //               Container(
              //                 margin: EdgeInsets.only(left: 15.h,right: 0.w,top: 23.h),
              //                 child: Icon(Icons.support_agent,size: 30,color: kTextWhiteColor,),
              //               ),
              //               Column(
              //                 children: [
              //                   Container(
              //                       margin: EdgeInsets.only(left: 10.w,top: 20.h),
              //                       child: Text("카카오톡으로 문의하기",style: TextStyle(fontSize: 17,color: kTextWhiteColor,fontWeight: FontWeight.bold),)),
              //                   Container(
              //                       margin: EdgeInsets.only(left: 20.w,top: 0.h),
              //                       child: Text("소중한 피드백을 보내주세요.",style: TextStyle(fontSize: 15,color: kTextWhiteColor,fontWeight: FontWeight.bold),)),
              //                 ],
              //               ),
              //
              //             ],
              //           ),
              //
              //
              //
              //         ],
              //       )
              //   ),
              // ),

              SizedBox(
                height: 120.h,
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
