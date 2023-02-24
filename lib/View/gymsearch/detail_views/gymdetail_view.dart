import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_tool/Controller/api/gymApi.dart';
import 'package:shopping_tool/Model/dto/gymDto.dart';
import 'package:shopping_tool/Model/dto/gymPriceDto.dart';
import 'package:shopping_tool/Model/dto/gymTimeDto.dart';
import 'package:shopping_tool/Utils/constants.dart';
import 'package:shopping_tool/Utils/toast.dart';

import '../popup/address_popup.dart';
import '../widgets/gymPrice_widget.dart';


class GymDetail_View extends StatefulWidget {
  GymDto gymDto;

  GymDetail_View({required this.gymDto});

  @override
  _GymDetail_View createState() => _GymDetail_View();
}

class _GymDetail_View extends State<GymDetail_View> {
  bool isChecked = false;
  GymTimeDto? gymTime;
  Future? myfuture;
  List<GymPriceDto> prices = [];

  @override
  void initState() {
    // TODO: implement initState
    myfuture = get_gymInfo();
    super.initState();
  }

  get_gymInfo() async{
    gymTime =await GymApi().get_gymtime(widget.gymDto.id.toString());
    prices =(await GymApi().get_gymprices(widget.gymDto.id.toString()))!;
    return prices;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final List<String> imageList = [
      "https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80",
      'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
      'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
      'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
    ];
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: kTextColor, //change your color here
        ),
        // automaticallyImplyLeading: false,
        backgroundColor: kBackgroundColor,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [

          ],
        ),
      ),
      backgroundColor: kBackgroundColor,
      body: FutureBuilder(
          future: myfuture,
          builder: (BuildContext context, AsyncSnapshot snapshot) {

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
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.all(0),
                      child: CarouselSlider.builder(
                        itemCount: imageList.length,
                        options: CarouselOptions(
                          enlargeCenterPage: true,
                          height: size.height * 0.3,
                          autoPlay: false,
                          autoPlayInterval: Duration(seconds: 6),
                          reverse: false,
                          aspectRatio: 5.0,
                        ),
                        itemBuilder: (context, i, id) {
                          //for onTap to redirect to another screen
                          return GestureDetector(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    color: Colors.white,
                                  )),
                              //ClipRRect for image border radius
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.network(
                                  imageList[i],
                                  width: 500,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            onTap: () {
                              var url = imageList[i];
                              print(url.toString());
                            },
                          );
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20.w, top: 30.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${widget.gymDto.name}",
                            style: TextStyle(fontSize: 26, fontFamily: "boldfont"),
                          ),
                          InkWell(
                              onTap: () async {
                                Address_Popup().showDialog(context, widget.gymDto.address);
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 10,bottom: 5),
                                child: Icon(

                                  Icons.place,
                                  size: 30,
                                  color: kPrimaryColor,
                                ),
                              ))
                        ],
                      ),
                    ),


                    InkWell(
                      onTap: ()async{
                        final prefs = await SharedPreferences.getInstance();
                        if(prefs.getInt("gymId") == null){
                          prefs.setInt("gymId", widget.gymDto.id);
                        }else{
                          prefs.remove("gymId");
                          prefs.setInt("gymId", widget.gymDto.id);
                        }
                        showtoast("헬스장이 등록되었습니다.");

                        Navigator.pop(context);
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 10,top: 15,bottom: 10),
                        width: 140.w,
                        height: 30.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: kPrimaryColor
                        ),
                        child: Center(child: Text("내 헬스장 지정",style: TextStyle(color: kTextWhiteColor,fontWeight: FontWeight.bold),)),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 10.h),
                        width: 360.w,
                        height: 140.h,
                        decoration: BoxDecoration(color: kContainerColor),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 10.h, left: 10.w),
                              child: Text(
                                "센터 이용료",
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              width: 360.w,
                              height: 90.h,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: prices.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        GestureDetector(
                                          onTap: () {},
                                          child: Container(
                                              margin: EdgeInsets.all(10),
                                              child: GymPrice_Widget("${prices[index].during}", "${prices[index].price}")),
                                        )
                                      ],
                                    );
                                  }),
                            )
                          ],
                        )),
                    Container(
                        margin: EdgeInsets.only(top: 10.h),
                        width: 360.w,
                        height: 140.h,
                        decoration: BoxDecoration(color: kContainerColor),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 10.h, left: 18.w),
                              child: Text(
                                "센터 운영시간",
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.only(top: 20, left: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("평일 : ${gymTime?.weekday}"),
                                    gymTime?.closeddays =="토요일"?Container():Text("토요일 : ${gymTime?.saturday}"),
                                    gymTime?.closeddays =="일요일"?Container(): Text("일요일 : ${gymTime?.sunday}"),
                                    Text("공휴일 : ${gymTime?.holiday}"),
                                    Text("휴관일 : ${gymTime?.closeddays}"),
                                  ],
                                ))
                          ],
                        )),

                    Container(
                        margin: EdgeInsets.only(top: 10.h),
                        width: 360.w,
                        height: 140.h,
                        decoration: BoxDecoration(color: kContainerColor),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 10.h, left: 18.w),
                              child: Text(
                                "센터 소개",
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.only(top: 20, left: 20,right: 20),
                                child: Text("dajsbdjhasvfdjhavfhjasdvfhjdsbvfjhdsfhjbdsfhjvdsfhjdshjfbvdshjfv"))
                          ],
                        )),
                  ],
                ),
              );
            }
          }),
    );
  }
}
