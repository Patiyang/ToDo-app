import 'package:flutter/material.dart';
import 'package:todo_app/Styling/global_styling.dart';
import 'package:todo_app/views/login.dart';
import 'package:todo_app/views/registration.dart';

class Landing extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            color: Theme.of(context).accentColor,
            height: MediaQuery.of(context).size.height * .3,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'WELCOME',
                    style: register,
                  ),
                  Text(
                    'TO Blah Blah Blah',
                    style: landing,
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: Theme.of(context).accentColor,
            height: MediaQuery.of(context).size.height * .4,
            child: Center(
              child: CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage('images/c2.jpg'),
              ),
            ),
          ),
          Spacer(),
          Container(
              color: Theme.of(context).accentColor,
              height: MediaQuery.of(context).size.height * .3,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => Login()));
                      },
                      child: Text(
                        'Already A Member?',
                        style: landingTwo,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => Register()));
                        },
                        child: Text(
                          ' Register Today',
                          style: landing,
                        )),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
