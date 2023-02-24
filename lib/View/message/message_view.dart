import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_tool/Controller/api/questionApi.dart';
import 'package:shopping_tool/Utils/constants.dart';
import 'package:shopping_tool/Utils/toast.dart';
import 'package:shopping_tool/View/message/popup/answer_popup.dart';
import 'package:shopping_tool/View/message/widget/answer_bottomSheet.dart';
import 'package:shopping_tool/View/message/widget/question_bottomsheet.dart';

import '../../Model/dto/questionDto.dart';

class Message_View extends StatefulWidget {
  const Message_View({Key? key}) : super(key: key);

  @override
  State<Message_View> createState() => _Message_ViewState();
}

class _Message_ViewState extends State<Message_View> {
  List<QuestionDto> not_answers = [];
  List<QuestionDto> ok_answers = [];
  Future? myfuture;
  bool state = false;

  get_questions() async {
    setState(() {
      not_answers = [];
      ok_answers = [];
    });

    final prefs = await SharedPreferences.getInstance();
    String gymId = prefs.getInt("gymId").toString();

    if (gymId == null) {
    } else {
      List<QuestionDto> questions = await QuestionApi().findall_question(gymId);

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
    Size size = MediaQuery.of(context).size;
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
                "회원 문의",
                style: TextStyle(
                    fontSize: 21,
                    color: kTextColor,
                    fontFamily: "boldfont",
                    fontWeight: FontWeight.bold
                ),
              ),
              InkWell(
                  onTap: () async {
                    await showModalBottomSheet<void>(
                        context: context,
                        isScrollControlled: true,
                        builder: (BuildContext context) {
                          return Bottom_Sheet();
                        });

                    setState(() {
                      myfuture = get_questions();
                    });
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder(
                future: myfuture,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData == false) {
                    return Container();
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
                        state == false
                            ? Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 15.w, bottom: 20.h, top: 22.h),
                                    child: Text(
                                      "답변전",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 21),
                                    ),
                                  ),
                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          state = !state;
                                        });
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(left: 10.w),
                                        child: Icon(
                                          Icons.autorenew,
                                          size: 28,
                                        ),
                                      )),
                                ],
                              )
                            : Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 15.w, bottom: 20.h, top: 22.h),
                                    child: Text(
                                      "답변후",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 21),
                                    ),
                                  ),
                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          state = !state;
                                        });
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(left: 10.w),
                                        child: Icon(
                                          Icons.autorenew,
                                          size: 28,
                                        ),
                                      )),
                                ],
                              ),
                        state == false
                            ? Container(
                                margin: EdgeInsets.only(
                                    left: 15.w,
                                    bottom: 20.h,
                                    top: 10.h,
                                    right: 15.w),
                                width: 360.w,
                                height: 600.h,
                                child: ListView.builder(
                                    itemCount: not_answers.length,
                                    itemBuilder: (BuildContext ctx, int idx) {
                                      return Stack(
                                        children: [
                                          Container(
                                            margin:
                                                EdgeInsets.only(bottom: 10.h),
                                            width: 340.w,
                                            height: 60.h,
                                            decoration: BoxDecoration(
                                                color: kBoxColor,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10))),
                                            child: InkWell(
                                              onTap: () async {
                                                showtoast("아직 답변이 등록되지 않았습니다");
                                              },
                                              child: Container(
                                                  width: 320.w,
                                                  margin: EdgeInsets.only(
                                                      left: 10.w, right: 10),
                                                  child: Center(
                                                      child: Text(
                                                    "${not_answers[idx].content}",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        color: kPrimaryColor,
                                                        fontSize: 16),
                                                  ))),
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(),
                                            ],
                                          )
                                        ],
                                      );
                                    }))
                            : Container(
                                margin: EdgeInsets.only(
                                    left: 15.w,
                                    bottom: 20.h,
                                    top: 10.h,
                                    right: 15.w),
                                width: 360.w,
                                height: 600.h,
                                child: ListView.builder(
                                    itemCount: ok_answers.length,
                                    itemBuilder: (BuildContext ctx, int idx) {
                                      return Stack(
                                        children: [
                                          Container(
                                            margin:
                                                EdgeInsets.only(bottom: 10.h),
                                            width: 340.w,
                                            height: 60.h,
                                            decoration: BoxDecoration(
                                                color: kBoxColor,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10))),
                                            child: InkWell(
                                              onTap: () async {
                                                await showModalBottomSheet<
                                                        void>(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return StatefulBuilder(
                                                          builder: (BuildContext
                                                                  context,
                                                              StateSetter
                                                                  bottomState) {
                                                        return Answer_BottomSheet(
                                                          questionDto:
                                                              ok_answers[idx],
                                                        );
                                                      });
                                                    });

                                                setState(() {
                                                  print("Dd");
                                                  state;
                                                });
                                              },
                                              child: Container(
                                                  width: 320.w,
                                                  margin: EdgeInsets.only(
                                                      left: 10.w, right: 10),
                                                  child: Center(
                                                      child: Text(
                                                    "${ok_answers[idx].content}",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        color: kPrimaryColor,
                                                        fontSize: 16),
                                                  ))),
                                            ),
                                          ),
                                        ],
                                      );
                                    }))
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
