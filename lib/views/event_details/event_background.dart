import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/event.dart';

class EventBackGround extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sWidth = MediaQuery.of(context).size.width;
    final sHeight = MediaQuery.of(context).size.height;
    final event = Provider.of<Event>(context);
    return Align(
      alignment: Alignment.topCenter,
      child: ClipPath(
        clipper: BackgroundClipper(),
        child: Image.asset(
          event.imageUrl,
          height: sHeight * .5,
          width: sWidth,
          fit: BoxFit.cover,
          color: Colors.black.withOpacity(.5),
          colorBlendMode: BlendMode.darken,
        ),
      ),
    );
  }
}

class BackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    Offset curveStarting = Offset(0, 40);
    Offset curveEnd = Offset(size.width, size.height);
    path.lineTo(curveStarting.dx, curveStarting.dy);
    path.quadraticBezierTo(
        size.width * .2, size.height * .9, curveEnd.dx, curveEnd.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
