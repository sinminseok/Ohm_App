import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shopping_tool/Manager/Controller/PostApiController.dart';
import 'package:shopping_tool/Manager/View/post/detail_views/post_write.dart';
import 'package:shopping_tool/Utils/constants.dart';

import '../../../Client/View/post/widgets/post_item.dart';
import '../../../Model/PostDto.dart';

class AdminPost extends StatefulWidget {
  const AdminPost({Key? key}) : super(key: key);

  @override
  _AdminPostState createState() => _AdminPostState();
}

class _AdminPostState extends State<AdminPost> {

  var results;

  Future<List<PostDto>?> load_posts()async{
    //gymId
    results =await PostApiController().findall_posts("2");
    return results;
  }


  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(height: 70,),
            InkWell(
                onTap: (){
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.fade,
                          child: Post_Write()));
                },
                child: Text("글쓰기")),

            InkWell(
                onTap: (){
                  PostApiController().findall_posts("2");

                },
                child: Text("글 불러오기")),
            FutureBuilder(
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
                }),

          ],
        ),
      ),
    );
  }
}

