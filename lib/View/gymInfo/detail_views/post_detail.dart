

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_tool/Model/post/postDto.dart';
import 'package:shopping_tool/Utils/sundry/constants.dart';

import '../../../Utils/sundry/http_urls.dart';

class Post_Detail extends StatefulWidget {


  PostDto postDto;

  Post_Detail({required this.postDto});

  @override
  _Post_Detail createState() => _Post_Detail();
}

class _Post_Detail extends State<Post_Detail> {
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
      body:SingleChildScrollView(
        child: Column(
          children: [
            widget.postDto.imgs.length == 0
                ? Container()
                : Container(
              width: 360.w,
              height: 340.h,

              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.postDto.imgs.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 340.h,
                      width: 360.w,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(0.0),
                          child: Image.network(
                              awsimg_endpoint + widget.postDto.imgs[index].filePath,
                              fit: BoxFit.fill
                          )),
                    );
                  }),),
            Container(
              width: size.width,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 20,right: 20,top: 10),
                      child: Text("${widget.postDto.title}",style: TextStyle(fontSize: 30),)),
                  Container(
                      margin: EdgeInsets.only(left: 20,right: 20,top: 30,bottom: 50),
                      child: Text("${widget.postDto.content}",style: TextStyle(fontSize: 30),)),
                ],
              ),
            ),
          ],
        ),
      ),


    );
  }
}
