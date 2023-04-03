import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_tool/Controller/api/questionApi.dart';
import 'package:shopping_tool/Utils/sundry/constants.dart';
import 'package:shopping_tool/Utils/sundry/toast.dart';
import 'package:shopping_tool/View/message/popup/answer_popup.dart';
import 'package:shopping_tool/View/message/widget/answer_bottomSheet.dart';
import 'package:shopping_tool/View/message/widget/question_bottomsheet.dart';

import '../../Model/message/questionDto.dart';

class Message_View extends StatefulWidget {
  const Message_View({Key? key}) : super(key: key);

  @override
  State<Message_View> createState() => _Message_ViewState();
}

class _Message_ViewState extends State<Message_View> {
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();

  void _doSomething() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getInt("gymId") == null) {
      showtoast("다니는 헬스장을 먼저 등록해보세요!");
    } else {
      var s = await QuestionApi()
          .save_question(_contentController.text, prefs.getInt("gymId"));
      showtoast("질문 등록이 완료되었습니다!\n답변을 받으면 게시판에 올라옵니다");
      setState(() {
        myfuture = get_questions();
      });
      Navigator.pop(context);
    }
  }

  final spinkit = SpinKitWanderingCubes(
    itemBuilder: (BuildContext context, int index) {
      return DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          color: index.isEven ? kPrimaryColor : kBoxColor,
        ),
      );
    },
  );
  List<QuestionDto> not_answers = [];
  List<QuestionDto> ok_answers = [];
  Future? myfuture;
  bool state = false;
  List<String> dropdownList = ['답변전', '답변후'];
  String selectedDropdown = '답변전';
  List<QuestionDto> questions = [];
  bool check_gym = false;
  TextEditingController _contentController = TextEditingController();
  int? gymId;
  get_questions() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      gymId = prefs.getInt("gymId");
    });
    setState(() {
      not_answers = [];
      ok_answers = [];
    });



    if (gymId == null) {
      return null;
    } else {
      setState(() {
        check_gym = true;
      });
      questions = await QuestionApi().findall_question(gymId!.toString());

      for (int i = 0; i < questions.length; i++) {
        //아직 답변이 안된 줄민
        if (questions[i].answerDto != null) {
          ok_answers.add(questions[i]);
        } else {
          not_answers.add(questions[i]);
        }
      }

      for (int i = 0; i < ok_answers.length; i++) {}
      return questions;
    }
  }

  @override
  void initState() {
    // TODO: implement initState

    myfuture = get_questions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void showDialog(
        BuildContext context, TextEditingController _contentController) {
      showGeneralDialog(
          context: context,
          barrierDismissible: true,
          barrierLabel:
          MaterialLocalizations.of(context).modalBarrierDismissLabel,
          barrierColor: Colors.black45,
          transitionDuration: const Duration(milliseconds: 200),
          pageBuilder: (BuildContext buildContext, Animation animation,
              Animation secondaryAnimation) {
            return StatefulBuilder(builder: (context, s) {
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
                                  margin: EdgeInsets.only(left: 15.w, top: 20.h),
                                  child: Text(
                                    "문의내용 작성",
                                    style: TextStyle(
                                        fontSize: 17,
                                        color: kTextBlackColor,
                                        fontFamily: "boldfont"),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(right: 15.w, top: 5.h),
                                    child: Icon(
                                      Icons.cancel,
                                      color: Colors.grey,
                                      size: 28,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                                margin: EdgeInsets.only(
                                    top: 20.h, left: 10.w, right: 10.w),
                                width: 310.w,
                                height: 250.h,
                                decoration: BoxDecoration(
                                    color: kContainerColor,
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                                child: TextFormField(
                                  onTap: () {
                                    setState(() {});
                                  },
                                  controller: _contentController,
                                  cursorColor: kPrimaryColor,
                                  decoration: InputDecoration(
                                    hintText: "질문",
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.all(10.0),
                                  ),
                                )),
                            SizedBox(height: 20.h,),
                            InkWell(
                                onTap: () async {


                                },

                                borderRadius: BorderRadius.circular(5),
                                child: RoundedLoadingButton(
                                  width: 260.w,
                                  height: 40.h,
                                  controller: _btnController,
                                  successColor: kTextBlackColor,
                                  color: kTextBlackColor,
                                  onPressed: _doSomething,
                                  child: Container(
                                    width: 260.w,
                                    height: 40.h,
                                    margin: EdgeInsets.only(left: 0.w),

                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: kTextBlackColor,
                                    ),


                                    alignment: Alignment.center,
                                    child: Text(
                                      "다음",
                                      style: TextStyle(
                                          fontFamily: "lightfont",
                                          color: kTextWhiteColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.sp
                                      ),
                                    ),
                                  ),
                                )
                            ),
                            SizedBox(height: 20.h,),



                          ],
                        ),
                      )),
                ),
              );
            });
          });
    }

    void showDialogAnswer(
        BuildContext context, QuestionDto questionDto_answer) {
      showGeneralDialog(
          context: context,
          barrierDismissible: true,
          barrierLabel:
          MaterialLocalizations.of(context).modalBarrierDismissLabel,
          barrierColor: Colors.black45,
          transitionDuration: const Duration(milliseconds: 200),
          pageBuilder: (BuildContext buildContext, Animation animation,
              Animation secondaryAnimation) {
            return StatefulBuilder(builder: (context, s) {
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
                                  margin: EdgeInsets.only(left: 15.w, top: 20.h),
                                  child: Text(
                                    "${questionDto_answer.content}",
                                    style: TextStyle(
                                        fontSize: 17.sp,
                                        color: kTextBlackColor,
                                        fontFamily: "boldfont"),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(right: 15.w, top: 5.h),
                                    child: Icon(
                                      Icons.cancel,
                                      color: Colors.grey,
                                      size: 28,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                                margin: EdgeInsets.only(
                                    top: 20.h, left: 10.w, right: 10.w),
                                width: 310.w,

                                decoration: BoxDecoration(
                                    color: kContainerColor,
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                                child: Container(
                                    margin: EdgeInsets.only(top: 20.h,left: 10.w,right: 10.w,bottom: 20.h),
                                    child: Text("${questionDto_answer.answerDto!.content}",style: TextStyle(fontSize: 17.sp,fontFamily: "lightfont"),))),
                            SizedBox(height: 20.h,),

                            SizedBox(height: 20.h,),



                          ],
                        ),
                      )),
                ),
              );
            });
          });
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.h),
        child: AppBar(
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
                "마음의 소리",
                style: TextStyle(
                    fontSize: 21,
                    color: kTextColor,
                    fontFamily: "lightfont2",
                    fontWeight: FontWeight.bold
                ),
              ),
              InkWell(
                  onTap: () async {
                    print(gymId);
                    if(gymId == null){
                      showtoast("헬스장을 먼저 등록해주세요!");
                    }else{
                      showDialog(context, _contentController);
                    }


                  },
                  child: Icon(
                    Icons.add,
                    size: 28,
                  )),
            ],
          ),
        ),
      ),
      backgroundColor: kBackgroundColor,
      body: gymId == null?Container(
        child: Center(
          child: Text("헬스장을 먼저 등록해주세요!",style: TextStyle(fontSize: 18.sp,fontFamily: "lightfont"),),
        ),
      ):SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder(
                future: myfuture,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData == false) {
                    return Container(
                      margin: EdgeInsets.only(top: 300.h),
                      child: spinkit,
                    );
                  }

                  //error가 발생하게 될 경우 반환하게 되는 부분
                  else if (snapshot.hasError) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Error: ${snapshot.error}', // 에러명을 텍스트에 뿌려줌
                        style: TextStyle(fontSize: 15),
                      ),
                    );
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 15.w, top: 10),
                          width: 100.w,
                          decoration: BoxDecoration(
                              color: kBoxColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Container(
                            margin: EdgeInsets.only(left: 12.w),
                            child: DropdownButton(
                              underline: SizedBox.shrink(),
                              value: selectedDropdown,
                              items: dropdownList.map((String item) {
                                return DropdownMenuItem<String>(
                                  child: Text(
                                    '$item',
                                    style: TextStyle(
                                        fontFamily: "lightfont",
                                        fontSize: 15.sp,
                                        color: kPrimaryColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  value: item,
                                );
                              }).toList(),
                              onChanged: (dynamic value) {
                                setState(() {
                                  selectedDropdown = value;
                                });
                              },
                            ),
                          ),
                        ),
                         selectedDropdown == "답변전"
                                ? not_answers.length == 0
                                    ? Container(
                                        margin: EdgeInsets.only(top: 170.h),
                                        child: Center(
                                            child: Text("답변 대기중인 문의사항이 없습니다.",
                                                style: TextStyle(
                                                    fontFamily: "lightfont",
                                                    fontSize: 17.sp))),
                                      )
                                    : Container(
                                        margin: EdgeInsets.only(
                                            left: 15.w,
                                            bottom: 20.h,
                                            top: 10.h,
                                            right: 15.w),
                                        width: 360.w,
                                        height: 670.h,
                                        child: Align(
                                          alignment: Alignment.topCenter,
                                          child: ListView.builder(
                                              reverse: true,
                                              shrinkWrap: true,
                                              itemCount: not_answers.length,
                                              itemBuilder:
                                                  (BuildContext ctx, int idx) {
                                                return Stack(
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          bottom: 10.h),
                                                      width: 340.w,
                                                      height: 60.h,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(color: Colors.grey,width: 0.3),
                                                          color: kContainerColor,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          10))),
                                                      child: InkWell(
                                                        onTap: () async {
                                                          showtoast(
                                                              "아직 답변이 등록되지 않았습니다");
                                                        },
                                                        child: Container(
                                                            width: 320.w,
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: 10.w,
                                                                    right: 10),
                                                            child: Center(
                                                                child: Text(
                                                              "${not_answers[idx].content}",
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: TextStyle(
                                                                  color:
                                                                  kTextBlackColor,
                                                                  fontSize: 16),
                                                            ))),
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Container(),
                                                      ],
                                                    )
                                                  ],
                                                );
                                              }),
                                        ))
                                : ok_answers.length == 0
                                    ? Container(
                                        margin: EdgeInsets.only(top: 170.h),
                                        child: Center(
                                            child: Text(
                                                "답변이 완료된 문의사항이 아직 없습니다.",
                                                style: TextStyle(
                                                    fontFamily: "lightfont",
                                                    fontSize: 17.sp))),
                                      )
                                    : Container(
                                        margin: EdgeInsets.only(
                                            left: 15.w,
                                            bottom: 20.h,
                                            top: 10.h,
                                            right: 15.w),
                                        width: 360.w,
                                        height: 600.h,
                                        child: Align(
                                          alignment: Alignment.topCenter,
                                          child: ListView.builder(
                                              shrinkWrap: true,
                                              reverse: true,
                                              itemCount: ok_answers.length,
                                              itemBuilder:
                                                  (BuildContext ctx, int idx) {
                                                return Stack(
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          bottom: 10.h),
                                                      width: 340.w,
                                                      height: 60.h,
                                                      decoration: BoxDecoration(
                                                        color: kContainerColor,
                                                          border: Border.all(color: Colors.grey,width: 0.3),
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          10))),
                                                      child: InkWell(
                                                        onTap: () async {
                                                          showDialogAnswer(context, ok_answers[idx]);

                                                          setState(() {
                                                            selectedDropdown;
                                                          });
                                                        },
                                                        child: Container(
                                                            width: 320.w,
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: 10.w,
                                                                    right: 10),
                                                            child: Center(
                                                                child: Text(
                                                              "${ok_answers[idx].content}",
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: TextStyle(
                                                                  color:
                                                                      kTextBlackColor,
                                                                  fontSize: 17),
                                                            ))),
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              }),
                                        )),

                      ],
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }
}
