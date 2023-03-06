import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Utils/constants.dart';

class Address_Popup {
  void showDialog( BuildContext context,String? address) {
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
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: kBoxColor,
                      ),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 15.w,right: 15.w),

                            height: 100.h,
                            width: 320.w,
                            child: Center(child: Text("${address}",style: TextStyle(color: kPrimaryColor,fontWeight: FontWeight.bold,fontFamily: 'lightfont'),))
                          ),
                          InkWell(
                              onTap: (){
                                Navigator.pop(context);

                              },
                              child: Center(
                                child: Container(
                                  margin: EdgeInsets.only(bottom: 20.h),
                                  width: 150.w,
                                    height: 30.h,
                                    decoration: BoxDecoration(
                                      color: kButtonColor,
                                      borderRadius: BorderRadius.all(Radius.circular(20))
                                    ),

                                    child: Center(child: Text("완료",style: TextStyle(color: kTextWhiteColor,fontFamily: "boldfont"),))),
                              ))
                        ],
                      ),
                    )
                ),
              ),
            );
          });
        });
  }
}