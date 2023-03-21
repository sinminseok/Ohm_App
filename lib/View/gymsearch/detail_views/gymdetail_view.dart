import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_tool/Controller/api/gymApi.dart';
import 'package:shopping_tool/Model/dto/gymDto.dart';
import 'package:shopping_tool/Model/dto/gymPriceDto.dart';
import 'package:shopping_tool/Model/dto/gymTimeDto.dart';
import 'package:shopping_tool/Utils/constants.dart';
import 'package:shopping_tool/Utils/http_urls.dart';
import 'package:shopping_tool/Utils/toast.dart';
import 'package:shopping_tool/View/frame/frame_page.dart';

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
                      child:  Container(
                        width: 360.w,
                        height: 330.h,
                        decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20))),

                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 2,
                            //widget.gymDto.imgs.length
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                margin: EdgeInsets.only(left: 15.w,right: 20.w),
                                height: 350.h,
                                width: 330.w,
                                decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20))),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: Image.network(
                                        awsimg_endpoint + widget.gymDto.imgs[0].filePath,
                                        fit: BoxFit.fill
                                    )),
                              );
                            }),),
                    ),



                  Container(
                    color: kBoxColor,
                    margin: EdgeInsets.only(top: 20.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 20.w, top: 25.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${widget.gymDto.name}",
                                style: TextStyle(fontSize: 19.sp, fontFamily: "boldfont2"),
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

                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.fade,
                                    child: FramePage()));
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 15.w,top: 15,bottom: 30),
                            width: 140.w,
                            height: 35.h,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.7),
                                    spreadRadius: 0,
                                    blurRadius: 5.0,
                                    offset: Offset(0, 4), // changes position of shadow
                                  ),
                                ],
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                color: kPrimaryColor
                            ),
                            child: Center(child: Text("내 헬스장 지정",style: TextStyle(fontFamily: "lightfont",color: kTextWhiteColor,fontWeight: FontWeight.bold),)),
                          ),
                        ),
                      ],
                    ),
                  )


               ,
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
                        height: 240.h,
                        decoration: BoxDecoration(color: kContainerColor),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 10.h, left: 18.w),
                              child: Text(
                                "센터 운영시간",
                                style: TextStyle(
                                    fontSize: 17.sp,
                                    fontFamily: "boldfont",
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.only(top: 20, left: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    gymTime?.monday == "00:00 ~ 00:00"
                                        ? Container()
                                        : Container(
                                        margin:
                                        EdgeInsets.only(bottom: 5.h),
                                        child: Text(
                                            "월요일 : ${gymTime?.monday}")),
                                    gymTime?.tuesday == "00:00 ~ 00:00"
                                        ? Container()
                                        : Container(
                                        margin:
                                        EdgeInsets.only(bottom: 5.h),
                                        child: Text(
                                            "화요일 : ${gymTime?.tuesday}")),
                                    gymTime?.wednesday == "00:00 ~ 00:00"
                                        ? Container()
                                        : Container(
                                        margin:
                                        EdgeInsets.only(bottom: 5.h),
                                        child: Text(
                                            "수요일 : ${gymTime?.wednesday}")),
                                    gymTime?.thursday == "00:00 ~ 00:00"
                                        ? Container()
                                        : Container(
                                        margin:
                                        EdgeInsets.only(bottom: 5.h),
                                        child: Text(
                                            "목요일 : ${gymTime?.thursday}")),
                                    gymTime?.friday == "00:00 ~ 00:00"
                                        ? Container()
                                        : Container(
                                        margin:
                                        EdgeInsets.only(bottom: 5.h),
                                        child: Text(
                                            "금요일 : ${gymTime?.friday}")),
                                    gymTime?.saturday == "00:00 ~ 00:00"
                                        ? Container()
                                        : Container(
                                        margin:
                                        EdgeInsets.only(bottom: 5.h),
                                        child: Text(
                                            "토요일 : ${gymTime?.saturday}")),
                                    gymTime?.sunday == "00:00 ~ 00:00"
                                        ? Container()
                                        : Container(
                                        margin:
                                        EdgeInsets.only(bottom: 5.h),
                                        child: Text(
                                            "일요일 : ${gymTime?.sunday}")),
                                    gymTime?.holiday == "00:00 ~ 00:00"
                                        ? Container(
                                        margin:
                                        EdgeInsets.only(bottom: 5.h),
                                        child: Text("공휴일 : 휴무"))
                                        : Container(
                                        margin:
                                        EdgeInsets.only(bottom: 5.h),
                                        child: Text(
                                            "공휴일 : ${gymTime?.holiday}")),
                                    gymTime?.closeDay == "없음"
                                        ? Container()
                                        : Container(
                                        margin:
                                        EdgeInsets.only(bottom: 5.h),
                                        child: Text(
                                            "휴관일 : ${gymTime?.closeDay}")),
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
