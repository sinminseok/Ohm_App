import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:page_transition/page_transition.dart';

import '../Pages/search_pages/gym_detail_page.dart';


class Search_Model extends StatelessWidget {
  Size size;
  Search_Model({required this.size});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.fade,
                child: Gym_Detail_Page()));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.9),
                  spreadRadius: 3,
                  blurRadius: 3,
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ],
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Column(
            children: [
              Container(
                  height: size.height * 0.3,
                  width: size.width * 0.9,
                  child:ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      "assets/images/gym_img.png",
                      fit: BoxFit.cover,
                    )
                  ),
              ),
              Container(
                height: size.height * 0.13,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "비나이더 안산점",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "10km",
                            style: TextStyle(fontSize: 19),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "렉5개",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "1개월 30000원",
                            style: TextStyle(
                                fontFamily: "boldfont", fontSize: 21),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
