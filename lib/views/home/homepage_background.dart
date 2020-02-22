import 'package:flutter/material.dart';
import 'package:todo_app/views/home/clipper.dart';
class HomeBackground extends StatelessWidget {
  final screenHeight;

  const HomeBackground({Key key, @required this.screenHeight}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return ClipPath(
      clipper: Clipper(),
          child: Container(
            color: themeData.primaryColor,
        height: screenHeight *.6,
      ),
    );
  }
}