import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;


class Http_Trainer with ChangeNotifier {



  // Future<?> register_trainer(title,content,images) async {
  //   //url 로 post(이메일 컨트롤러 , 패스워드 컨트롤러)
  //   var res = await http.post(Uri.parse(ManagerApi_Url().),
  //       headers: {'Content-Type': 'application/json'},
  //       body: json.encode({'title': title}));
  //
  //   //정상 로그인 http statuscode 200
  //   if (res.statusCode == 200) {
  //     Trainer.fromJson(json.decode(res.body));
  //   }
  // }


}