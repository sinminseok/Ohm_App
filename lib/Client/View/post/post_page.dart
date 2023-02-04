import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Utils/constants.dart';
import 'widgets/post_item.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  _PostPage createState() => _PostPage();
}

class _PostPage extends State<PostPage> {
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

    return Scaffold(
        backgroundColor: kBackgroundColor,
        body: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            check_ontap = false;
                          });
                        },
                        child: check_ontap == false
                            ? Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(color: Colors.black)),
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
                            });
                          },
                          child: check_ontap == true
                              ? Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                        bottom:
                                            BorderSide(color: Colors.black)),
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
                  // check_ontap == false
                  //     ? Container(
                  //         width: 360.w,
                  //         height: size.height * 0.7,
                  //         child: ListView(
                  //           children: [
                  //             Gym_Post_Item(size, context,),
                  //             Gym_Post_Item(size, context),
                  //             Gym_Post_Item(size, context),
                  //           ],
                  //         ))
                  //     : Container(
                  //         width: size.width * 1,
                  //         height: size.height * 0.7,
                  //         child: ListView(
                  //           children: [
                  //             InkWell(
                  //                 onTap: () {},
                  //                 child: Gym_Trainer_Item(size, context)),
                  //             Gym_Trainer_Item(size, context),
                  //           ],
                  //         ))
                ],
              )
                  //관리자모드 (센터로 로그인했을경우)
                  ),
            )
          ],
        ));
  }
}
