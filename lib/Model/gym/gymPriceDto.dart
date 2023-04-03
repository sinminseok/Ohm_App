
import 'dart:ffi';

class GymPriceDto{

  late int id;
  late String during;
  late String price;

  GymPriceDto(
      {required this.id, required this.during, required this.price});

  factory GymPriceDto.fromJson(Map<String, dynamic> json) {
    return GymPriceDto(

      id: json['id'],
      during: json['during'],
      price: json['price'],

    );
  }


}