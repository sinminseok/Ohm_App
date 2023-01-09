import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_tool/Utils/constants.dart';

import '../../Widgets/announcement_widget.dart';

class Posts_View extends StatefulWidget {
  const Posts_View({Key? key}) : super(key: key);

  @override
  _Posts_ViewState createState() => _Posts_ViewState();
}

class _Posts_ViewState extends State<Posts_View> {

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
      ),
      body: Center(
        child: Container(
            width: size.width * 0.9,
            height: size.height * 0.7,
            child: ListView(
              children: [
                Gym_Trainer_Item(size,context),
                Gym_Trainer_Item(size,context),
              ],
            )),
      ),
    );
  }
}
