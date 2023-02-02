import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_tool/Client/Controller/provider/providers.dart';

class AdminMypage extends StatefulWidget {
  const AdminMypage({Key? key}) : super(key: key);

  @override
  _AdminMypageState createState() => _AdminMypageState();
}

class _AdminMypageState extends State<AdminMypage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 50,
            ),
            InkWell(
                onTap: (){
                  Providers().change_admin_authority();
                },
                child: Text("change_button"))
          ],
        ),
      ),
    );
  }
}
