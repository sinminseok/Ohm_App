import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

Widget List_Item(size) {
  return Container(
    width: size.width * 0.9,
    height: size.height * 0.7,
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "게시물 제목",
            style: TextStyle(fontSize: 21, fontFamily: "boldfont"),
          ),
        ),
        Image.asset("assets/images/img1.jpeg"),
      ],
    ),
  );
}

Widget List_Pt(size) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(


      width: size.width * 1,
      height: size.height * 0.13,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width:0.4,color: Colors.black)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
              radius: size.width * 0.09,
              backgroundImage: AssetImage("assets/images/user.jpg")),
          SizedBox(
            width: size.width * 0.04,
          ),
          Text(
            "신민석 트레이너",
            style: TextStyle(fontFamily: "boldfont"),
          ),
          SizedBox(
            width: size.width * 0.3,
          ),
          Icon(Icons.login)
        ],
      ),
    ),
  );
}
