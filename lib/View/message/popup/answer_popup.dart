import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Controller/api/questionApi.dart';
import '../../../Utils/constants.dart';
import '../../../Utils/toast.dart';

class Question_Popup {
  void showDialog( BuildContext context,TextEditingController _contentController,Future<dynamic> myfu) {
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
                  borderRadius: BorderRadius.circular(10)),
              content: DefaultTextStyle(
                style: TextStyle(fontSize: 16, color: Colors.black),
                child: SingleChildScrollView(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: kBackgroundColor,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 180.w,
                                margin: EdgeInsets.only(left: 15.w,top: 20.h),
                                child: Text("문의내용 작성",style: TextStyle(fontSize: 17,color: kTextBlackColor,fontFamily: "boldfont"),),
                              ),

                              InkWell(
                                onTap: (){

                                 Navigator.pop(context);
                                },
                                child: Container(
                                  margin: EdgeInsets.only(right: 15.w,top: 5.h),
                                  child: Icon(Icons.cancel,color: Colors.grey,size: 28,),
                                ),
                              ),
                            ],
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 20.h,left: 10.w,right: 10.w),
                              width: 310.w,
                              height: 250.h,
                              decoration: BoxDecoration(
                                  color: kContainerColor,
                                  borderRadius: BorderRadius.all(Radius.circular(10))),
                              child: TextFormField(
                                onTap: (){
                                  setState(() {

                                  });
                                },

                                controller: _contentController,
                                cursorColor: kPrimaryColor,
                                decoration: InputDecoration(
                                  hintText: "질문",
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.all(10.0),
                                ),
                              )),
                          Container(
                            margin: EdgeInsets.only(top: 25.h,bottom: 25.h),
                            width: 260.w,
                            height: 40.h,
                            decoration: BoxDecoration(
                                color: kTextBlackColor,
                                borderRadius: BorderRadius.all(Radius.circular(10))),
                            child: InkWell(
                              onTap: ()async{
                                final prefs = await SharedPreferences.getInstance();
                                if(prefs.getInt("gymId") == null){
                                  showtoast("다니는 헬스장을 먼저 등록해보세요!");
                                }else{
                                  var s = await QuestionApi().save_question( _contentController.text,prefs.getInt("gymId"));
                                  showtoast("질문 등록이 완료되었습니다!\n답변을 받으면 게시판에 올라옵니다");
                                  Navigator.pop(context);
                                }

                              },
                              child: Center(
                                child: Text(
                                  "전송",
                                  style: TextStyle(
                                      fontFamily: "boldfont",
                                      fontWeight: FontWeight.bold,
                                      color: kTextWhiteColor,
                                      fontSize: 17),
                                ),
                              ),
                            ),
                          ),


                          // InkWell(
                          //     onTap: (){
                          //       Navigator.pop(context);
                          //
                          //     },
                          //     child: Center(
                          //       child: Container(
                          //           margin: EdgeInsets.only(bottom: 20.h),
                          //           width: 150.w,
                          //           height: 30.h,
                          //           decoration: BoxDecoration(
                          //               color: kButtonColor,
                          //               borderRadius: BorderRadius.all(Radius.circular(20))
                          //           ),
                          //
                          //           child: Center(child: Text("완료",style: TextStyle(color: kTextWhiteColor),))),
                          //     ))
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