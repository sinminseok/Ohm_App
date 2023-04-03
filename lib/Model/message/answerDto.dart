import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../post/postImgDto.dart';

class AnswerDto {
  late int id;
  late String content;



  AnswerDto(
      {required this.id,required this.content});


  factory AnswerDto.fromJson(Map<String, dynamic> json) {
    return AnswerDto(

      id: json['id'],
      content: json['content'],
    );
  }




}