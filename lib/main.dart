import 'package:flutter/material.dart';
import 'package:todo_app/Styling/global_styling.dart';
import 'views/login_reg/landing.dart';

void main() => runApp(Hotel());

class Hotel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Hotel',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primaryColor: redColor,
          accentColor: greyColor,
        ),
        home: Landing());
  }
}
