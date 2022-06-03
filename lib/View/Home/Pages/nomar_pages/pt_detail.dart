import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shopping_tool/Utils/constants.dart';

class Pt_detail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimaryColor,
      ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: size.height*0.05,),
        Center(
            child: CircleAvatar(
                radius: size.width*0.28,

              backgroundImage: AssetImage("assets/images/user.jpg")
            ),

        ),
        SizedBox(height: size.height*0.05,),

        Text("신민석 트레이너",style: TextStyle(fontFamily: "boldfont",fontSize: 32),),
        SizedBox(height: size.height*0.1,),

        Container(
            width: size.width*0.8,
            child: Center(child: Text("S라인을 원하면 문의해주세요!",style: TextStyle(fontFamily: "boldfont",fontSize: 22),))),
      ],
    ));
  }
}


// child: Container(
// width: size.width*0.4,
// decoration: BoxDecoration( color: Colors.grey[300], borderRadius: BorderRadius.all( Radius.circular(100))),
// child: Image.asset("assets/images/user.jpg")