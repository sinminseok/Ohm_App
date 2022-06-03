import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import '../../../../Utils/constants.dart';

class Register_Pt extends StatefulWidget {
  const Register_Pt({Key? key}) : super(key: key);

  @override
  _Register_Pt createState() => _Register_Pt();
}

class _Register_Pt extends State<Register_Pt> {
  PickedFile? _imageFile; // 카메라/갤러리에서 사진 가져올 때 사용함 (image_picker)
  final ImagePicker _picker =
      ImagePicker(); // 카메라/갤러리에서 사진 가져올 때 사용함 (image_picker)

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
            SizedBox(
              height: size.height * 0.1,
            ),
            Stack(
              children: [
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(10)),
                    width: size.width * 0.9,
                    height: size.height * 0.7,
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.04,
                    ),
                    imageProfile(size),
                    SizedBox(
                      height: size.height * 0.04,
                    ),
                    Center(
                      child: SizedBox(
                          width: size.width * 0.8,
                          child: TextField(
                            decoration: InputDecoration(
                              focusedBorder: InputBorder.none,
                              contentPadding: EdgeInsets.only(
                                  left: size.width * 0.26,
                                  top: size.height * 0.0167),
                              hintText: "트레이너 이름",
                              border: OutlineInputBorder(),
                            ),
                            maxLines: 5, // <-- SEE HERE
                            minLines: 1, // <-- SEE HERE
                          )),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    SizedBox(
                        width: size.width * 0.8,
                        child: TextField(
                          decoration: InputDecoration(
                            focusedBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                                left: size.width * 0.26,
                                top: size.height * 0.0167),
                            hintText: "트레이너 소개",
                            border: OutlineInputBorder(),
                          ),
                          maxLines: 5, // <-- SEE HERE
                          minLines: 1, // <-- SEE HERE
                        )),
                  ],
                )
              ],
            ),
          ],
        ));
  }

  Widget imageProfile(Size size) {
    return Center(
      child: Stack(
        children: <Widget>[
          _imageFile == null
              ? CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage("assets/images/user.jpg"))
              : CircleAvatar(
                  radius: 80,
                  backgroundImage: FileImage(File(_imageFile!.path))),
          Container(
            child: Positioned(
                bottom: size.height * 0.01,
                right: size.width * 0.008,
                child: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: ((builder) => bottomSheet()));
                  },
                  child: Icon(
                    Icons.camera_alt,
                    color: Colors.black,
                    size: 40,
                  ),
                )),
          )
        ],
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: <Widget>[
            Text(
              'Choose Profile photo',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FlatButton.icon(
                  icon: Icon(
                    Icons.camera,
                    size: 50,
                  ),
                  onPressed: () {
                    takePhoto(ImageSource.camera);
                  },
                  label: Text(
                    'Camera',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                FlatButton.icon(
                  icon: Icon(
                    Icons.photo_library,
                    size: 50,
                  ),
                  onPressed: () {
                    takePhoto(ImageSource.gallery);
                  },
                  label: Text(
                    'Gallery',
                    style: TextStyle(fontSize: 20),
                  ),
                )
              ],
            )
          ],
        ));
  }

  takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(source: source);
    setState(() {
      _imageFile = pickedFile;
    });
  }
}
