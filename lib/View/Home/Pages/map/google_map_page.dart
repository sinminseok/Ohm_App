import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shopping_tool/Utils/constants.dart';
import 'package:shopping_tool/Utils/toast.dart';

import '../../../../Presenter/provider/providers.dart';

class Google_Map_Page extends StatefulWidget {
  const Google_Map_Page({Key? key}) : super(key: key);

  @override
  _Google_Map_PageState createState() => _Google_Map_PageState();
}

class _Google_Map_PageState extends State<Google_Map_Page> {
  CameraPosition? move_position;
  Position? current_position;
  List<Marker?> _markers = [];

  Future<Position> getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    print(position.latitude); // 위도
    print(position.longitude); //경도=

    current_position = position;

    _markers.add(Marker(
        markerId: MarkerId("1"),
        draggable: true,
        onTap: () => print("Marker!"),
        position:
            LatLng(current_position!.latitude, current_position!.longitude)));

    return position;
  }

  late LatLng currentLatLng =
      LatLng(current_position!.latitude, current_position!.longitude);
  final Completer<GoogleMapController> _controller = Completer();

  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    Position position = await Geolocator.getCurrentPosition();
    setState(() {
      currentLatLng = LatLng(position.latitude, position.longitude);
    });
  }

  @override
  void initState() {
   // func();
    super.initState();
  }
  func()async{
    _goToCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        elevation: 0,
        iconTheme: IconThemeData(
            color: Colors.black
        ),
        title: Text("지도에서 위치 지정",style: TextStyle(color: Colors.black,fontFamily: "boldfont"),),
        actions: [
          Column(
            children: [
              SizedBox(height: size.height*0.017,),
              InkWell(
                onTap: ()async{

                  var return_value =await Provider.of<Providers>(context, listen: false)
                      .get_user_position(move_position!.target.latitude,move_position!.target.longitude);
                  if(return_value == true){
                    Navigator.pop(context);
                  }else{
                    return showtoast("에러");
                  }
                  // print(return_value);
                  },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("위치 지정",style: TextStyle(color: Colors.grey,fontFamily: "boldfont"),),
                ),
              ),
            ],
          )
        ],
      ),
      body: Column(
          children: [

            FutureBuilder(
                future: getCurrentLocation(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  //데이터 못 불러왔을때
                  if (snapshot.hasData == false) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Error: ${snapshot.error}',
                        style: TextStyle(fontSize: 15),
                      ),
                    );
                  } else {
                    //GoogleMap
                    return Container(
                      height: size.height * 0.85,
                      child: Stack(
                        children: [
                          GoogleMap(
                            zoomGesturesEnabled:true,
                            //tiltGesturesEnabled:false,
                            onCameraMove: ((_position) =>
                                _updatePosition(_position)),
                            myLocationEnabled: true,
                            mapType: MapType.normal,
                            initialCameraPosition:
                            //CameraPosition(target: LatLng(22.54481,88.312312), zoom: 11),
                            CameraPosition(target: currentLatLng, zoom: 15),
                            onMapCreated: (GoogleMapController controller) {
                              _controller.complete(controller);
                            },
                            markers: Set.from(_markers),
                          ),


                        ],
                      )
                    );
                  }
                }),
          ],
        ),


    );
  }

  void _updatePosition(CameraPosition _position) {
    var m = _markers.firstWhere((p) => p?.markerId == MarkerId('1'),
        orElse: () => null);
    _markers.remove(m);
    _markers.add(
      Marker(
        markerId: MarkerId('1'),
        position: LatLng(_position.target.latitude, _position.target.longitude),
        draggable: true,
      ),
    );

    setState(() {
      move_position = _position;
    });
  }

  Future<void> _goToCurrentLocation() async {
    await _determinePosition();
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: currentLatLng, zoom: 5)));
  }
}
