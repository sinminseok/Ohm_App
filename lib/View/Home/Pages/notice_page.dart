import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Presenter/provider/providers.dart';
import '../../../Utils/constants.dart';
import '../Widgets/announcement_widget.dart';
import 'admin_pages/admin_notice.dart';

class Notice_Page extends StatefulWidget {
  const Notice_Page({Key? key}) : super(key: key);

  @override
  _Notice_Page createState() => _Notice_Page();
}

class _Notice_Page extends State<Notice_Page> {
  String? admin_check_disk;

  bool? check_ontap = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String? admin_autority = Provider.of<Providers>(context).admin_authority;
    return Scaffold(
        // appBar: Appbar_Widget(),
        backgroundColor: kBackgroundColor,
        body: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                  child: admin_autority == "off"
                      //일반회원모드 일때
                      ? Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      check_ontap = false;
                                      print(check_ontap);
                                    });
                                  },
                                  child: check_ontap == false
                                      ? Container(
                                          decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Colors.black)),
                                          ),
                                          child: Text(
                                            "헬스장 게시판",
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.blueGrey,
                                              fontFamily: "boldfont",
                                            ),
                                          ))
                                      : Container(
                                          child: Text(
                                          "헬스장 게시판",
                                          style: TextStyle(
                                            fontFamily: "boldfont",
                                          ),
                                        )),
                                ),
                                InkWell(
                                    onTap: () {
                                      setState(() {
                                        check_ontap = true;
                                        print(check_ontap);
                                      });
                                    },
                                    child: check_ontap == true
                                        ? Container(
                                            decoration: BoxDecoration(
                                              border: Border(
                                                  bottom: BorderSide(
                                                      color: Colors.black)),
                                            ),
                                            child: Text(
                                              "트레이너 소개",
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.blueGrey,
                                                fontFamily: "boldfont",
                                              ),
                                            ))
                                        : Container(
                                            child: Text(
                                            "트레이너 소개",
                                            style: TextStyle(
                                              fontFamily: "boldfont",
                                            ),
                                          ))),
                              ],
                            ),
                            check_ontap == false
                                ? Container(
                                    width: size.width * 0.8,
                                    height: size.height * 0.7,
                                    child: ListView(
                                      children: [
                                        List_Item(size),
                                        List_Item(size),
                                      ],
                                    ))
                                : Container(
                                    width: size.width * 0.9,
                                    height: size.height * 0.7,
                                    child: ListView(
                                      children: [
                                        InkWell(
                                            onTap: () {
                                              Navigator.pushNamed(
                                                  context, '/pt_detail');
                                            },
                                            child: List_Pt(size)),
                                        List_Pt(size),
                                      ],
                                    ))
                          ],
                        )
                      //관리자모드 (센터로 로그인했을경우)
                      : Admin_notice()),
            )
          ],
        ));
  }
}
