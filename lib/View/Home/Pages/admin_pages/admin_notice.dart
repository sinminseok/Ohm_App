import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../../../Utils/constants.dart';
import '../../Widgets/announcement_widget.dart';

class Admin_notice extends StatefulWidget {
  const Admin_notice({Key? key}) : super(key: key);

  @override
  _Admin_noticeState createState() => _Admin_noticeState();
}

class _Admin_noticeState extends State<Admin_notice> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/register_post');
          },
          child: Container(
            decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(10)),
            width: size.width * 0.7,
            height: size.height * 0.05,
            child: Center(
                child: Text(
              "게시물 작성",
              style: TextStyle(
                  fontFamily: "boldfont", fontSize: 21, color: Colors.white),
            )),
          ),
        ),
        SizedBox(
          height: size.height * 0.03,
        ),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/register_pt');
          },
          child: Container(
            decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(10)),
            width: size.width * 0.7,
            height: size.height * 0.05,
            child: Center(
                child: Text(
              "트레이너 등록",
              style: TextStyle(
                  fontFamily: "boldfont", fontSize: 21, color: Colors.white),
            )),
          ),
        ),
        SizedBox(
          height: size.height * 0.2,
        ),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/admin_posts_view');
          },
          child: Container(
            decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(10)),
            width: size.width * 0.7,
            height: size.height * 0.05,
            child: Center(
                child: Text(
              "등록된 게시물 보기",
              style: TextStyle(
                  fontFamily: "boldfont", fontSize: 21, color: Colors.black),
            )),
          ),
        ),
        SizedBox(
          height: size.height * 0.03,
        ),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/admin_pt_view');
          },
          child: Container(
            decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(10)),
            width: size.width * 0.7,
            height: size.height * 0.05,
            child: Center(
                child: Text(
              "등록된 트레이너 보기",
              style: TextStyle(
                  fontFamily: "boldfont", fontSize: 21, color: Colors.black),
            )),
          ),
        ),
      ],
    );
  }
}
