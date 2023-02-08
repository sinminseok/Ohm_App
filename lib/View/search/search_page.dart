import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_tool/Utils/toast.dart';
import '../../Controller/api/gymApi.dart';
import '../../Model/dto/gymDto.dart';
import '../../../Utils/constants.dart';
import '../../../Utils/key_values.dart';
import '../../Controller/provider/providers.dart';

import 'widgets/Gym_Container.dart';

class Search_Page extends StatefulWidget {
  @override
  _Search_PageState createState() => _Search_PageState();
}

class _Search_PageState extends State<Search_Page> {
  final TextEditingController _inputController = TextEditingController();
  Position? current_position;

  //모든 헬스장
  List<GymDto> all_gyms = [];
  List<GymDto> find_gyms = [];
  var addrData;

  //현재 사용자 위치 도로명주소 가져오는 함수
  get_current_address() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    current_position = position;

    var kakaoGeoUrl = Uri.parse(
        'https://dapi.kakao.com/v2/local/geo/coord2address.json?x=${current_position!.longitude}&y=${current_position!.latitude}&input_coord=WGS84');
    var kakaoGeo = await http.get(kakaoGeoUrl,
        headers: {"Authorization": "KakaoAK $KaKao_RestAPI_KEY"});

    String addr = kakaoGeo.body;
    addrData = jsonDecode(addr);

    return addrData;
  }

  //사용자가 구글맵에서 지정한 위치 도로명주소 가져오는 함수
  get_move_address(user_longitude, user_latitude) async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    current_position = position;

    var kakaoGeoUrl = Uri.parse(
        'https://dapi.kakao.com/v2/local/geo/coord2address.json?x=${user_longitude}&y=${user_latitude}&input_coord=WGS84');

    var kakaoGeo = await http.get(kakaoGeoUrl,
        headers: {"Authorization": "KakaoAK $KaKao_RestAPI_KEY"});

    String addr = kakaoGeo.body;
    addrData = jsonDecode(addr);

    return addrData;
  }

  get_allgym() async {
    all_gyms = await GymApi().search_allgym() as List<GymDto>;
    return all_gyms;
  }

  @override
  void initState() {
    // TODO: implement initState
    get_current_address();
    super.initState();
  }

  @override
  void dispose(){
    print("dispose");
    find_gyms = [];
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double? user_latitude = Provider.of<Providers>(context).user_latitude;
    double? user_longitude = Provider.of<Providers>(context).user_longitude;
    TextEditingController _searchController = TextEditingController();

    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: kBackgroundColor,
        ),
        backgroundColor: kBackgroundColor,
        body: InkWell(
          onTap: () {},
          child: SingleChildScrollView(
            child: Column(

              children: [
                //user_latitude는 사용자가 직접 위치를 지정했는지 안했는지 판별하는 변수
                Center(
                    child: Container(
                        margin: EdgeInsets.only(bottom: 20.h),

                        height: size.height * 0.05,
                        child: TextField(
                          maxLines: 10,
                          textInputAction: TextInputAction.done,
                          controller: _searchController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 20, top: 20),
                            hintText: "헬스장 이름",
                            hintStyle: TextStyle(
                                fontFamily: "gilogfont", fontSize: 21),
                            border: InputBorder.none,
                            suffixIcon: Padding(
                              padding:
                                  const EdgeInsets.only(top: 10.0, right: 10),
                              child: IconButton(
                                onPressed: () async{
                                  if(_searchController.text == ""){
                                    showtoast("내용을 입력해주세요");
                                  }else{

                                    var result = await GymApi().search_byname(_searchController.text);
                                    if(result.length == 0){
                                      showtoast("검색 결과가 없습니다.");
                                    }

                                    setState(() {
                                      find_gyms = result;
                                    });
                                  }
                                  print("object");
                                  print(find_gyms);

                                },
                                icon: Icon(
                                  Icons.search,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ))),

                find_gyms.length != 0 ?
                Container(
                    width: size.width * 0.9,
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
                            width: size.width * 0.9,
                            height: 700.h,
                            child: ListView.builder(
                                itemCount: all_gyms.length,
                                itemBuilder: (BuildContext ctx, int idx) {
                                  return Gym_Container(
                                      size: size, gymDto: all_gyms[idx]);
                                }));
                      }
                    }),
              ],
            ),
          ),
        ));
  }
}
