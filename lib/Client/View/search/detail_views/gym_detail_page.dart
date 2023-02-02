
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';




class Gym_Detail_Page extends StatefulWidget {
  const Gym_Detail_Page({Key? key}) : super(key: key);

  @override
  _Gym_Detail_PageState createState() => _Gym_Detail_PageState();
}

class _Gym_Detail_PageState extends State<Gym_Detail_Page> {

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final List<String> imageList = ["https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80",
      'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
      'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
      'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        elevation: 0,
      ),
      backgroundColor: Colors.grey.shade200,

      body: SingleChildScrollView(
        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Container(
                margin: EdgeInsets.all(15),
                child: CarouselSlider.builder(
                  itemCount: imageList.length,
                  options: CarouselOptions(
                    enlargeCenterPage: true,
                    height: size.height*0.3,
                    autoPlay: false,
                    autoPlayInterval: Duration(seconds: 6),
                    reverse: false,
                    aspectRatio: 5.0,
                  ),
                  itemBuilder: (context, i, id){
                    //for onTap to redirect to another screen
                    return GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.white,)
                        ),
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
                      onTap: (){
                        var url = imageList[i];
                        print(url.toString());
                      },
                    );
                  },
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("비나이더 안산점",style: TextStyle(fontSize: 32,fontFamily: "boldfont"),),
            ),
            
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("면적수 : 500 평",style: TextStyle(fontSize: 18),)
                ],
              ),
            ),



            Container(
              height: size.height*1,
              width: size.width*1,
              decoration: BoxDecoration(
                color: Colors.white,
                  borderRadius: BorderRadius.circular(20)),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: size.height*0.02,),

                  Center(
                    child: Container(
                      height: size.height*0.2,
                      width: size.width*0.9,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 11,
                              offset: Offset(0, 1), // changes position of shadow
                            ),
                          ],

                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),

                      child: Column(
                        children: [
                          SizedBox(height: size.height*0.03,),
                          Text("헬스 + 옷",style: TextStyle(fontSize: 26),),
                          SizedBox(height: size.height*0.02,),
                          Text("월 30000 원",style: TextStyle(fontSize: 26,),),
                          SizedBox(height: size.height*0.02,),
                          
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [

                                Text("가격 더보기 >",style: TextStyle(color: Colors.grey),),
                              ],
                            ),
                          )
                        ],
                      ),


                    ),
                  ),
                  SizedBox(height: size.height*0.02,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(width: 500,
                        child: Divider(color: Colors.grey, thickness: 1.0)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("운영 시간",style: TextStyle(fontSize: 18),),
                        Text(""),
                        Text("[평 일] : 06:00 ~ 23:00"),
                        Text("[토요일] : 06:00 ~ 23:00"),
                        Text("[휴관일] : 일요일,공휴일"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(width: 500,
                        child: Divider(color: Colors.grey, thickness: 1.0)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("헬스장 소개",style: TextStyle(fontSize: 18),),
                        Text(""),
                        Text("저희 헬스장은 파워렉 5개 유산소존은 따로 배치되어 있으며 파워리프팅존 또한 따로 배치되어있습니다"),

                      ],
                    ),
                  ),
                  
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
