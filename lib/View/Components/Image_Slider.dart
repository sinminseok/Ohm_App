import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Image_Slier extends StatefulWidget {
  final String? slideImage;

  Image_Slier({required this.slideImage});

  @override
  _Image_SlierState createState() => _Image_SlierState();
}

class _Image_SlierState extends State<Image_Slier> {


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(padding: const EdgeInsets.all(3.0),
        child: Container(
            height: size.height*0.3,
            child: Image.asset("${widget.slideImage}",fit: BoxFit.scaleDown,),

    ),);


  }
}
