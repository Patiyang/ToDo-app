import 'package:flutter/material.dart';
import 'package:todo_app/Styling/global_styling.dart';
import 'package:todo_app/helpers/buttons.dart';
import 'package:todo_app/views/home/home.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyColor,
      appBar: AppBar(
        backgroundColor: greyColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: lightBlue,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        // addAutomaticKeepAlives: true,
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            height: MediaQuery.of(context).size.height * .3,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Text(
                'Welcome\n Back',
                style: register,
                // textAlign: TextAlign.start,
              ),
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            child: Form(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextFormField(
                      cursorColor: Colors.white70,
                      style: TextStyle(color: Colors.white70),
                      decoration: InputDecoration(
                        hintText: 'Email',
                        hintStyle: hint,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 25),
                    child: TextFormField(
                      obscureText: true,
                      cursorColor: Colors.white70,
                      style: TextStyle(color: Colors.white70),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Password',
                        hintStyle: hint,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            height: MediaQuery.of(context).size.height * .4,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Sign In',
                    style: signIn,
                  ),
                  CustomButton(
                      icon: Icon(
                        Icons.arrow_forward,
                        color: greyColor,
                      ),
                      callback: () {
                        Navigator.pushReplacement(
                            context, MaterialPageRoute(builder: (_) => Home()));
                      }),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
