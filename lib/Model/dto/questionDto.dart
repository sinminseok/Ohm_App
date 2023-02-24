import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'answerDto.dart';
import 'postImgDto.dart';

class QuestionDto {
  late int id;
  late String content;
  AnswerDto? answerDto;


  QuestionDto(
      {required this.id,required this.content,required this.answerDto});


  factory QuestionDto.fromJson(Map<String, dynamic> json,AnswerDto? answerDto) {
    return QuestionDto(
      id: json['id'],
      answerDto:answerDto,
      content: json['content'],
    );
  }




}