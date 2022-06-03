import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Trainer {
  int? id;
  String? name;
  String? information;

  Trainer({this.id, this.name, this.information});

  factory Trainer.fromJson(Map<String, dynamic> json) {
    return Trainer(
      id: json['id'],
      name: json['name'],
      information: json['information'],
    );
  }
}
