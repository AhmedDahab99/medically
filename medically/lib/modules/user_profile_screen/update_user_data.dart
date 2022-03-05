// import 'dart:io';
// import 'package:firebase_storage/firebase_storage.dart'; // For File Upload To Firestore
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart'; // For Image Picker
// import 'package:path/path.dart' as Path;
//
// class UpdateUserData extends StatefulWidget {
//   const UpdateUserData({Key key}) : super(key: key);
//
//   @override
//   _UpdateUserDataState createState() => _UpdateUserDataState();
// }
//
// class _UpdateUserDataState extends State<UpdateUserData> {
//   var _image;
//   String _uploadedFileURL;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Firestore File Upload'),
//       ),
//       body: Center(
//         child: Column(
//           children: <Widget>[
//             Text('Selected Image'),
//             _image != null
//                 ? Image.asset(
//               _image.path,
//               height: 150,
//             )
//                 : Container(height: 150),
//             _image == null
//                 ? RaisedButton(
//               child: Text('Choose File'),
//               onPressed: chooseFile,
//               color: Colors.cyan,
//             )
//                 : Container(),
//             _image != null
//                 ? RaisedButton(
//               child: Text('Clear Selection'),
//               onPressed: (){},
//             )
//                 : Container(),
//             Text('Uploaded Image'),
//             _uploadedFileURL != null
//                 ? Image.network(
//               _uploadedFileURL,
//               height: 150,
//             )
//                 : Container(),
//           ],
//         ),
//       ),
//     );
//   }
//   Future chooseFile() async {
//     await ImagePicker.platform.pickImage(source: ImageSource.gallery).then((value){
//       setState(() {
//         _image = value;
//       });
//     });
//   }
//
//   // Future uploadFile() async {
//   //   var storageReference = FirebaseStorage.instance
//   //       .ref()
//   //       .child('chats/${Path.basename(_image.path)}}');
//   //   StorageUploadTask uploadTask = storageReference.putFile(_image);
//   //   await uploadTask.onComplete;
//   //   print('File Uploaded');
//   //   storageReference.getDownloadURL().then((fileURL) {
//   //     setState(() {
//   //       _uploadedFileURL = fileURL;
//   //     });
//   //   });
//   // }
// }