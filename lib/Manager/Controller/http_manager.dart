import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shopping_tool/Model/TrainerDto.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_tool/Model/requestDto/ManagerRequestDto.dart';
import 'package:shopping_tool/Utils/http_urls.dart';
import 'package:shopping_tool/Utils/toast.dart';

class Http_Manager with ChangeNotifier {

  Future<TrainerDto?> getinfo_manager(String? id,String? token)async{
    var res = await http.get(Uri.parse(ManagerApi_Url().info_manager),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },);



    if (res.statusCode == 200) {

      final decodeData = utf8.decode(res.bodyBytes);
      final data = jsonDecode(decodeData);
      TrainerDto trainerDto = TrainerDto.fromJson(data);

      return trainerDto;
    }else{
      showtoast("ERROR");
      return null;
    }

  }


  Future<int?> register_manager(
      String id, String password, String nickname, String code) async {
    var res = await http.post(Uri.parse(ManagerApi_Url().save_manager),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
        body: json.encode({
          'password': password,
          'nickname': nickname,
          'code': code,
          'name': id,
        }));

    if (res.statusCode == 200) {
      final decodeData = utf8.decode(res.bodyBytes);
      final data = jsonDecode(decodeData);
      return data['id'];
    } else {
      showtoast("ERROR");
      return null;
    }
  }

  Future<String?> login_manager(
      String id, String password) async {
    var res = await http.post(Uri.parse(ManagerApi_Url().login_manager),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
        body: json.encode({
          'name': id,
          'password': password,

        }));

    if (res.statusCode == 200) {
      final decodeData = utf8.decode(res.bodyBytes);
      final data = jsonDecode(decodeData);
      print(data['token']);
      
      return data['token'];
    } else {
      showtoast("ERROR");
      return null;
    }
  }


}
