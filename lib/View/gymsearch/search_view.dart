
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shopping_tool/Utils/toast.dart';
import '../../Controller/api/gymApi.dart';
import '../../Model/dto/gymDto.dart';
import '../../../Utils/constants.dart';

import 'widgets/gym_widget.dart';

class Search_View extends StatefulWidget {
  @override
  _Search_View createState() => _Search_View();
}

class _Search_View extends State<Search_View> {
  TextEditingController _searchController = TextEditingController();
  Position? current_position;
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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: kBackgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              //user_latitude는 사용자가 직접 위치를 지정했는지 안했는지 판별하는 변수

              SizedBox(
                height: 50.h,
              ),
              Center(
                  child: Container(
                      margin: EdgeInsets.only(bottom: 0.h, top: 0.h),
                      decoration: BoxDecoration(
                          color: kBoxColor,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      height: 50.h,
                      width: 340.w,
                      child: TextField(
                        maxLines: 10,
                        textInputAction: TextInputAction.done,
                        controller: _searchController,
                        onSubmitted: (value) async{
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
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 20, top: 20),
                          hintText: "헬스장 이름",
                          hintStyle:
                              TextStyle(fontFamily: "boldfont", fontSize: 18),
                          border: InputBorder.none,
                          suffixIcon: Padding(
                            padding:
                                const EdgeInsets.only(top: 0.0, right: 10),
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
                                color: kPrimaryColor,
                              ),
                            ),
                          ),
                        ),
                      ))),

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
                            margin: EdgeInsets.only(top:270.h),
                            child: spinkit,
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
        ));
  }
}
