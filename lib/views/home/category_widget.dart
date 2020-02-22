import 'package:flutter/material.dart';
import 'package:todo_app/Styling/global_styling.dart';
import 'package:todo_app/models/category.dart';

class CategoryWidget extends StatelessWidget {
  final Category category;

  const CategoryWidget({Key key, this.category}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.transparent,
        border: Border.all(color: Colors.white70, width: 1.5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            category.icon,
            color: Theme.of(context).scaffoldBackgroundColor,
            size: 30,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            category.name,
            style: categoryTextStyle,
          )
        ],
      ),
    );
  }
}
