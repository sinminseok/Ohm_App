

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_tool/Model/dto/postDto.dart';
import 'package:shopping_tool/Model/dto/trainerDto.dart';
import 'package:shopping_tool/Utils/constants.dart';

import '../../Components/basic_appbar.dart';

class Trainer_Detail extends StatefulWidget {

  TrainerDto trainerDto;
  Trainer_Detail({required this.trainerDto});

  @override
  _Trainer_Detail createState() => _Trainer_Detail();
}

class _Trainer_Detail extends State<Trainer_Detail> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey.shade200,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 240.h,
              width: 360.w,
              child:ClipRRect(
                  borderRadius: BorderRadius.circular(0.0),
                  child: Image.asset(
                    "assets/images/teacher.jpeg",
                    fit: BoxFit.cover,
                  )
              ),
            ),
            Container(
              width: 360.w,


              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                  margin: EdgeInsets.only(left: 20,top: 10)
                  ,
                      child: Text("${widget.trainerDto.nickname} 트레이너",style: TextStyle(fontSize: 27),)),

                  Container(
                      margin: EdgeInsets.only(left: 20,top: 20)
                      ,
                    child: Text("${widget.trainerDto.introduce}",style: TextStyle(fontSize: 21),),
                  )
                ],
              ),
            ),
          ],
        ),
      )


    );
  }
}