import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shopping_tool/Utils/constants.dart';

class ServiceCenter_Page extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
      ),
      body: Column(
        children: [
          SizedBox(height: size.height*0.04,),
          Center(child: Text("고객센터",style: TextStyle(fontSize: 32,fontFamily: "boldfont"),)),
          Text("센터에 오헬몇 서비스를 무료로 도입해보세요!",style: TextStyle(fontSize: 21,fontFamily: "boldfont",),),
          Text("헬스장 회원들에게 헬스장 인원수를 알려주세요!",style: TextStyle(fontSize: 21,fontFamily: "boldfont",),),
        ],
      ),
    );
  }
}
