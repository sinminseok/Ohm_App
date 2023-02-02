

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_tool/Manager/View/gym/AdminTrainer.dart';
import 'package:shopping_tool/Manager/View/home/AdminHome.dart';
import 'package:shopping_tool/Manager/View/mypage/AdminMypage.dart';
import 'package:shopping_tool/Manager/View/post/AdminPost.dart';

import '../../../Utils/Ui/bottom_nav.dart';

class AdminFrame extends StatefulWidget {
  const AdminFrame({Key? key}) : super(key: key);

  @override
  _AdminFrameState createState() => _AdminFrameState();
}

class _AdminFrameState extends State<AdminFrame> {

  int _selectedItem = 0;


  final screens = [
    AdminHome(),
    AdminPost(),
    AdminGym(),
    AdminMypage(),
  ];


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        resizeToAvoidBottomInset: false,

        // drawer: Drawer(),

        bottomNavigationBar: CustomBottomNavigationBar(
          iconList: [
            Icons.home,
            Icons.speaker_notes_outlined,
            Icons.search,
            Icons.person,
          ],
          onChange: (val) {
            setState(() {
              _selectedItem = val;
            });
          },
          defaultSelectedIndex: 0,
        ),
        body: screens[_selectedItem]);
  }
}
