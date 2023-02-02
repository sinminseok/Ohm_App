import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Utils/Ui/bottom_nav.dart';
import '../Home/home_page.dart';
import '../mypage/user_page.dart';
import '../post/post_page.dart';
import '../search/search_page.dart';

class FramePage extends StatefulWidget {
  const FramePage({Key? key}) : super(key: key);

  @override
  _FramePage createState() => _FramePage();
}

class _FramePage extends State<FramePage> {
  int _selectedItem = 0;


  final screens = [
    HomePage(),
    PostPage(),
    Search_Page(),
    Mypage(),
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
