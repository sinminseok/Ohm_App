import 'dart:convert';
import 'dart:io';
import 'package:http_parser/http_parser.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:shopping_tool/Model/dto/gymDto.dart';
import 'package:shopping_tool/Model/dto/postDto.dart';
import 'package:shopping_tool/Model/dto/postImgDto.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_tool/Model/dto/questionDto.dart';
import 'package:shopping_tool/Utils/http_urls.dart';
import 'package:shopping_tool/Utils/toast.dart';

import '../../Model/dto/answerDto.dart';

class QuestionApi with ChangeNotifier {
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

  Future<List<QuestionDto>> findall_question(String gymId) async {
    var res = await http.get(
      Uri.parse(Question_Url().findall + "${gymId}"),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      },
    );

    List<QuestionDto> questions = [];
    print(res);

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

      print(questions);

      return questions;
    } else {
      return [];
    }
  }
}
