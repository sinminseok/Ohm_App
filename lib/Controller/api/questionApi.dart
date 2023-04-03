import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_tool/Model/message/questionDto.dart';
import 'package:shopping_tool/Utils/sundry/http_urls.dart';
import 'package:shopping_tool/Utils/sundry/toast.dart';

import '../../Model/message/answerDto.dart';

class QuestionApi  {
  //question 저장
  Future<String?> save_question(String content, int? gymId) async {
    var res = await http.post(Uri.parse(Question_Url().save + "${gymId}"),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({'content': content}));

    if (res.statusCode == 200) {
      final decodeData = utf8.decode(res.bodyBytes);
      final data = jsonDecode(decodeData);

      return data.toString();
    } else {
      showtoast("ERRORR");
      return null;
    }
  }

  //모든 question조회
  Future<List<QuestionDto>> findall_question(String gymId) async {
    var res = await http.get(
      Uri.parse(Question_Url().findall + "${gymId}"),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      },
    );

    List<QuestionDto> questions = [];

    if (res.statusCode == 200) {
      final decodeData = utf8.decode(res.bodyBytes);
      final data = jsonDecode(decodeData);

      for (int i = 0; i < data.length; i++) {
        questions.add(QuestionDto.fromJson(
            data[i],
            data[i]['answer'] == null
                ? null
                : AnswerDto.fromJson(data[i]['answer'])));
      }


      return questions;
    } else {
      return [];
    }
  }
}
