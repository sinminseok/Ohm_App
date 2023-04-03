import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shopping_tool/Utils/sundry/constants.dart';
import 'package:shopping_tool/Utils/sundry/http_urls.dart';

import '../../../Model/gym/gymDto.dart';
import '../detail_views/gymdetail_view.dart';



class Gym_Container extends StatefulWidget {

  Size size;
  GymDto gymDto;

  Gym_Container({required this.size,required this.gymDto});

  @override
  _Gym_ContainerState createState() => _Gym_ContainerState();
}

class _Gym_ContainerState extends State<Gym_Container> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.fade,
                child: GymDetail_View(gymDto: widget.gymDto,)));
      },
      child: Container(
        margin: EdgeInsets.only(top: 0.h,bottom: 10),
        decoration: BoxDecoration(
           border: Border.all(color: kBoxColor,width: 1.3),


            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(0),
              child:  Container(
                margin: EdgeInsets.only(top: 10.h),

                width: 360.w,
                height: 160.h,
                decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10))),

                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.gymDto.imgs.length,
                    //widget.gymDto.imgs.length
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.only(left: 10.w,right: 10.w),
                        height: 350.h,
                        width: 330.w,
                        decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10))),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: Image.network(
                                awsimg_endpoint + widget.gymDto.imgs[index].filePath,
                                fit: BoxFit.fill
                            )),
                      );
                    }),),
            ),
            Container(
              margin: EdgeInsets.only(left: 20.w,top: 10),
              child: Text("${widget.gymDto.name}",style: TextStyle(color: kTextBlackColor,fontSize: 18.sp,fontWeight: FontWeight.bold,fontFamily: "boldfont"),),
            ),
            Container(
              margin: EdgeInsets.only(left: 20.w,top: 8.h,bottom: 0),
              child: Text("${widget.gymDto.oneline_introduce}",style: TextStyle(color: Colors.grey.shade800,fontSize: 12.sp,fontWeight: FontWeight.bold,fontFamily: "lightfont"),),
            ),
            Container(
              margin: EdgeInsets.only(left: 20.w,top: 10.h,bottom: 15.h),
              child: Text("${widget.gymDto.address}",style: TextStyle(color: Colors.grey.shade800,fontSize: 12.sp,fontWeight: FontWeight.bold,fontFamily: "lightfont"),),
            ),



          ],
        ),
      ),
    );
  }
}
