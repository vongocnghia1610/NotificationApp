// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:intl/intl.dart';

class EditNotificationScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _EditNotificationScreenState();
  }
}

class _EditNotificationScreenState extends State<EditNotificationScreen> {
  String title = "";
  String subTitle = "";
  TextEditingController date = TextEditingController();
  int check = 1;
  final _picker = ImagePicker();
  File file = File("");
  DateTime datetime = DateTime.now();
  TextEditingController _datetimeController = TextEditingController();

  _imgFromCamera() async {
    PickedFile? image =
        await _picker.getImage(source: ImageSource.camera, imageQuality: 50);

    setState(() {
      check = 2;
      file = File(image!.path);
    });
  }

  _imgFromGallery() async {
    PickedFile? image =
        await _picker.getImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      check = 2;
      file = File(image!.path);
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    check = 1;
    datetime = DateTime.now();
    _datetimeController.text = '$datetime';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit notification',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 30),
            Center(
              child: GestureDetector(
                onTap: () {
                  _showPicker(context);
                },
                child: CircleAvatar(
                  radius: 55,
                  backgroundColor: Color(0xffFDCF09),
                  child: check == 2
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.file(
                            file,
                            width: 150,
                            height: 150,
                            fit: BoxFit.fill,
                          ),
                        )
                      : Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(50)),
                          width: 150,
                          height: 150,
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.grey[800],
                          ),
                        ),
                ),
              ),
            ),
            TextField(
              onChanged: (text) {
                setState(() {
                  title = text.trim();
                });
              },
              decoration: InputDecoration(labelText: 'Title'),
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
            TextField(
              onChanged: (text) {
                setState(() {
                  subTitle = text.trim();
                });
              },
              decoration: InputDecoration(labelText: 'SubTitle'),
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
            // SizedBox(
            //   height: 20,
            // ),
            // GestureDetector(
            //   onTap: () async {
            //     await FirebaseFirestore.instance.collection('todos').add({
            //       "title": title,
            //       "subTitle": subTitle,
            //       "status": "DOING",
            //       "createdAt": DateTime.now(),
            //     });
            //     // Navigator.of(context).pop();
            //     Navigator.pop(context);
            //   },
            //   child: Container(
            //     padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            //     decoration: BoxDecoration(
            //         image: DecorationImage(
            //             image: NetworkImage(
            //                 'https://duhocvietglobal.com/wp-content/uploads/2018/12/dat-nuoc-va-con-nguoi-anh-quoc.jpg'),
            //             fit: BoxFit.cover),
            //         color: Colors.blue,
            //         border: Border.all(color: Colors.yellow, width: 2),
            //         borderRadius: BorderRadius.circular(5)),
            //     child: Text(
            //       'Add Task',
            //       style: TextStyle(fontSize: 20, color: Colors.red),
            //     ),
            //   ),
            // ),

            TextField(
              controller: _datetimeController,
              onChanged: (text) {
                setState(() {});
              },
              enabled: false,
              decoration: InputDecoration(labelText: 'DateTime'),
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
            // Text('$datetime'),

            TextButton(
                onPressed: () {
                  DatePicker.showDateTimePicker(context, showTitleActions: true,
                      onConfirm: (date) {
                    setState(() {
                      datetime = date;
                      _datetimeController.text = '$datetime';
                    });
                  }, currentTime: DateTime.now(), locale: LocaleType.vi);
                },
                child: Text(
                  'Set DateTime for NOTIFICATION',
                  style: TextStyle(color: Colors.blue),
                )),
            SizedBox(
              height: 20,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Stack(
                children: <Widget>[
                  Positioned.fill(
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[
                            Color(0xFF0D47A1),
                            Color(0xFF1976D2),
                            Color(0xFF42A5F5),
                          ],
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(16.0),
                      primary: Colors.white,
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                    onPressed: () async {
                      // await FirebaseFirestore.instance.collection('todos').add({
                      //   "title": title,
                      //   "subTitle": subTitle,
                      //   "status": "DOING",
                      //   "createAt": DateTime.now(),
                      // });
                      // Navigator.pop(context);
                    },
                    child: const Text('Edit Task'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
