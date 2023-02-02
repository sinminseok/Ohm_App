import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../search/detail_views/Gym_Post_Detail_Page.dart';

Widget Gym_Post_Item(Size size,context) {
  return InkWell(
    onTap: (){
      // Navigator.push(
      //     context,
      //     PageTransition(
      //         type: PageTransitionType.fade,
      //         child: Gym_Post_Detail_Page()));
    },
    child:Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
          height: size.height * 0.62,
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
              borderRadius: BorderRadius.all(Radius.circular(1))),
          child: Column(
            children: [
              Container(
                height: size.height * 0.4,
                width: size.width * 1,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(1.0),
                    child: Image.asset(
                      "assets/images/img2.jpeg",
                      fit: BoxFit.cover,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("헬스장 창립기념 이벤트! 2022년 12월까지 3개월 99000원 ",style: TextStyle(fontFamily: "boldfont",fontSize: 21),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("..더보기",style: TextStyle(fontFamily: "lightfont",fontSize: 21),),
              ),
            ],
          ),
        ),
    ),

  );
}

Widget Gym_Trainer_Item(Size size,context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: size.height * 0.2,
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
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Row(
        children: [
          //  assets/images/img1.jpeg

          Container(
            width: size.width*0.4,
            child: ClipRRect(

                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset("assets/images/teacher.jpeg",fit: BoxFit.cover,)),
          ),
          Column(

            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("신민석 선생님",style: TextStyle(fontSize: 18,fontFamily: "boldfont"),),
              ),
              Text("비나이더 안산점",style: TextStyle(color: Colors.grey,fontFamily: "boldfont"),),
              SizedBox(height: size.height*0.06,),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text("근세포 하나하나 자극을",style: TextStyle(fontFamily: "boldfont"),),
              )
            ],
          )
        ],
      ),
    ),
  );
}
