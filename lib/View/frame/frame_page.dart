import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../../Utils/Ui/bottom_nav.dart';
import '../Home/home_view.dart';
import '../gymInfo/gymInfo_view.dart';
import '../menu/user_page.dart';
import '../search/search_view.dart';

class FramePage extends StatefulWidget {
  const FramePage({Key? key}) : super(key: key);

  @override
  _FramePage createState() => _FramePage();
}

class _FramePage extends State<FramePage> {
  int _selectedItem = 0;
  var authority;

  int admin_selectedItem = 0;

  @override
  void initState() {
    // check_authority();
    super.initState();
  }

  final admin_screens = [
    Home_View(),
    GymInfo_View(),
    Search_View(),
    Menu_View(),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        resizeToAvoidBottomInset: false,


        bottomNavigationBar: CustomBottomNavigationBar(
          iconList: [
            Icons.home,
            Icons.speaker_notes_outlined,
            Icons.search,
            Icons.menu,
          ],
          onChange: (val) {
            setState(() {
              admin_selectedItem = val;
            });
          },
          defaultSelectedIndex: 0,
        ),
        body: admin_screens[admin_selectedItem]);
  }
}
