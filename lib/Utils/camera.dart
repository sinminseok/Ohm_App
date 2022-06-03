// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:shopping_tool/Utils/constants.dart';
//
// class Camera{
//
//   // 카메라로 찍거나 갤러리에서 가져온 사진 컨트롤하기 위한 변수
//   PickedFile? _imageFile; // 카메라/갤러리에서 사진 가져올 때 사용함 (image_picker)
//   final ImagePicker _picker = ImagePicker(); // 카메라/갤러리에서 사진 가져올 때 사용함 (image_picker)
//
//
//   Widget imageProfile(context) {
//     return Center(
//       child: Stack(
//         children: <Widget>[
//           CircleAvatar(
//             radius: 80,
//             backgroundImage: FileImage(File(_imageFile!.path)),
//           ),
//           Positioned(
//               bottom: 20,
//               right: 20,
//               child: InkWell(
//                 onTap: () {
//                   // 클릭시 모달 팝업을 띄워준다.
//                   showModalBottomSheet(context: context, builder: ((builder) => bottomSheet(context)));
//                 },
//                 child: Icon(
//                   Icons.camera_alt,
//                   color: kPrimaryColor,
//                   size: 40,
//                 ),
//               )
//           )
//         ],
//       ),
//     );
//   }
//
//   // 카메라 아이콘 클릭시 띄울 모달 팝업
//   Widget bottomSheet(context) {
//     return Container(
//         height: 100,
//         width: MediaQuery.of(context).size.width,
//         margin: EdgeInsets.symmetric(
//             horizontal: 20,
//             vertical: 20
//         ),
//         child: Column(
//           children: <Widget>[
//             Text(
//               'Choose Profile photo',
//               style: TextStyle(
//                 fontSize: 20,
//               ),
//             ),
//             SizedBox(height: 20,),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 FlatButton.icon(
//                   icon: Icon(Icons.camera, size: 50,),
//                   onPressed: () {
//                     takePhoto(ImageSource.camera);
//                   },
//                   label: Text('Camera', style: TextStyle(fontSize: 20),),
//                 ),
//                 FlatButton.icon(
//                   icon: Icon(Icons.photo_library, size: 50,),
//                   onPressed: () {
//                     takePhoto(ImageSource.gallery);
//                   },
//                   label: Text('Gallery', style: TextStyle(fontSize: 20),),
//                 )
//               ],
//             )
//           ],
//         )
//     );
//   }
//
//
// }