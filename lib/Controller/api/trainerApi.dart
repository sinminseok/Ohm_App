import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_tool/Controller/api/gymApi.dart';
import 'package:shopping_tool/Utils/sundry/http_urls.dart';
import 'package:shopping_tool/Utils/sundry/toast.dart';

import '../../Model/manager/trainerDto.dart';

class TrainerApi  {

  Future<List<TrainerDto>> findall_trainer(String gymId)async{
    List<TrainerDto> trainers = [];
    var res = await http.get(Uri.parse(ManagerApi_Url().findall_trainer + "${gymId}"),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',

      },);

    if(res.statusCode == 200){
      final decodeData = utf8.decode(res.bodyBytes);
      final data = jsonDecode(decodeData);

      for(int i = 0 ; i<data.length;i++){
        trainers.add(TrainerDto.fromJson(data[i]));

      }

      return trainers;
    }else{
      return [];
    }
  }

}
