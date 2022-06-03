import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class User_token{
  final String? token;
  String? error;
  User_token({this.token,this.error});
  factory User_token.fromJson(Map<String, dynamic> json) {
    return User_token(
      token: json['token'],
    );
  }
}

class User{
  String? username;
  String? nickname;
  String? profile;

  User({this.username , this.nickname , this.profile});

  //json 맵핑
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      nickname: json['nickname'],
    );
  }

}
