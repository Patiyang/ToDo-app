import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/Models/Classes/registerUser.dart';
import 'package:todo_app/bloc/blocs/register_bloc.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailCont = new TextEditingController();
  TextEditingController usernameCont = new TextEditingController();
  TextEditingController firstnameCont = new TextEditingController();
  TextEditingController lastnameCont = new TextEditingController();
  TextEditingController passwordCont = new TextEditingController();
  @override
  Widget build(BuildContext context) {
   
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
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
                    User user;
                    if (passwordCont != null || usernameCont != null || firstnameCont != null 
                    ||emailCont != null || lastnameCont != null)
                    {
                      user =bloc.registerUser(usernameCont.text, firstnameCont.text,
                          lastnameCont.text, emailCont.text, passwordCont.text);
                    }
                    if(user != null){
                      saveApiKey(user);
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  void saveApiKey(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
     prefs.setString('API_Token', user.apikey);
    }
    // await prefs.getString(apiKey);
  }

