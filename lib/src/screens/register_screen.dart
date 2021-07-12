import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _RegisterScreenState();
  }
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Register',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextField(
              onChanged: (text) {
                setState(() {});
              },
              decoration: InputDecoration(labelText: 'UserName'),
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
            TextField(
              onChanged: (text) {
                setState(() {});
              },
              obscureText: true,
              decoration: InputDecoration(labelText: 'PassWord'),
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
            TextField(
              onChanged: (text) {
                setState(() {});
              },
              obscureText: true,
              decoration: InputDecoration(labelText: 'Confirm PassWord'),
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
                      // Navigator.pop(context);
                    },
                    child: const Text('Register'),
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
