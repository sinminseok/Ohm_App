import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shopping_tool/Model/dto/postDto.dart';
import '../detail_views/post_detail.dart';

Widget Post_Widget(Size size, context, PostDto postDto) {
  return InkWell(
      onTap: () {
        Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.fade,
                child: Post_Detail(postDto: postDto)));
      },
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 15),
            width: 360.w,
            height: postDto.imgs.length == 0
                ? size.height * 0.3
                : size.height * 0.62,
            decoration: BoxDecoration(
                border: Border.all(
                  width: 0.3,
                  color: Colors.grey,
                ),
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.all(Radius.circular(1))),
            child: Column(
              children: [
                postDto.imgs.length == 0
                    ? Container(
                        child: Container(margin: EdgeInsets.only(top: 30.h)),
                      )
                    : Container(
                        height: size.height * 0.4,
                        width: size.width * 1,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(1.0),
                            child: Image.asset(
                              "assets/images/gym_img.png",
                              fit: BoxFit.cover,
                            )),
                      ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "${postDto.title}",
                    style: TextStyle(fontFamily: "boldfont", fontSize: 21),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "${postDto.content}",
                    style: TextStyle(fontFamily: "lightfont", fontSize: 21),
                  ),
                ),
              ],
            ),
          ),
        ],
      ));
}
