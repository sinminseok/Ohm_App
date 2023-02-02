import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'PostImgDto.dart';

class Post {
  late String title;
  late String content;
  late List<PostImgDto> imgs;


  Post(
      {required this.title, required this.content, required this.imgs});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(

      title: json['title'],
      content: json['content'],
      imgs: json['imgs'],
    );
  }



}
