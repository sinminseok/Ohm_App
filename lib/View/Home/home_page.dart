import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_tool/Controller/api/gymApi.dart';
import 'package:shopping_tool/Model/dto/gymDto.dart';
import 'package:shopping_tool/Utils/constants.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../../../Utils/Ui/gray_line.dart';
import '../../../Utils/get_date.dart';
import 'Widgets/bar_chart_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //현재 시d간
  var current_datetime;
  var gymId;
  GymDto? gymDto;
  Future? future;

  @override
  void initState() {
    future =get_gymInfo();
    current_datetime = fillter(DateTime.now().toString());
    super.initState();
  }

  Future<GymDto?> get_gymInfo()async{
    final prefs = await SharedPreferences.getInstance();
    gymId = prefs.getInt("gymId");
    print("object");
    print(gymId);
    if(gymId == null){
      return null;
    }else{
      gymDto = await GymApi().search_byId(gymId);
      return gymDto;
    }
  }

  @override
  void dispose() {
    super.dispose();
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
            FutureBuilder(
                future: future,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  //해당 부분은 data를 아직 받아 오지 못했을때 실행되는 부분을 의미한다.
                  if (snapshot.hasData == false) {
                    return Container(
                      child: Text("다니는 헬스장을 등록해보세요!"),
                    );
                  }
                  //error가 발생하게 될 경우 반환하게 되는 부분
                  else if (snapshot.hasError) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Error: ${snapshot.error}',
                        style: TextStyle(fontSize: 15),
                      ),
                    );
                  }
                  // 데이터를 정상적으로 받아오게 되면 다음 부분을 실행하게 되는 것이다.
                  else {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            width: 350.w,
                            height: 180.h,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 4,
                                    blurRadius: 3,
                                    offset: Offset(0, 1), // changes position of shadow
                                  ),
                                ],
                                color: Colors.white70,
                                //kBackgroundColor.withAlpha(50),
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                        onTap: () {
                                          fillter(DateTime.now().toString());
                                        },
                                        child: Text(
                                          "비나이더 안산점",
                                          style: TextStyle(
                                              fontSize: 18, fontFamily: "boldfont"),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "$current_datetime",
                                      style: TextStyle(fontSize: 12),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: size.height * 0.05,
                                ),
                                Center(
                                  child: Text(
                                    "14명",
                                    style: TextStyle(fontSize: 50, fontFamily: "boldfont"),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "평균보다 회원들이 없습니다",
                                    style: TextStyle(fontSize: 18, fontFamily: "lightfont"),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Stack(
                            children: [
                              Center(
                                child: Container(
                                  width: 350.w,
                                  height: 180.h,
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.3),
                                          spreadRadius: 4,
                                          blurRadius: 3,
                                          offset:
                                          Offset(0, 1), // changes position of shadow
                                        ),
                                      ],
                                      color: Colors.white70,
                                      //kBackgroundColor.withAlpha(50),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "평균 시간별 분표도",
                                          style: TextStyle(
                                              fontFamily: "boldfont", fontSize: 21),
                                        ),
                                      ),
                                      Center(
                                        child: Container(
                                          height: size.height * 0.2,
                                          child: charts.BarChart(
                                            Bar_Chart_Data_Widget.time_data(),
                                            animate: true,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Stack(
                            children: [
                              Center(
                                child: Container(
                                  width: 350.w,
                                  height: 180.h,
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.3),
                                          spreadRadius: 4,
                                          blurRadius: 3,
                                          offset:
                                          Offset(0, 1), // changes position of shadow
                                        ),
                                      ],
                                      color: Colors.white70,
                                      //kBackgroundColor.withAlpha(50),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "평균 요일 분포도",
                                          style: TextStyle(
                                              fontFamily: "boldfont", fontSize: 21),
                                        ),
                                      ),
                                      Center(
                                        child: Container(
                                          height: size.height * 0.2,
                                          child: charts.BarChart(
                                            Bar_Chart_Data_Widget.date_data(),
                                            animate: true,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }
                }),
          ],
        )));
  }
}
