import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shopping_tool/Utils/constants.dart';

import '../../../Model/dto/gymDto.dart';
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
        margin: EdgeInsets.only(top: 0.h,bottom: 15),
        decoration: BoxDecoration(

            color: kContainerColor,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Column(
          children: [
            Container(

              height: widget.size.height * 0.34,
              width: 340.w,
              child:ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    "assets/images/gym_img.png",
                    fit: BoxFit.cover,
                  )
              ),
            ),
            Container(
              height: widget.size.height * 0.13,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 15.h,left: 25),

                        child: Text(
                          "${widget.gymDto.name}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22,color: kPrimaryColor),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5.h,right: 25),
                        child: Text(
                          "",
                          style: TextStyle(fontSize: 19),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Container(
                        margin: const EdgeInsets.only(left: 25.0,top: 10),
                        child: Text(
                            "${widget.gymDto.address}",
                          style: TextStyle(
                              fontFamily: "boldfont", fontSize: 17),
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
    );
  }
}
