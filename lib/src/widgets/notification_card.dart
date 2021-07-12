// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_todolist/src/models/todo.dart';

class NotificationCard extends StatefulWidget {
  dynamic data;
  dynamic index;
  // ToDoCard({required this.data, required this.index});

  @override
  State<StatefulWidget> createState() {
    return _NotificationCard();
  }
}

class _NotificationCard extends State<NotificationCard> {
  // Todo? todo;
  @override
  void initState() {
    // TODO: implement initState
    // todo = Todo.fromFirestore(widget.data);
  }

  doneTask() async {
    // await FirebaseFirestore.instance.runTransaction((transaction) async {
    //   transaction.update(widget.index, {'status': 'DONE'});
    // });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.all(Radius.circular(5.0))),
      padding: EdgeInsets.only(left: 8.0, right: 8.0),
      margin: EdgeInsets.only(bottom: 5.0),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Image.network(
              "https://yt3.ggpht.com/ytc/AAUvwnhE68PPZGXNhb00m-CwvghbtZD-3UoGNhM9yDhymg=s900-c-k-c0x00ffffff-no-rj",
              width: 80.0,
              height: 80.0,
            ),
          ),
          SizedBox(width: 10.0),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  // todo!.title,
                  "Quà sinh nhật Cosy",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 4.0),
                Text(
                  // todo!.subTitle,
                  "Quà > 500k",
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 4.0),
                Text(
                  // todo!.subTitle,
                  "16h 16/10/2021",
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: IconButton(
              icon: Icon(
                Icons.close,
                size: 18.0,
                color: Colors.red,
              ),
              onPressed: () => doneTask(),
            ),
          ),
        ],
      ),
    );
  }
}
