import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_tool/Controller/api/gymApi.dart';
import 'package:shopping_tool/Model/dto/gymDto.dart';
import 'package:shopping_tool/Utils/constants.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:shopping_tool/View/Home/detail_views/ready_view.dart';
import '../../../Utils/Ui/gray_line.dart';
import '../../../Utils/get_date.dart';
import 'Widgets/bar_chart_widget.dart';
import 'detail_views/home_detail.dart';

class Home_View extends StatefulWidget {
  const Home_View({Key? key}) : super(key: key);

  @override
  _Home_ViewState createState() => _Home_ViewState();
}

class _Home_ViewState extends State<Home_View> {
  //현재 시d간
  var current_datetime;
  String? current_count;
  var gymId;
  GymDto? gymDto;
  Future? future;

  List<double> time_avg = [];

  @override
  void initState() {
    future =get_gymInfo();
    current_datetime = fillter(DateTime.now().toString());
    super.initState();
  }

  Future<GymDto?> get_gymInfo()async{
    final prefs = await SharedPreferences.getInstance();
    gymId = prefs.getInt("gymId");
      current_count =await GymApi().current_count(gymId.toString());
    if(gymId == null){
      return null;
    }else{
      gymDto = await GymApi().search_byId(gymId);
      await get_avg();

      return gymDto;
    }
  }

  get_avg()async{
    final prefs = await SharedPreferences.getInstance();
    time_avg = (await GymApi().get_timeavg(prefs.getInt("gymId").toString()))!;
    print(time_avg);
    return time_avg;
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
          preferredSize: Size.fromHeight(30.h),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: kBottomColor,

            elevation: 0,
          ),
        ),
        backgroundColor: Colors.grey.shade200,
        body: FutureBuilder(
            future: future,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              //해당 부분은 data를 아직 받아 오지 못했을때 실행되는 부분을 의미한다.
              if (snapshot.hasData == false) {
                return Ready_View(currentdate: current_datetime,);
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
                return Home_Detail(curent_date: current_datetime, current_count: current_count, gymDto: gymDto, time_avg: time_avg,);
              }
            }),);
  }
}
