import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Utils/sundry/constants.dart';

class Question_View extends StatelessWidget {
  const Question_View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.h),
        child: AppBar(
          iconTheme: IconThemeData(
            color: kIconColor, //change your color here
          ),
          backgroundColor: kBackgroundColor,
          shape: Border(bottom: BorderSide(color: Colors.grey, width: 0.3)),
          elevation: 0,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 15.w,bottom: 10.h,top: 20.h),
              child: Text("오헬몇은 무슨 서비스인가요?",style: TextStyle(fontFamily: "lightfont2",color: kPrimaryColor,fontWeight: FontWeight.bold,fontSize: 21),),
            ),
            Center(
              child: Container(
                width: 340.w,

                decoration: BoxDecoration(
                    color: kBoxColor,
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: Container(
                    margin: EdgeInsets.all(20.h),
                    child: Text("오헬몇은 다니는 헬스장을 등록해 실시간으로 헬스장에 있는 인원수를 볼수있습니다!\n\n뿐만아니라 헬스장 최근 공지사항,운영시간,이용가격등을 확인하고 평소 헬스장을 이용하면서 불편했던 사항을 헬스장 담장자에게 익명으로 말할수 있습니다\n\n 오헬몇을 이용해 편한시간에 운동해보세요!",style: TextStyle(fontSize: 21),)),
              ),
            ),

            Container(
              margin: EdgeInsets.only(left: 15.w,bottom: 10.h,top: 20.h),
              child: Text("헬스장에 오헬몇 서비스를 도입하고싶어요!",style: TextStyle(fontFamily: "lightfont2",color: kPrimaryColor,fontWeight: FontWeight.bold,fontSize: 18.sp),),
            ),
            Center(
              child: Container(
                width: 340.w,
                margin: EdgeInsets.only(bottom: 20.h),

                decoration: BoxDecoration(
                    color: kBoxColor,
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: Container(
                    margin: EdgeInsets.all(20.h),
                    child: Text("제휴를 맺은 헬스장만이 오헬몇 서비스를 이용할 수 있습니다!\n\n010 -8313 -1764 문자나 전화를 남겨주시면 빠르게 입점을 도와드립니다!",style: TextStyle(fontSize: 21),)),
              ),
            ),

          ],
        ),
      ),
    );
  }
}