import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shopping_tool/Utils/permission.dart';
import 'package:shopping_tool/Utils/toast.dart';
import 'package:shopping_tool/View/Home/Pages/map/google_map_page.dart';
import 'package:shopping_tool/View/Home/Pages/search_pages/CustomSearchPage.dart';
import 'package:shopping_tool/View/Home/Pages/search_pages/gym_detail_page.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_tool/View/Home/Pages/search_pages/search_name_page.dart';

import '../../../Presenter/provider/providers.dart';
import '../../../Utils/constants.dart';
import '../../../Utils/key_values.dart';
import '../Widgets/Search_Widget.dart';

class Search_Page extends StatefulWidget {
  @override
  _Search_PageState createState() => _Search_PageState();
}

class _Search_PageState extends State<Search_Page> {
  final TextEditingController _inputController = TextEditingController();
  Position? current_position;
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
    print("user_longitude : $user_longitude");
    print("user_latitude : $user_latitude");
    print(user_latitude.runtimeType);

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    current_position = position;

    var kakaoGeoUrl = Uri.parse(
        'https://dapi.kakao.com/v2/local/geo/coord2address.json?x=${user_longitude}&y=${user_latitude}&input_coord=WGS84');
    var kakaoGeo = await http.get(kakaoGeoUrl,
        headers: {"Authorization": "KakaoAK $KaKao_RestAPI_KEY"});
//jason data
    String addr = kakaoGeo.body;
    addrData = jsonDecode(addr);

    print("${addrData}");
    print("${addrData['documents'][0]['address']['region_2depth_name']}");

    return addrData;
  }



  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double? user_latitude = Provider.of<Providers>(context).user_latitude;
    double? user_longitude = Provider.of<Providers>(context).user_longitude;

    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: kBackgroundColor,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                  onTap: () {
                    showSearch(context: context, delegate: CustomSearchPage());
                  },
                  child: Icon(
                    Icons.search,
                    color: Colors.black,
                  )
              ),
            )
          ],
        ),
        backgroundColor: kBackgroundColor,
        body: InkWell(
          onTap: () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //user_latitude는 사용자가 직접 위치를 지정했는지 안했는지 판별하는 변수
              user_latitude != null
                  ? FutureBuilder(
                  future: get_move_address(user_longitude, user_latitude),
                  builder: (BuildContext context, AsyncSnapshot snapshot){
                    if (snapshot.connectionState == false) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasData == false) {
                      return Center(child: CircularProgressIndicator());
                    }

                    //error가 발생하게 될 경우 반환하게 되는 부분
                    if (snapshot.hasError) {
                      return Center(
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircularProgressIndicator()),
                      );
                    } else{
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.fade,
                                  child: Google_Map_Page()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceAround,
                              children: [
                                Icon(Icons.location_on),
                                Text(
                                  "${addrData['documents'][0]['address']['region_2depth_name']} ${addrData['documents'][0]['address']['region_3depth_name']}",
                                  style: TextStyle(
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox()
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                    })
                  : FutureBuilder(
                      future: get_current_address(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState == false) {
                          return Center(child: CircularProgressIndicator());
                        }
                        if (snapshot.hasData == false) {
                          return Center(child: CircularProgressIndicator());
                        }

                        //error가 발생하게 될 경우 반환하게 되는 부분
                        if (snapshot.hasError) {
                          return Center(
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircularProgressIndicator()),
                          );
                        } else {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.fade,
                                      child: Google_Map_Page()));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Icon(Icons.location_on),
                                    Text(
                                      "${addrData['documents'][0]['address']['region_2depth_name']} ${addrData['documents'][0]['address']['region_3depth_name']}",
                                      style: TextStyle(
                                          fontSize: 23,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox()
                                  ],
                                ),
                              ),
                            ),
                          );
                        }
                      }),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: size.width * 1,
                  height: size.height * 0.001,
                  decoration: BoxDecoration(color: Colors.grey),
                ),
              ),
              Container(
                width: size.width * 0.9,
                height: size.height * 0.67,
                child: ListView(
                  children: [
                    Search_Model(
                      size: size,
                    ),
                    Search_Model(
                      size: size,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
