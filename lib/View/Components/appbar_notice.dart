import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Appbar_notice extends StatefulWidget {

  final ScrollController scrollController;
  final List<Text> notice_text;

  Appbar_notice({required this.scrollController, required this.notice_text});

  @override
  _Appbar_noticeState createState() => _Appbar_noticeState();
}

class _Appbar_noticeState extends State<Appbar_notice> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height*0.1,
      child: ListView.builder(
          controller: widget.scrollController,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: widget.notice_text.length,
          itemBuilder: (context, index) {
        return Container(
          width: size.width*1,
          child: Center(
            child: widget.notice_text[index]
          ),
        );
      }),
    );
  }
}
