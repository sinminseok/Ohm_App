
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shopping_tool/Utils/constants.dart';


class Search_name_page extends StatefulWidget {
  const Search_name_page({Key? key}) : super(key: key);

  @override
  _Search_name_pageState createState() => _Search_name_pageState();
}

class _Search_name_pageState extends State<Search_name_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(

        elevation: 0,
        backgroundColor: kBackgroundColor,
      ),
      body: SingleChildScrollView(

        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
