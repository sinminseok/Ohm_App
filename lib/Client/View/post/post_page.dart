import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Manager/Controller/PostApiController.dart';
import '../../../Model/PostDto.dart';
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
  var results;

  Future<List<PostDto>?> load_posts()async{
    //gymId
    results =await PostApiController().findall_posts("2");
    return results;
  }


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
                  Container(
                    margin: EdgeInsets.only(top: 60.h),
                    child: Row(
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
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.h),

                    height: 590.h,
                    child:      check_ontap == false
                        ? FutureBuilder(
                        future: load_posts(),
                        builder: (BuildContext context, AsyncSnapshot snapshot) {
                          //해당 부분은 data를 아직 받아 오지 못했을때 실행되는 부분을 의미한다.
                          if (snapshot.hasData == false) {
                            return CircularProgressIndicator();
                          }
                          //error가 발생하게 될 경우 반환하게 되는 부분
                          else if (snapshot.hasError) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Error: ${snapshot.error}',
                                style: TextStyle(fontSize: 15),
                              ),
                            );
                          }
                          // 데이터를 정상적으로 받아오게 되면 다음 부분을 실행하게 되는 것이다.
                          else {
                            return Container(
                                width: 360.w,
                                height: 600.h,
                                child: ListView.builder(
                                    itemCount: results.length,
                                    itemBuilder: (BuildContext ctx, int idx) {
                                      return Post_Item(size, context,results[idx]);
                                    }
                                ));
                          }
                        })
                        : Container(
                        width: size.width * 1,
                        height: size.height * 0.7,
                        child: ListView(
                          children: [
                            InkWell(
                                onTap: () {},
                                child: Gym_Trainer_Item(size, context)),
                            Gym_Trainer_Item(size, context),
                          ],
                        )),
                  )


                ],
              )
                  //관리자모드 (센터로 로그인했을경우)
                  ),
            )
          ],
        ));
  }
}
