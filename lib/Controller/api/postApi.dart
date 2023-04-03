import 'dart:convert';
import 'dart:io';
import 'package:http_parser/http_parser.dart';
import 'package:dio/dio.dart';
import 'package:shopping_tool/Model/post/postDto.dart';
import 'package:shopping_tool/Model/post/postImgDto.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_tool/Utils/sundry/http_urls.dart';
import 'package:shopping_tool/Utils/sundry/toast.dart';

class PostApi {
  Future<String?> save_post(String title, String content,
      List<File> imageFileList, String gymId, String token) async {
    var res = await http.post(Uri.parse(PostApi_Url().save_post + "${gymId}"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: json.encode({'title': title, 'content': content}));

    if (res.statusCode == 200) {
      final decodeData = utf8.decode(res.bodyBytes);
      final data = jsonDecode(decodeData);
      return data.toString();
    } else {
      showtoast("ERRORR");
      return null;
    }
  }

  save_postimg(String postId, List<File> imageFileList, String token) async {
    FormData _formData;

    if (imageFileList.isNotEmpty) {
      final List<MultipartFile> _files = imageFileList
          .map((img) => MultipartFile.fromFileSync(img.path,
              contentType: MediaType("image", "jpg")))
          .toList();

      final baseOptions = BaseOptions(
        headers: {
          'Content-Type': 'multipart/form-data',
          'Authorization': 'Bearer $token'
        },

      );
      Dio dio = Dio(baseOptions);

      _formData = FormData.fromMap({
        "images": _files,
      });

      var res = await dio.post(PostApi_Url().save_postimgs + "${postId}",
          data: _formData);
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

      for (int i = 0; i < data['content'].length; i++) {
        List<PostImgDto> imgs = [];

        for (int j = 0; j < data['content'][i]['imgs'].length; j++) {
          imgs.add(PostImgDto.fromJson(data['content'][i]['imgs'][j]));
        }
        posts.add(PostDto.fromJson(data['content'][i], imgs));
      }

      return posts;
    } else {
      return null;
    }
  }

  //Post 단일 조회
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
