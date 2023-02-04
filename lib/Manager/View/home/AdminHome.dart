import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_tool/Manager/Controller/http_manager.dart';
import 'package:shopping_tool/Model/GymDto.dart';
import 'package:shopping_tool/Model/TrainerDto.dart';

import '../../../Utils/Ui/gray_line.dart';
import '../../../Utils/constants.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  GymDto? gymDto;
  var result;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<GymDto?> get_gyminfo() async {
    final prefs = await SharedPreferences.getInstance();

    gymDto =
        await Http_Manager().gyminfo_byManager("1", prefs.getString("token"));

    return gymDto;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.h),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: kBackgroundColor,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/main_text.png',
                  fit: BoxFit.contain,
                  height: 40.h,
                ),
              ],
            ),
            elevation: 0,
          ),
        ),
        backgroundColor: kBackgroundColor,
        body: SingleChildScrollView(
            child: Column(
          children: [
            Container(
                margin: EdgeInsets.fromLTRB(0, 10.h, 0, 10.h),
                child: Gray_Line(size: size)),
            InkWell(
                onTap: () async {
                  final prefs = await SharedPreferences.getInstance();
                  Http_Manager()
                      .gyminfo_byManager("1", prefs.getString("token"));
                },
                child: Text("test")),
            FutureBuilder(
                future: get_gyminfo(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData == false) {
                    return CircularProgressIndicator(); // CircularProgressIndicator : 로딩 에니메이션
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
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            child: Text("헬스장 이름 : ${snapshot.data.name}",style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold),),
                          ),

                          Container(
                            child: Text("헬스장 주소 : ${snapshot.data.address}",style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold),),
                          ),

                          Container(
                            child: Text("헬스장 인원수 : ${snapshot.data.count}",style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold),),
                          ),

                          Container(
                            child: Text("헬스장 소개 : ${snapshot.data.introduce}",style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold),),
                          ),

                          Container(
                            child: Text("헬스장 한줄소개 : ${snapshot.data.oneline_introduce}",style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold),),
                          ),
                        ],
                      ),
                    );
                  }
                })
          ],
        )));
  }
}
