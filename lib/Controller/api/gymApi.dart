import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shopping_tool/Utils/toast.dart';

import '../../Model/dto/gymDto.dart';
import '../../Model/dto/gymImgDto.dart';
import '../../../../Utils/http_urls.dart';
import 'package:http/http.dart' as http;


class GymApi with ChangeNotifier {
  String? _gym_name;

  String? get gym_name => _gym_name;

  Future<List<GymDto>?> search_allgym() async {

    var res = await http.get(
      Uri.parse(GymApi_Url().findall),
      headers: {'Content-Type': 'application/json'},
    );


    List<GymDto> result = [];


    if (res.statusCode == 200) {
      final decodeData = utf8.decode(res.bodyBytes);
      final data = jsonDecode(decodeData);
      for (int i = 0; i < data.length; i++) {
        List<GymImgDto> imgs = [];
        for(int j=0;j<data[i]['imgs'].length;j++){
          imgs.add(GymImgDto.fromJson(data[i]['imgs'][j]));
        }

        result.add(GymDto.fromJson(data[i],imgs));
      }

      return result;
    }else{
      showtoast("ERROR");
      return null;
    }
  }



    Future<GymDto?> search_byId(int gymId) async{
    var res = await http.get(
      Uri.parse(GymApi_Url().find_byId + "${gymId}"),
      headers: {'Content-Type': 'application/json'},
    );


    if(res.statusCode == 200){
      List<GymImgDto> imgs = [];

      final decodeData = utf8.decode(res.bodyBytes);
      final data = jsonDecode(decodeData);
      for(int i=0; i<data['imgs'].length;i++){
        imgs.add(GymImgDto.fromJson(data['imgs'][i]));
      }

      return GymDto.fromJson(data, imgs);
    }else{
      showtoast("ERROR");
      return null;
    }
  }


  Future<List<GymDto>> search_byname(gym_name) async {
    //url 로 post(이메일 컨트롤러 , 패스워드 컨트롤러)
    var res = await http.get(
      Uri.parse(GymApi_Url().find_byName + "${gym_name}"),
      headers: {'Content-Type': 'application/json'},
    );
    print(res.statusCode);


    List<GymDto> result = [];


    var gymDto;
    //정상 로그인 http statuscode 200
    if (res.statusCode == 200) {
      final decodeData = utf8.decode(res.bodyBytes);
      final data = jsonDecode(decodeData);
      for (int i = 0; i < data.length; i++) {
        List<GymImgDto> imgs = [];
        for(int j=0;j<data[i]['imgs'].length;j++){
          imgs.add(GymImgDto.fromJson(data[i]['imgs'][j]));
        }
        result.add(GymDto.fromJson(data[i],imgs));
      }
      print(result);
      return result;
    } else {

      showtoast("ERROR");
      return gymDto;
    }
  }
}
