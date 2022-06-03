import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../Utils/constants.dart';

class Register_Post extends StatefulWidget {
  const Register_Post({Key? key}) : super(key: key);

  @override
  _Register_PostState createState() => _Register_PostState();
}

class _Register_PostState extends State<Register_Post> {
  final TextEditingController title_controller = TextEditingController();
  final TextEditingController context_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: kPrimaryColor,
        ),
        backgroundColor: kBackgroundColor,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50, bottom: 20),
              child: Center(
                child: SizedBox(
                    width: size.width * 0.9,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "글 제목",
                        border: OutlineInputBorder(),
                      ),
                      maxLines: 5, // <-- SEE HERE
                      minLines: 1, // <-- SEE HERE
                    )),
              ),
            ),
            SizedBox(
                width: size.width * 0.9,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "내용 작성",
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 5, // <-- SEE HERE
                  minLines: 1, // <-- SEE HERE
                )),
          ],
        ));
  }
}
