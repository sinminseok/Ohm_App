import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_tool/Controller/api/trainerApi.dart';
import 'package:shopping_tool/Model/dto/trainerDto.dart';
import 'package:shopping_tool/View/post/detail_views/trainer_detail.dart';
import 'package:shopping_tool/View/post/widgets/trainer_widget.dart';
import '../../Controller/api/postApi.dart';
import '../../Model/dto/postDto.dart';
import '../../../Utils/constants.dart';
import 'widgets/post_widget.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  _PostPage createState() => _PostPage();
}

class _PostPage extends State<PostPage> {
  String? admin_check_disk;
  bool? check_ontap = false;
  List<PostDto> posts = [];
  List<TrainerDto> trainers = [];
  Future? future_post;
  Future? future_trainer;

  Future<List<PostDto>?> load_posts() async {
    final prefs = await SharedPreferences.getInstance();
    int? gymId = prefs.getInt("gymId");
    //gymId
    if (gymId == null) {
      posts = [];
      return posts;
    } else {
      posts = (await PostApi().findall_posts(gymId.toString()))!;
      return posts;
    }
  }

  Future<List<TrainerDto>> load_trainers() async{
    final prefs = await SharedPreferences.getInstance();
    int? gymId = prefs.getInt("gymId");
    if (gymId == null) {
      trainers = [];
      return trainers;
    } else {
      trainers = (await TrainerApi().findall_trainer(gymId.toString()))!;
      return trainers;
    }
}

  @override
  void initState() {
    // TODO: implement initState
    future_trainer = load_trainers();
    future_post = load_posts();
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
                                        bottom:
                                            BorderSide(color: Colors.black)),
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
                    child: check_ontap == false
                        ? FutureBuilder(
                            future: future_post,
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              //해당 부분은 data를 아직 받아 오지 못했을때 실행되는 부분을 의미한다.
                              if (snapshot.hasData == false) {
                                return Center(child: Text("다니는 센터를 먼저 등록해주세요!",style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold),));
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
                                        itemCount: posts.length,
                                        itemBuilder:
                                            (BuildContext ctx, int idx) {
                                          return Post_Widget(
                                              size, context, posts[idx]);
                                        }));
                              }
                            })
                        : FutureBuilder(
                        future: future_trainer,
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          //해당 부분은 data를 아직 받아 오지 못했을때 실행되는 부분을 의미한다.
                          if (snapshot.hasData == false) {
                            return Center(child: Text("다니는 센터를 먼저 등록해주세요!",style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold),));
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
                                    itemCount: trainers.length,
                                    itemBuilder:
                                        (BuildContext ctx, int idx) {
                                      return Trainer_Widget(
                                          size, context, trainers[idx]);
                                    }));
                          }
                        })
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
