import 'package:appnhaclich/src/screens/create_notification_screen.dart';
import 'package:appnhaclich/src/screens/edit_notification_screen.dart';
import 'package:appnhaclich/src/widgets/notification_card.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_todolist/src/screens/create_todo_screen.dart';
// import 'package:flutter_todolist/src/screens/history_screen.dart';
// import 'package:flutter_todolist/src/widgets/todo_cart.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CreateNotificationScreen())),
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 20.0,
        ),
        backgroundColor: Colors.blueAccent,
      ),
      appBar: AppBar(
        // actions: [
        //   IconButton(
        //       onPressed: () => Navigator.of(context).push(
        //           MaterialPageRoute(builder: (context) => HistoryScreen())),
        //       icon: Icon(
        //         Icons.lock_clock,
        //         color: Colors.white,
        //         size: 20.0,
        //       ))
        // ],
        title: Text(
          'Todolist',
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(5.0),
        child: StreamBuilder(
          // stream: FirebaseFirestore.instance
          //     .collection('todos')
          //     .where('status', isEqualTo: 'DOING')
          //     .snapshots(),
          builder: (context, AsyncSnapshot snapshot) {
            // if (!snapshot.hasData) {
            //   return Container();
            // }

            // var data = snapshot.data!.docs;

            return ListView.builder(
              padding: EdgeInsets.only(top: 12.0),
              // itemCount: data.length,
              itemCount: 2,

              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => EditNotificationScreen())),
                  child: NotificationCard(),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
