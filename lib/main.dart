import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shopping_tool/Presenter/provider/providers.dart';
import 'package:shopping_tool/View/Account/signup_page.dart';
import 'package:shopping_tool/View/Home/Pages/admin_pages/pt_view.dart';
import 'package:shopping_tool/View/Home/Pages/admin_pages/register_pt.dart';
import 'package:shopping_tool/View/Home/Pages/frame_page.dart';
import 'package:shopping_tool/View/Home/Pages/mypage/servie_center.dart';
import 'package:shopping_tool/View/Home/Pages/search_page.dart';
import 'View/Account/center_signup.dart';
import 'View/Home/Pages/admin_pages/posts_view.dart';
import 'View/Home/Pages/admin_pages/register_post.dart';
import 'View/Home/Pages/mypage/useage.dart';
import 'View/Home/Pages/nomar_pages/pt_detail.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Providers()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Frame_page(),
        // "/second" route로 이동하면, SecondScreen 위젯을 생성합니다.
        '/signup': (context) => Signup_page(),
        '/center_login': (context) => Center_Login(),
        '/search': (context) => Search_Page(),
        '/register_post': (context) => Register_Post(),
        '/register_pt': (context) => Register_Pt(),
        '/pt_detail': (context) => Pt_detail(),
        '/admin_posts_view': (context) => Posts_View(),
        '/admin_pt_view': (context) => Pt_View(),
        '/useage': (context) => Useage_Page(),
        '/service_center': (context) => ServiceCenter_Page(),
      },
      title: 'Flutter Animated Login',
      debugShowCheckedModeBanner: false,
    );
  }
}
