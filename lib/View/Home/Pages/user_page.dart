import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_tool/Presenter/provider/providers.dart';
import 'package:shopping_tool/Utils/constants.dart';

class User_page extends StatefulWidget {
  const User_page({Key? key}) : super(key: key);

  @override
  _User_pageState createState() => _User_pageState();
}

class _User_pageState extends State<User_page> {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: kBackgroundColor,
        body: Stack(
          children: [
            Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    SizedBox(height: size.height*0.07,),
                    InkWell(
                      onTap: ()async{

                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white38,
                          border: Border(
                              bottom: BorderSide(
                                color: Colors.grey,
                              )),
                        ),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0.0)),
                          selectedTileColor: Colors.grey[200],
                          leading: Icon(Icons.home_work_outlined),
                          title: Text('서비스 문의하기'),
                        ),
                      ),
                    ),
                    // InkWell(
                    //   onTap: ()async{
                    //     Navigator.pushNamed(context, '/center_login');
                    //     Provider.of<Providers>(context,listen: false).change_admin_authority();
                    //   },
                    //   child: Container(
                    //     decoration: BoxDecoration(
                    //       color: Colors.white38,
                    //       border: Border(
                    //           bottom: BorderSide(
                    //             color: Colors.grey,
                    //           )),
                    //     ),
                    //     child: ListTile(
                    //       shape: RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(0.0)),
                    //       selectedTileColor: Colors.grey[200],
                    //       leading: Icon(Icons.home_work_outlined),
                    //       title: Text('센터 로그인 및 회원가입 하러가기'),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(height: size.height*0.1,),
                    InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, '/useage');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white38,
                          border: Border(
                              bottom: BorderSide(
                                color: Colors.grey,
                              )),
                        ),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0.0)),
                          selectedTileColor: Colors.grey[200],
                          title: Text('이용방법'),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, '/service_center');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white38,
                          border: Border(
                              bottom: BorderSide(
                                color: Colors.grey,
                              )),
                        ),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0.0)),
                          selectedTileColor: Colors.grey[200],
                          title: Text('고객센터'),
                        ),
                      ),
                    ),

                    Column(
                      children: [
                        SizedBox(height: size.height*0.1,),
                        Text("고객센터"),
                        Text("01091741764"),
                        SizedBox(height: size.height*0.14,),
                        Text("(주)코무무 | komumu" , style: TextStyle(color: Colors.black38),),
                        Text("@Copyright 신민석,김영솔",  style: TextStyle(color: Colors.black38),)



                      ],
                    ),



                  ],
                ))
          ],
        ));
  }
}
