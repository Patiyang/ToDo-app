import 'package:flutter/material.dart';

class Clipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    Offset curveStart = Offset(0, size.height*.85);
    Offset curveEnd = Offset(size.width, size.height * .85);
    path.lineTo(curveStart.dx, curveStart.dy);
    path.quadraticBezierTo(
        size.width/2, size.height, curveEnd.dx, curveEnd.dy);
        path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
