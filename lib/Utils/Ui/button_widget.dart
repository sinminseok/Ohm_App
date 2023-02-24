import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_tool/Utils/constants.dart';

Widget Button(String title) {
  return Container(
    width: 300.w,
    height: 40.h,
    decoration: BoxDecoration(
      color: kButtonColor,
      borderRadius: BorderRadius.all(Radius.circular(20))
    ),
    child: Center(
      child: Text("$title",style: TextStyle(fontWeight: FontWeight.bold,color: kTextWhiteColor,fontSize: 19),),
    ),
  );
}
