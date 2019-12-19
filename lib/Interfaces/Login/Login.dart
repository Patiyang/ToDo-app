import 'package:flutter/material.dart';
import 'package:todo_app/Styling/global_styling.dart';
import 'package:todo_app/bloc/blocs/register_bloc.dart';

class LoginPage extends StatefulWidget {
  final newUser;
  final VoidCallback loginPressed;

  const LoginPage({Key key, this.newUser, this.loginPressed}): super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // bool newUser = false;
  TextEditingController emailCont = new TextEditingController();
  TextEditingController usernameCont = new TextEditingController();
  TextEditingController firstnameCont = new TextEditingController();
  TextEditingController lastnameCont = new TextEditingController();
  TextEditingController passwordCont = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: greyColor,
        body: Center(
          child: widget.newUser ? getSignupPage() : getSignInPage(),
        ),
      ),
    );
  }

  Widget getSignInPage() {
    TextEditingController unameText = new TextEditingController();
    TextEditingController password = new TextEditingController();

    return Container(
      margin: EdgeInsets.only(top: 40, left: 20, right: 40, bottom: 19),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 23),
            child: Text(
              'Welcome',
              style: welcome,
            ),
          ),
          Container(
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                TextField(
                  style: TextStyle(color: greyColor, fontFamily: 'Sans'),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.only(right: 20),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      hintText: "Username",
                      //prefixIcon: Icon(Icons.sentiment_satisfied)
                      icon: Icon(Icons.sentiment_satisfied)),
                  controller: unameText,
                ),
                TextField(
                  style: TextStyle(color: Colors.black, fontFamily: 'Sans'),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.only(right: 20),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      hintText: "Password",
                      //prefixIcon: Icon(Icons.sentiment_satisfied)
                      icon: Icon(Icons.lock)),
                  controller: password,
                ),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  child: FlatButton(
                    child: Text(
                      'Sign In',
                      style: redTodoTitle,
                    ),
                    onPressed: () {
                        if (unameText.text != null || password.text != null){
                          bloc.signInUser(unameText.text, password.text).then((){
                            widget.loginPressed();
                          });
                        }
                    },
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20, bottom: 1),
            child: Column(
              children: <Widget>[
                Text('Don\'t Have An Account Yet?', style: redTerms),
                FlatButton(
                  child: Text(
                    'Create one',
                    style: redTodoTitle,
                  ),
                  onPressed: () {},
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getSignupPage() {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          TextField(
            controller: emailCont,
            decoration: InputDecoration(hintText: 'Email'),
          ),
          TextField(
            controller: usernameCont,
            decoration: InputDecoration(hintText: 'Username'),
          ),
          TextField(
            controller: firstnameCont,
            decoration: InputDecoration(hintText: 'First Name'),
          ),
          TextField(
            controller: lastnameCont,
            decoration: InputDecoration(hintText: 'Last Name'),
          ),
          TextField(
            controller: passwordCont,
            decoration: InputDecoration(hintText: 'Password'),
          ),
          FlatButton(
            color: Colors.green,
            child: Text('Sign Up'),
            onPressed: () {
              // User user;
              if (passwordCont != null || usernameCont != null ||
                  firstnameCont != null || emailCont != null || lastnameCont != null) {
                bloc.registerUser(usernameCont.text, firstnameCont.text,
                        lastnameCont.text, emailCont.text, passwordCont.text).then((_) {
                  widget.loginPressed();
                });
              }
            },
          )
        ],
      ),
    );
  }
}
