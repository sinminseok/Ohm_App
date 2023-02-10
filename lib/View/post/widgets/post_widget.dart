import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shopping_tool/Model/dto/postDto.dart';

import '../../search/detail_views/Gym_Detail.dart';
import '../detail_views/post_detail.dart';

Widget Post_Widget(Size size,context,PostDto postDto) {

  return InkWell(
    onTap: (){
    //  print(postDto.imgs[0].filePath);
      Navigator.push(
          context,
          PageTransition(
              type: PageTransitionType.fade,
              child: Post_Detail(postDto:postDto)));
    },
    child:Padding(
      padding: const EdgeInsets.only(bottom: 50.0),
      child: Container(
          height:  postDto.imgs.length == 0?size.height*0.3:size.height * 0.62,
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
              postDto.imgs.length == 0?Container(
                child: Text("게시물 이미지 없을때",style: TextStyle(fontSize: 23),),
              ):Container(
                height: size.height * 0.4,
                width: size.width * 1,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(1.0),
                    child: Image.asset(
                      "${postDto.imgs[0].filePath}",
                      fit: BoxFit.cover,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("${postDto.title}",style: TextStyle(fontFamily: "boldfont",fontSize: 21),),
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


