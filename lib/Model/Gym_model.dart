import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Gym {
  int? id;
  String? Gym_name;
  String? location;

  Gym({this.id, this.Gym_name, this.location});

  factory Gym.fromJson(Map<String, dynamic> json) {
    return Gym(
      id: json['id'],
      Gym_name: json['carNumber'],
      location: json['location'],
    );
  }
}
