import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Manager/View/gym/AdminTrainer.dart';
import '../../../Manager/View/home/AdminHome.dart';
import '../../../Manager/View/mypage/AdminMypage.dart';
import '../../../Manager/View/post/AdminPost.dart';
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
  var authority;

  int admin_selectedItem = 0;

  final screens = [
    AdminHome(),
    AdminPost(),
    AdminGym(),
    AdminMypage(),
  ];

  @override
  void initState() {
    // check_authority();
    super.initState();
  }

  Future<String> check_authority() async {
    final prefs = await SharedPreferences.getInstance();
    authority = prefs.getString("admin_authority");

    if (authority == "true") {
      return "true";
    } else {

      return "false";
    }
  }

  final admin_screens = [
    HomePage(),
    PostPage(),
    Search_Page(),
    Mypage(),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return FutureBuilder(
        future: check_authority(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == false) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData == false) {
            return Center(child: CircularProgressIndicator());
          }
          //error가 발생하게 될 경우 반환하게 되는 부분
          else if (snapshot.hasError) {
            return Center(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircularProgressIndicator()),
            );
          } else {
            return snapshot.data == "false"
                ? Scaffold(
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
                          admin_selectedItem = val;
                        });
                      },
                      defaultSelectedIndex: 0,
                    ),
                    body: admin_screens[admin_selectedItem])
                : Scaffold(
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
        });
  }
}
