

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_tool/Utils/constants.dart';

Widget GymPrice_Widget(String during,String price){

  return Container(
    width: 130.w,
    height: 50.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      color: kBoxColor
    ),
    child: Column(
      children: [
        Container(
          width: 130.w,
          height: 23.h,

          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: Center(child: Text("${during}",style: TextStyle(color: kTextWhiteColor,fontWeight: FontWeight.bold),)),
        ),
        Center(
          child:
          Container(
              margin: EdgeInsets.only(top: 5.h),
              child: Text("${price} 원",style: TextStyle(),)),
        )
      ],
    ),
  );
}