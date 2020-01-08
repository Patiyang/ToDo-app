import 'package:flutter/material.dart';
import 'package:todo_app/Styling/global_styling.dart';

class Todo extends StatelessWidget {
  final String title;
  final String keyValue;
  Todo({this.title, this.keyValue});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: Key(keyValue),
      padding: EdgeInsets.only(top: 7),
      height: 100,
      margin: EdgeInsets.only(left: 1, right: 5, bottom: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: redColor,
          // gradient: new LinearGradient(colors: [Colors.green, Colors.cyan]),
          boxShadow: [
            BoxShadow(
              // color: Colors.black.withOpacity(1),
              blurRadius: 0,
              // offset: Offset(5, 5)
            )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(5.00, 3.00, 0.00, 5.00),
                child: Text(title, style: myTasksHeading),
              ),
            ],
          ),
          Container(
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30)),
              onPressed: _showEditDialog,
              child: Icon(Icons.edit),
            ),
          )
        ],
      ),
    );
  }

  void _showEditDialog() {
    
  }
}
