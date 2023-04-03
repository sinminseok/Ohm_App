import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Utils/sundry/constants.dart';

class Useage_View extends StatelessWidget {
  const Useage_View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.h),
        child: AppBar(
          iconTheme: IconThemeData(
            color: kIconColor, //change your color here
          ),
          title:   Container(
            margin: EdgeInsets.only(left: 0.w, bottom: 10.h, top: 13.h),
            child: Text(
              "이용가이드",
              style: TextStyle(
                  color: kTextBlackColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 21),
            ),
          ),
          backgroundColor: kBackgroundColor,
          shape: Border(bottom: BorderSide(color: Colors.grey, width: 0.3)),
          elevation: 0,
        ),
      ),
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
                margin: EdgeInsets.only(left: 10.w, top: 20.h),
                child: Text(
                  "1.메인화면",
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontFamily: "lightfont",
                      fontWeight: FontWeight.bold),
                )),
            Container(
                margin: EdgeInsets.only(left: 10.w, top: 20.h,bottom: 10.h),
                child: Text(
                  "어플 메인 화면입니다.등록한 헬스장이 없으면 '+헬스장 등록하기'버튼을 누르세요! ",
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: "lightfont",
                      fontWeight: FontWeight.bold),
                )),
            Center(
              child: Container(
                decoration: BoxDecoration(

                    borderRadius: BorderRadius.all(Radius.circular(20))),
                width: 340.w,
                height: 600.h,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: Image.asset(
                    "assets/images/guide/guide1.png",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(left: 10.w, top: 30.h),
                child: Text(
                  "2.검색화면",
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontFamily: "lightfont",
                      fontWeight: FontWeight.bold),
                )),
            Container(
                margin: EdgeInsets.only(left: 10.w, top: 20.h,bottom: 10.h),
                child: Text(
                  "이용중인 헬스장을 검색후 클릭하세요! 오헬몇과 제휴 헬스장이 아니면 검색되지 않습니다.",
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: "lightfont",
                      fontWeight: FontWeight.bold),
                )),
            Center(
              child: Container(
                decoration: BoxDecoration(

                    borderRadius: BorderRadius.all(Radius.circular(20))),
                width: 340.w,
                height: 600.h,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: Image.asset(
                    "assets/images/guide/guide2.png",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),

            Container(
                margin: EdgeInsets.only(left: 10.w, top: 20.h),
                child: Text(
                  "3.헬스장 등록",
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontFamily: "lightfont",
                      fontWeight: FontWeight.bold),
                )),
            Container(
                margin: EdgeInsets.only(left: 10.w, top: 20.h,bottom: 10.h),
                child: Text(
                  "내 헬스장 지정 버튼을 눌러 등록할 수 있습니다.",
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: "lightfont",
                      fontWeight: FontWeight.bold),
                )),
            Center(
              child: Container(
                decoration: BoxDecoration(

                    borderRadius: BorderRadius.all(Radius.circular(20))),
                width: 340.w,
                height: 600.h,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: Image.asset(
                    "assets/images/guide/guide3.png",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(left: 10.w, top: 20.h),
                child: Text(
                  "4.메인화면",
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontFamily: "lightfont",
                      fontWeight: FontWeight.bold),
                )),
            Container(
                margin: EdgeInsets.only(left: 10.w, top: 20.h,bottom: 10.h),
                child: Text(
                  "헬스장을 등록하면 현재 헬스장 인원,시간별 평균 그래프를 확인할 수 있습니다.",
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: "lightfont",
                      fontWeight: FontWeight.bold),
                )),
            Center(
              child: Container(
                decoration: BoxDecoration(

                    borderRadius: BorderRadius.all(Radius.circular(20))),
                width: 340.w,
                height: 600.h,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: Image.asset(
                    "assets/images/guide/guide9.png",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(left: 10.w, top: 20.h),
                child: Text(
                  "5.헬스장 게시판,직원",
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontFamily: "lightfont",
                      fontWeight: FontWeight.bold),
                )),
            Container(
                margin: EdgeInsets.only(left: 10.w, top: 20.h,bottom: 10.h),
                child: Text(
                  "헬스장 관리자가 등록한 게시글,헬스장 직원을 확인할 수 있습니다.",
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: "lightfont",
                      fontWeight: FontWeight.bold),
                )),
            Center(
              child: Container(
                decoration: BoxDecoration(

                    borderRadius: BorderRadius.all(Radius.circular(20))),
                width: 340.w,
                height: 600.h,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: Image.asset(
                    "assets/images/guide/guide4.png",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(left: 10.w, top: 20.h),
                child: Text(
                  "6.마음의소리",
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontFamily: "lightfont",
                      fontWeight: FontWeight.bold),
                )),
            Container(
                margin: EdgeInsets.only(left: 10.w, top: 20.h,bottom: 10.h,right: 10.w),
                child: Text(
                  "익명으로 헬스장 관리자에게 메시지를 보낼수 있습니다.평소 헬스장을 이용하면서 불편했던점이나 하고싶었던 질문을 보내보세요!\n(욕설,비난,성적희롱등은 법적 처벌 대상이 될 수 있습니다.)",
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: "lightfont",
                      fontWeight: FontWeight.bold),
                )),
            Center(
              child: Container(
                decoration: BoxDecoration(

                    borderRadius: BorderRadius.all(Radius.circular(20))),
                width: 340.w,
                height: 600.h,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: Image.asset(
                    "assets/images/guide/guide6.png",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
