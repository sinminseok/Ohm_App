import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_tool/Manager/Controller/http_manager.dart';
import 'package:shopping_tool/Model/TrainerDto.dart';

import '../../../Utils/Ui/gray_line.dart';
import '../../../Utils/constants.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  late Future<TrainerDto?> userinfo;
  var result;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<TrainerDto?> get_gyminfo() async {
    final prefs = await SharedPreferences.getInstance();

    userinfo =  Http_Manager()
      .getinfo_manager(prefs.getString("userId"), prefs.getString("token"));

    return userinfo;
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
                  Http_Manager().getinfo_manager(
                      prefs.getString("userId"), prefs.getString("token"));
                },
                child: Text("test")),
            FutureBuilder(
                future: get_gyminfo(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == false) {
                    return Center(
                        child: CircularProgressIndicator());
                  }
                  if (snapshot.hasData == false) {
                    return Center(
                        child: CircularProgressIndicator());
                  }
                  //error가 발생하게 될 경우 반환하게 되는 부분
                  else if (snapshot.hasError) {
                    return Center(
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircularProgressIndicator()),
                    );
                  } else {
                    return Container(
                      child: Text("${snapshot.data.gym}"),
                    );
                  }
                })
          ],
        )));
  }
}
