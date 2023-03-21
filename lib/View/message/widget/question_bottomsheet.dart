import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_tool/Controller/api/questionApi.dart';
import 'package:shopping_tool/Utils/Ui/button_widget.dart';
import 'package:shopping_tool/Utils/toast.dart';

import '../../../Utils/constants.dart';
import 'package:flutter_keyboard_size/flutter_keyboard_size.dart';
class Bottom_Sheet extends StatefulWidget {
  const Bottom_Sheet({Key? key}) : super(key: key);

  @override
  State<Bottom_Sheet> createState() => _Bottom_SheetState();
}

class _Bottom_SheetState extends State<Bottom_Sheet> {
  TextEditingController _contentController = TextEditingController();
  late ScrollController _scrollController;
  bool ontap_state = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    ontap_state = false;
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return Container(
        height: 400.h,
        color: kBackgroundColor,
        child: SingleChildScrollView(

          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              Container(
                  margin: EdgeInsets.only(top: 10.h),
                  width: 340.w,
                  height: 250.h,
                  decoration: BoxDecoration(
                      color: kBoxColor,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: TextFormField(
                    onTap: (){
                      setState(() {
                        ontap_state = !ontap_state;
                        print(ontap_state);
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
                margin: EdgeInsets.only(top: 25.h),
                width: 340.w,
                height: 40.h,
                decoration: BoxDecoration(
                    color: kButtonColor,
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
            ],
          ),
        ));
  }
}
