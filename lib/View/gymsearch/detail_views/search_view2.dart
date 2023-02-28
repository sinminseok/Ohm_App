import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_tool/Utils/toast.dart';
import '../../../Controller/api/gymApi.dart';
import '../../../Model/dto/gymDto.dart';
import '../../../Utils/constants.dart';
import '../../../Utils/key_values.dart';

import '../widgets/gym_widget.dart';

class Search_View2 extends StatefulWidget {
  @override
  _Search_View2 createState() => _Search_View2();
}

class _Search_View2 extends State<Search_View2> {
  final TextEditingController _inputController = TextEditingController();
  Position? current_position;

  //모든 헬스장
  List<GymDto> all_gyms = [];
  List<GymDto> find_gyms = [];
  var addrData;

  get_allgym() async {
    all_gyms = await GymApi().search_allgym() as List<GymDto>;
    return all_gyms;
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  void dispose() {
    find_gyms = [];
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _searchController = TextEditingController();

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            //user_latitude는 사용자가 직접 위치를 지정했는지 안했는지 판별하는 변수
            SizedBox(
              height: 30.h,
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10,top: 20),
                  child: InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.keyboard_arrow_left_sharp)),
                ),
                Center(
                    child: Container(
                        width: 300.w,
                        height: 37.h,
                        margin: EdgeInsets.only(

                          top: 15.h,left: 10

                        ),
                        decoration: BoxDecoration(
                          color: kBoxColor,
                          borderRadius: BorderRadius.all(Radius.circular(10))
                        ),

                        child: TextField(
                          maxLines: 10,
                          textInputAction: TextInputAction.done,
                          controller: _searchController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 20, top: 8.h),
                            hintText: "헬스장 이름",
                            hintStyle: TextStyle(
                                fontFamily: "boldfont", fontSize: 17.sp),
                            border: InputBorder.none,
                            suffixIcon: Container(
                              margin: EdgeInsets.only(left: 0),
                              child: IconButton(
                                onPressed: () async {
                                  if (_searchController.text == "") {
                                    showtoast("내용을 입력해주세요");
                                  } else {
                                    var result = await GymApi()
                                        .search_byname(_searchController.text);
                                    if (result.length == 0) {
                                      showtoast("검색 결과가 없습니다.");
                                    }

                                    setState(() {
                                      find_gyms = result;
                                    });
                                  }
                                },
                                icon: Icon(
                                  Icons.search,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ))),
              ],
            ),


            find_gyms.length != 0
                ? Container(
                    width: 360.w,
                    height: 700.h,
                    child: ListView.builder(
                        itemCount: find_gyms.length,
                        itemBuilder: (BuildContext ctx, int idx) {
                          return Gym_Container(
                              size: size, gymDto: find_gyms[idx]);
                        }))
                : FutureBuilder(
                    future: get_allgym(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (all_gyms.length == 0) {
                        return Container(
                          child: Text("검색 결과가 없습니다."),
                        );
                      }
                      if (snapshot.connectionState == false) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (snapshot.hasData == false) {
                        return Center(child: CircularProgressIndicator());
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
                            width: 360.w,
                            height: 550.h,
                            child: ListView.builder(
                                itemCount: all_gyms.length,
                                itemBuilder: (BuildContext ctx, int idx) {
                                  return Gym_Container(
                                      size: size, gymDto: all_gyms[idx]);
                                }));
                      }
                    }),
            SizedBox(
              height: size.height * 0.3,
            ),
          ],
        ),
      ),
    );
  }
}
