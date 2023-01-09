import 'package:latlong2/latlong.dart';



calculate_distance(){
  final Distance distance = Distance();

// km = 423
  final double km = distance.as(LengthUnit.Kilometer,
      LatLng(52.518611, 13.408056), LatLng(51.519475, 7.46694444));

  print(km);

  return km;
}