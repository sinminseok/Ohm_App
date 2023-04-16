import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shopping_tool/Model/gym/gymPriceDto.dart';
import 'package:shopping_tool/Model/gym/gymTimeDto.dart';
import 'package:shopping_tool/Model/statistic/statisticsDto.dart';
import 'package:shopping_tool/Utils/sundry/toast.dart';

import '../../Model/gym/gymDto.dart';
import '../../Utils/sundry/http_urls.dart';
import 'package:http/http.dart' as http;

import '../../Model/gym/gymImgDto.dart';


class GymApi {

  Future<List<GymDto>?> search_allgym() async {

    var res = await http.get(
      Uri.parse(GymApi_Url().findall),
      headers: {'Content-Type': 'application/json'},
    );


    List<GymDto> result = [];


    if (res.statusCode == 200) {
      final decodeData = utf8.decode(res.bodyBytes);
      final data = jsonDecode(decodeData);
      print(data.length);
      for (int i = 0; i < data.length; i++) {
        print(data[i]);
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

  Future<String?> current_count(String gymId,BuildContext context)async{

    var res = await http.get(
      Uri.parse(GymApi_Url().current_count + "${gymId}"),
      headers: {'Content-Type': 'application/json'},
    );
    print(res);

    if (res.statusCode == 200) {
      final decodeData = utf8.decode(res.bodyBytes);
      final data = jsonDecode(decodeData);


      return data.toString();
    } else {


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
    //url 로 gymInfo(이메일 컨트롤러 , 패스워드 컨트롤러)
    var res = await http.get(
      Uri.parse(GymApi_Url().find_byName + "${gym_name}"),
      headers: {'Content-Type': 'application/json'},
    );


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


  Future<GymTimeDto?> get_gymtime(String gymId)async{
    var res = await http.get(
      Uri.parse(GymApi_Url().get_gymTime + "${gymId}"),
      headers: {'Content-Type': 'application/json'},
    );
    if (res.statusCode == 200) {
      final decodeData = utf8.decode(res.bodyBytes);
      final data = jsonDecode(decodeData);
      GymTimeDto gymTimeDto = GymTimeDto.fromJson(data);

      return gymTimeDto;
    } else {

      return null;
    }

  }

  Future<StatisticsDto?> get_timeavg(String gymId)async{


    var res = await http.get(
      Uri.parse(GymApi_Url().time_avg + "${gymId}"),
      headers: {'Content-Type': 'application/json'},
    );
    if (res.statusCode == 200) {
      final decodeData = utf8.decode(res.bodyBytes);
      final data = jsonDecode(decodeData);
      print(data);
     var statisticsDto = StatisticsDto.fromJson(data);

      return statisticsDto;
    } else {

      return null;
    }

  }

  Future<List<GymPriceDto>?> get_gymprices(String gymId)async{
    List<GymPriceDto> prices = [];
    var res = await http.get(
      Uri.parse(GymApi_Url().get_gymPrice + "${gymId}"),
      headers: {'Content-Type': 'application/json'},
    );
    if (res.statusCode == 200) {
      final decodeData = utf8.decode(res.bodyBytes);
      final data = jsonDecode(decodeData);

      for(int i=0; i< data.length;i++){
        prices.add(GymPriceDto.fromJson(data[i]));
      }

      return prices;
    } else {

      return null;
    }

  }



}
