
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shopping_tool/Model/Post_model.dart';
import 'package:shopping_tool/Model/Trainer_model.dart';

import '../../Model/Gym_model.dart';
import 'package:http/http.dart' as http;
import '../../Utils/http_urls.dart';


class Http_Trainer with ChangeNotifier {



  Future<Trainer?> register_trainer(title,content,images) async {
    //url 로 post(이메일 컨트롤러 , 패스워드 컨트롤러)
    var res = await http.post(Uri.parse(Http_Url().search_gym),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'title': title}));

    //정상 로그인 http statuscode 200
    if (res.statusCode == 200) {
      Trainer.fromJson(json.decode(res.body));
    }
  }

  Future<Trainer?> delete_trainer(title,content,images) async {
    //url 로 post(이메일 컨트롤러 , 패스워드 컨트롤러)
    var res = await http.post(Uri.parse(Http_Url().search_gym),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'title': title}));

    //정상 로그인 http statuscode 200
    if (res.statusCode == 200) {
      Trainer.fromJson(json.decode(res.body));
    }
  }

  Future<Trainer?> update_trainer(title,content,images) async {
    //url 로 post(이메일 컨트롤러 , 패스워드 컨트롤러)
    var res = await http.post(Uri.parse(Http_Url().search_gym),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'title': title}));

    //정상 로그인 http statuscode 200
    if (res.statusCode == 200) {
      Trainer.fromJson(json.decode(res.body));
    }
  }


}