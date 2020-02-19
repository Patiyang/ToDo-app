import 'package:flutter/material.dart';
import 'package:todo_app/Styling/global_styling.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback callback;
  final Icon icon;

  const CustomButton({Key key, this.callback, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: redColor,
      elevation: 0,
      shape: CircleBorder(side: BorderSide.none
        // borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      // minWidth: MediaQuery.of(context).size.width * .4,
      onPressed: callback,
      child: icon
    );
  }
}
