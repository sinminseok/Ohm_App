
import 'dart:core';
import 'dart:ffi';

class GymTimeDto{

  late int id;
  late String closeddays;
  late String sunday;
  late String saturday;
  late String weekday;
  late String holiday;



  GymTimeDto(
      {required this.id, required this.closeddays, required this.sunday,required this.saturday,required this.weekday,required this.holiday});

  factory GymTimeDto.fromJson(Map<String, dynamic> json) {
    return GymTimeDto(

      id: json['id'],
      closeddays: json['closeddays'],
      sunday: json['sunday'],
      saturday: json['saturday'],
      weekday: json['weekday'],
      holiday: json['holiday'],

    );
  }


}