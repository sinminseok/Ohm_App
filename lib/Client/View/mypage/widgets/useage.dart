import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shopping_tool/Utils/constants.dart';

class Useage_Page extends StatelessWidget {
  const Useage_Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
      ),
      body: Column(
        children: [
          Text("오헬몇 사용방법"),
        ],
      ),
    );
  }
}
