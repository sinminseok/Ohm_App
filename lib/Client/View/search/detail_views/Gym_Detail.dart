

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_tool/Model/GymDto.dart';
import 'package:shopping_tool/Model/PostDto.dart';
import 'package:shopping_tool/Utils/constants.dart';

import '../../Components/basic_appbar.dart';

class Gym_Detail extends StatefulWidget {


  GymDto gymDto;

  Gym_Detail({required this.gymDto});

  @override
  _Gym_Detail createState() => _Gym_Detail();
}

class _Gym_Detail extends State<Gym_Detail> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kBackgroundColor,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
          body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.9),
                        spreadRadius: 3,
                        blurRadius: 3,
                        offset: Offset(0, 2), // changes position of shadow
                      ),
                    ],
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Column(
                  children: [
                    Container(
                      height: size.height * 0.3,
                      width: size.width * 0.9,
                      child:ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            "assets/images/gym_img.png",
                            fit: BoxFit.cover,
                          )
                      ),
                    ),
                    Container(
                      height: size.height * 0.13,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "비나이더 안산점",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 22),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "10km",
                                  style: TextStyle(fontSize: 19),
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "렉5개",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "1개월 30000원",
                                  style: TextStyle(
                                      fontFamily: "boldfont", fontSize: 21),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),


    );
  }
}
