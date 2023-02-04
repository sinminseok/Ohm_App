import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:shopping_tool/Model/GymDto.dart';
import 'package:shopping_tool/Model/PostDto.dart';
import 'package:shopping_tool/Model/PostImgDto.dart';
import 'package:shopping_tool/Model/TrainerDto.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_tool/Model/requestDto/ManagerRequestDto.dart';
import 'package:shopping_tool/Utils/http_urls.dart';
import 'package:shopping_tool/Utils/toast.dart';

import '../../Client/Controller/http/http_gym.dart';

class PostApiController with ChangeNotifier {


  save_post(String title, String content, List<File> imageFileList,
      String gymId, String token) async {
    PostDto postDto = PostDto.makeDto(title, content);

    String postdto = jsonEncode(postDto);
    String messageRes = '';
    print(imageFileList);

    var request = new http.MultipartRequest(
        "POST", Uri.parse(PostApi_Url().save_post + "${gymId}"));

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    request.headers.addAll(headers);
    print("postdto == ");
    print(postdto.runtimeType);
    request.['PostDto'] = postdto;

    for (var imageFile in imageFileList) {
      request.files.add(
          await http.MultipartFile.fromPath('images', imageFile!.path)


      );
    }

   var res = await http.Response.fromStream(await request.send());
    print(res.statusCode);

    if (res.statusCode == 200) {
      messageRes = '200';
    } else {
      messageRes = '${res.statusCode} ${res.reasonPhrase}';
      print(messageRes);
    }
  }

  //Gym에 종속된 Post 모두 조회
  Future<List<PostDto>?> findall_posts(String gymId) async {
    var res = await http.get(
      Uri.parse(PostApi_Url().findall_bygymId + "${gymId}"),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      },
    );

    List<PostDto> posts = [];

    if (res.statusCode == 200) {
      final decodeData = utf8.decode(res.bodyBytes);
      final data = jsonDecode(decodeData);

      for (int i = 0; i < data.length; i++) {
        List<PostImgDto> imgs = [];

        for (int j = 0; j < data[i]['imgs'].length; j++) {
          imgs.add(PostImgDto.fromJson(data[i]['imgs'][j]));
        }
        posts.add(PostDto.fromJson(data[i], imgs));
      }

      return posts;
    } else {
      return null;
    }
  }

  //Gym에 종속된 Post 모두 조회
  Future<List<PostDto>?> find_post(String postId) async {
    var res = await http.get(
      Uri.parse(PostApi_Url().find_byId + "${postId}"),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      },
    );

    List<PostDto> posts = [];

    if (res.statusCode == 200) {
      final decodeData = utf8.decode(res.bodyBytes);
      final data = jsonDecode(decodeData);

      for (int i = 0; i < data.length; i++) {
        List<PostImgDto> imgs = [];

        for (int j = 0; j < data[i]['imgs'].length; j++) {
          imgs.add(PostImgDto.fromJson(data[i]['imgs'][j]));
        }
        posts.add(PostDto.fromJson(data[i], imgs));
      }

      return posts;
    } else {
      return null;
    }
  }
}
