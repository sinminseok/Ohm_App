

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:shopping_tool/Controller/api/questionApi.dart';

import '../../../Model/message/questionDto.dart';
import '../../../Utils/Ui/button_widget.dart';
import '../../../Utils/sundry/constants.dart';

class Answer_BottomSheet extends StatefulWidget {
  QuestionDto questionDto;

  // Future<dynamic>? fun;
  Answer_BottomSheet({required this.questionDto});

  @override
  State<Answer_BottomSheet> createState() => _Answer_BottomSheetState();
}

class _Answer_BottomSheetState extends State<Answer_BottomSheet> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _answerController = TextEditingController();
    return Container(

        color: kBackgroundColor,
        child: Column(
          children: [

            Container(
              width: 340.w,
              margin: EdgeInsets.only(top: 15.h),
              decoration: BoxDecoration(
                  color: kBoxColor,
                  borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: Container(
                margin: EdgeInsets.only(top: 10.h,bottom: 10.h,left: 10.w),
                child: Text("${widget.questionDto.content}",style: TextStyle(fontSize: 18),),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                  color: kContainerColor,
                  borderRadius: BorderRadius.circular(10)
              ),
              width: 340.w,

              child: Container(
                margin: EdgeInsets.only(left: 10.h,right: 10.h,top: 15.h,bottom: 15.h),
                child:Text("${widget.questionDto.answerDto!.content}"),
              )
            ),

          ],
        ));
  }
}