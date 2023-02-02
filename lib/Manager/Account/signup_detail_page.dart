import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shopping_tool/Utils/toast.dart';
import '../../Client/View/frame/frame_page.dart';
import '../../Utils/constants.dart';
import '../../Utils/permission.dart';
import 'package:image_picker/image_picker.dart';

class Signup_Detail_page extends StatefulWidget {
  const Signup_Detail_page({Key? key}) : super(key: key);

  @override
  _Signup_Detail_page createState() => _Signup_Detail_page();
}

class _Signup_Detail_page extends State<Signup_Detail_page>
    with SingleTickerProviderStateMixin {
  final TextEditingController _userIDController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _checkpasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    PickedFile? _image;
    var imim;
    double defaultLoginSize = size.height - (size.height * 0.2);
    //이미지 Uint8 변환 함수
    convert_img() async {
      Uint8List test = await _image!.readAsBytes();
      imim = test;
      return test;
    }

    //이미지 선택 함수
    Future getImageFromGallery() async {
      // for gallery
      var image =
          await ImagePicker.platform.pickImage(source: ImageSource.gallery);
      setState(() {
        _image = image!;
      });
      imim = convert_img();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Scaffold(
            body: Align(
              alignment: Alignment.topCenter,
              child: Container(
                color: kBackgroundColor,
                width: size.width,
                height: size.height * 1,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: size.height * 0.1),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: size.height * 0.34,
                          width: size.width * 1,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.white12,
                                style: BorderStyle.solid,
                                width: 0),
                          ),
                          child: Container(
                            width: size.width * 0.5,
                            height: size.height * 0.3,
                            child: Center(
                              child: _image == null
                                  ? Column(
                                      children: [
                                        Text(
                                          "No Image",
                                          style: TextStyle(
                                              fontFamily: "boldfont",
                                              fontSize: 21),
                                        ),
                                        Icon(
                                          Icons.camera_alt,
                                          size: 70,
                                        ),
                                      ],
                                    )
                                  : Image.file(
                                      File(_image!.path),
                                      height: size.height * 0.34,
                                      width: size.width * 1,
                                      fit: BoxFit.fitWidth,
                                    ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          Permission_handler().requestCameraPermission(context);
                          getImageFromGallery();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 2), // changes position of shadow
                                ),
                              ],
                              color: kPrimaryColor),
                          width: size.width * 0.3,
                          height: size.height * 0.05,
                          child: Center(
                              child: Text(
                            "사진 선택",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "numberfont",
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          if (_passwordController != _checkpasswordController) {
                            showtoast("비밀번호가 일치하지 않습니다");
                          }
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.fade,
                                  child: FramePage()));
                        },
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          width: size.width * 0.8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: kPrimaryColor,
                          ),
                          padding: EdgeInsets.symmetric(vertical: 20),
                          alignment: Alignment.center,
                          child: Text(
                            "등록완료",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      Container(
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/center_login');
                          },
                          child: Text(
                            "로그인 페이지로 이동",
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
