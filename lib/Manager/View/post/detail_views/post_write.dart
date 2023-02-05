
import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_tool/Utils/http_urls.dart';

import '../../../../Utils/constants.dart';
import '../../../../Utils/permission.dart';
import '../../../Controller/PostApiController.dart';

class Post_Write extends StatefulWidget {
  const Post_Write({Key? key}) : super(key: key);

  @override
  _Post_WriteState createState() => _Post_WriteState();
}

class _Post_WriteState extends State<Post_Write> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _contentController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  var image_picked;
  PickedFile? _image;
  var imim;
  List<File> imageFileList = [];




  Future getImageFromGallery() async {
    // for gallery
    image_picked =
    await ImagePicker.platform.pickImage(source: ImageSource.gallery);
    if(mounted){
      setState(() {
        _image = image_picked!;
      });
    }

    imim = convert_img();

  }

  //이미지 Uint8 변환 함수
  convert_img() async {
    Uint8List test = await _image!.readAsBytes();
    imim = test;
    return test;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: kBackgroundColor,
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "글 작성",
                style: TextStyle(fontSize: 30),
              ),
              InkWell(
                  onTap: (){
                    Permission_handler().requestCameraPermission(context);
                    getImageFromGallery();
                  },
                  child: Text("이미지 선택")),

              Container(
                height: size.height * 0.35,
                width: size.width * 1,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.white12,
                      style: BorderStyle.solid,
                      width: 0),
                ),
                child: Center(
                  child: image_picked == null
                      ? Image.asset(
                    "assets/images/photo_null_image.png",
                    width: size.width * 0.6,
                  )
                      : Container(
                    height: size.height*0.35,
                    width: size.width*0.7,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.file(
                        File(image_picked!.path),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height*0.05,),
              Container(
                  height: size.height * 0.08,
                  child: TextField(
                      maxLines: 10,
                      textInputAction: TextInputAction.done,
                      controller: _titleController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 20, top: 20),
                        hintText: "글 제목",
                        hintStyle:
                        TextStyle(fontFamily: "gilogfont", fontSize: 21),
                        border: InputBorder.none,
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(top: 10.0, right: 10),
                        ),
                      ))),
              Container(
                  height: size.height * 0.08,
                  child: TextField(
                      maxLines: 10,
                      textInputAction: TextInputAction.done,
                      controller: _contentController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 20, top: 20),
                        hintText: "내용...",
                        hintStyle:
                        TextStyle(fontFamily: "gilogfont", fontSize: 21),
                        border: InputBorder.none,
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(top: 10.0, right: 10),
                        ),
                      ))),
              InkWell(
                  onTap: ()async{
                    final prefs = await SharedPreferences.getInstance();
                    print(prefs.getString("token"));
                    imageFileList.add(File(_image!.path));
                    var save_post =await PostApiController().save_post(_titleController.text,_contentController.text,imageFileList,"2",prefs.getString("token").toString());
                    print(save_post.runtimeType);
                    PostApiController().save_postimg(save_post.toString(), imageFileList, prefs.getString("token").toString());
                  },
                  child: Text("글 작성 클릭!"))

            ],
          ),
        ));
  }
}
