import 'package:flutter/material.dart';
import 'package:todo_app/Styling/global_styling.dart';
import 'package:todo_app/views/landing.dart';
import 'package:todo_app/views/login.dart';
import 'package:todo_app/views/registration.dart';

void main() => runApp(Hotel());

class Hotel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Hotel',
   
      debugShowCheckedModeBanner: false,
      theme:ThemeData(
        primaryColor: greyColor,
        accentColor: greyColor,
      ),
      home: Landing()
    );
  }
}

