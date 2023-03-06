import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shopping_tool/Model/dto/postDto.dart';
import 'package:shopping_tool/Utils/http_urls.dart';
import '../../../Utils/constants.dart';
import '../detail_views/post_detail.dart';

Widget Post_Widget(Size size,context,PostDto postDto) {

  return InkWell(
    onTap: ()async{
      // print(postDto.imgs[0].filePath);

      Navigator.push(
          context,
          PageTransition(
              type: PageTransitionType.fade,
              child: Post_Detail(postDto:postDto)));

    },
    child:Padding(
      padding: const EdgeInsets.only(bottom: 10.0,top: 10),
      child: Container(
        decoration: BoxDecoration(
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.grey.withOpacity(0.5),
            //     spreadRadius: 5,
            //     blurRadius: 7,
            //     offset: Offset(0, 3), // changes position of shadow
            //   ),
            // ],
            color: kContainerColor,
            borderRadius: BorderRadius.all(Radius.circular(1))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            postDto.imgs.length == 0?Container():Container(
              height: 340.h,
              width: 360.w,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(1.0),
                  child: Image.network(

                    awsimg_endpoint+postDto.imgs[0].filePath,
                    fit: BoxFit.fill,
                  )),
            ),
            Container(
              width: 350.w,
              margin: EdgeInsets.only(left: 20.w,top: 20.h,right: 20.w),
              child: Text("${postDto.title}",style: TextStyle(fontFamily: "boldfont",fontSize: 21),),
            ),
            Container(
              width: 350.w,
              height: 20.h,
              margin: EdgeInsets.only(left: 20.w,top: 10.h,right: 20.w,bottom: 30.h),
              child: Text("더보기", overflow: TextOverflow.clip,style: TextStyle(fontFamily: "lightfont",fontSize: 21),),
            ),
          ],
        ),
      ),
    ),

  );
}


