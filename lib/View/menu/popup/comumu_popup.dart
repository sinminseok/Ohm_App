import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_tool/Utils/Ui/button_widget.dart';

import '../../../Utils/constants.dart';

class Comumu_Popup {
  void showDialog(BuildContext context) {
    showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel:
        MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierColor: Colors.black45,
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (BuildContext buildContext, Animation animation,
            Animation secondaryAnimation) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              contentPadding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              content: DefaultTextStyle(
                style: TextStyle(fontSize: 16, color: Colors.black),
                child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 15.h,bottom: 20.h),
                          child: Text("오헬몇 제휴 문의",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,fontFamily: "boldfont"),),
                        ),
                        InkWell(
                          onTap: (){

                          },
                          child: Container(
                            margin: EdgeInsets.only(top: 10.h,left: 20.w,right: 20.w,bottom: 20.h),
                            child:Text("문의 전화번호 : 010-8313-1764 \n\n전화 혹은 문자를 남겨주시면 빠르게 상담후 입점을 도와드립니다\n감사합니다."),
                          ),
                        ),


                        InkWell(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Container(
                                margin: EdgeInsets.only(left: 20.w,right: 20.w,bottom: 20.h),
                                child: Button("닫기")))
                      ],
                    )
                ),
              ),
            );
          });
        });
  }
}