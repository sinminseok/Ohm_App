import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shopping_tool/Utils/constants.dart';
import 'package:marquee/marquee.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController scrollController = ScrollController();
  bool? check_search=false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: kBackgroundColor,
        body: Stack(
          children: [
            // Positioned(
            //   top: -size.height*0.4,
            //   child: Container(
            //     child:Marquee(
            //       text: '무료로 헬스장 센터에 오헬몇 서비스 도입을 원하시면 고객센터로 문의해주세요!',
            //       style: TextStyle(),blankSpace: 100,
            //
            //     ),
            //   ),
            // ),
            Align(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                  child: Column(
                children: [


                  // Appbar_notice(
                  //   notice_text: [Text("오헬몇?",style: TextStyle(fontFamily: "boldfont"),), Text("센터에 무료로 오헬몇 서비스를 제공해드립니다",style: TextStyle(fontFamily: "boldfont"),), Text("오헬몇?",style: TextStyle(fontFamily: "boldfont"),)],
                  //   scrollController: scrollController,
                  // ),
                  // Container(
                  //   height: size.height*0.2,
                  //   child: Text("오 헬 몇?",style: TextStyle(fontFamily: "boldfont",fontSize: 3),),
                  // ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        check_search = !check_search!;
                      });
                      Navigator.pushNamed(context, '/search');
                    },

                    child: Container(
                      width: size.width * 0.7,
                      height: size.height * 0.07,
                      decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(""),
                          Text(
                            "헬스장 이름 검색",
                            style: TextStyle(color: Colors.grey),
                          ),
                          Icon(Icons.search)
                        ],
                      ),
                    ),
                  ),

                  SizedBox(
                    height: size.height * 0.04,
                  ),

                  Stack(
                    children: [

                      check_search == false?
                  Center(
                  child: Container(
                  width: size.width * 0.9,
                    height: size.height * 0.6,
                    decoration: BoxDecoration(
                        color: Colors.white70,
                        //kBackgroundColor.withAlpha(50),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: size.height * 0.02,
                        ),

                        Icon(Icons.priority_high,size: size.width*0.2,),
                        SizedBox(
                          height: size.height * 0.1,
                        ),
                        Text(
                          "헬스장을 검색하세요",
                          style: TextStyle(
                              fontFamily: "boldfont", fontSize: 35),
                        ),
                        SizedBox(
                          height: size.height * 0.1,
                        ),

                      ],
                    ),
                  ),
        )
                          :Center(
                        child: Container(
                          width: size.width * 0.9,
                          height: size.height * 0.6,
                          decoration: BoxDecoration(
                              color: Colors.white70,
                              //kBackgroundColor.withAlpha(50),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: size.height * 0.2,
                              ),
                              Text(
                                "현재 인원수",
                                style: TextStyle(
                                    fontFamily: "boldfont", fontSize: 35),
                              ),
                              SizedBox(
                                height: size.height * 0.1,
                              ),
                              Text(
                                "18 명",
                                style: TextStyle(
                                    fontFamily: "boldfont",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 35),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )),
            )
          ],
        ));
  }
}

// Center(
// child: Text("현재 인원수",style: TextStyle(fontFamily: "boldfont",fontSize: 35),),
// )
