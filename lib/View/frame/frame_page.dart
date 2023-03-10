import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shopping_tool/View/message/message_view.dart';
import '../../../Utils/Ui/bottom_nav.dart';
import '../Home/home_view.dart';
import '../gymInfo/gymInfo_view.dart';
import '../gymsearch/search_view.dart';
import '../menu/menu_view.dart';

class FramePage extends StatefulWidget {
  const FramePage({Key? key}) : super(key: key);

  @override
  _FramePage createState() => _FramePage();
}

class _FramePage extends State<FramePage> {
  var authority;

  int admin_selectedItem = 0;

  @override
  void initState() {
    super.initState();
  }

  final admin_screens = [
    Home_View(),
    GymInfo_View(),
    Message_View(),
    Menu_View(),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        resizeToAvoidBottomInset: false,


        bottomNavigationBar: CustomBottomNavigationBar(
          iconList: [
            Icons.fitness_center,
            Icons.speaker_notes_outlined,
            Icons.email_outlined,
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
