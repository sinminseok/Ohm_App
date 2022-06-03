import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shopping_tool/Utils/constants.dart';
import 'package:shopping_tool/View/Home/Pages/search_page.dart';
import 'package:shopping_tool/View/Home/Pages/notice_page.dart';
import 'package:shopping_tool/View/Home/Pages/user_page.dart';

import '../../../Utils/Ui/bottom_nav.dart';
import 'home_page.dart';

class Frame_page extends StatefulWidget {
  const Frame_page({Key? key}) : super(key: key);

  @override
  _Frame_page createState() => _Frame_page();
}

class _Frame_page extends State<Frame_page> {
  int _selectedItem = 0;

  final screens = [
    HomePage(),
    Notice_Page(),
    User_page(),
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
