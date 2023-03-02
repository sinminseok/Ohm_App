import 'dart:ffi';

import 'package:shopping_tool/Model/dto/gymDto.dart';

class TrainerDto {
  late int id;


  late String profile;

  late String oneline_introduce;

  late String position;

  //자기소개
  late String introduce;

  late String nickname;



  TrainerDto(
      {
        required this.position,
      required this.id,
      required this.profile,
      required this.oneline_introduce,
      required this.introduce,
      required this.nickname,});

  factory TrainerDto.fromJson(Map<String, dynamic> json) {
    return TrainerDto(
      position: json['position'],
      id: json['id'],
      profile: json['profile'],
      oneline_introduce: json['oneline_introduce'],
      introduce: json['introduce'],
      nickname: json['nickname'],
    );
  }
}
