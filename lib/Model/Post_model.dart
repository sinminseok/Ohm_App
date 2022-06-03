import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Post {
  int? id;
  String? title;
  String? content;

  Post({this.id, this.title, this.content});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      content: json['content'],
    );
  }
}
