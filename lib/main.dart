import 'package:flutter/material.dart';
import 'package:todo_app/Interfaces/Login/Login.dart';
import 'package:todo_app/Interfaces/AllTaskView.dart';
import 'package:todo_app/Styling/global_styling.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/bloc/blocs/blocs.dart';

import 'Styling/global_styling.dart';
//import 'Interfaces/User Profile/profile.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //bloc.registerUser("username", "firstname", "lastname", "emailadress", "password");
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'todo app',
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String apiKey;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: signInUser(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          // String apiKey = '';
          if (snapshot.hasData) {
            apiKey = snapshot.data;
            print('data is present :' + apiKey);
            // print('the api key is:' + apiKey);
          } else {
            print('there is no data');
          }
          return apiKey.length > 0 ? getHomePage() : LoginPage(loginPressed: login, newUser: false);
          // return LoginPage();
        });
  }

  void login() {
    setState(() {
      build(context);
    });
  }

  Future signInUser() async {
    String userName = '';
    apiKey = await getApiKey();
    if (apiKey.length > 0) {
      userBloc.signInUser('', '', apiKey);
    } else {
      print('no api key present');
    }
    return apiKey;
  }

  Future getApiKey() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('API_Token');
  }

  Widget getHomePage() {
    return MaterialApp(
      color: Colors.grey[850],
      home: SafeArea(
        child: DefaultTabController(
          length: 3,
          child: Scaffold(
            body: Stack(
              children: [
                TabBarView(
                  children: <Widget>[
                    // Container(
                    //   color: Colors.black87,
                    //   child: Home(),
                    // ),
                    HomeTab(apiKey: apiKey),
                    Container(color: greyColor),
                    Container(
                      color: greyColor,
                      child: Center(
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0)),
                          color: Colors.lightGreen[100],
                          child: Text('Log Out'),
                          onPressed: () {
                            print('trying to log user out');
                            logOut();
                          },
                        ),
                      ),
                    )
                    //Container(color: Colors.blue),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  height: 147,
                  //elevation: 10,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(35),
                      bottomRight: Radius.circular(35),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Today',
                        style: lobbyText,
                      ),
                      Container(),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 178),
                  height: 290,
                  child: FloatingActionButton(
                    child: Icon(
                      Icons.add,
                      size: 50,
                    ),
                    backgroundColor: redColor,
                    onPressed: () {},
                  ),
                )
              ],
            ),
            appBar: new TabBar(
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.calendar_today),
                ),
                Tab(
                  icon: Icon(Icons.add),
                ),
                Tab(
                  icon: Icon(Icons.perm_identity),
                )
              ],
              labelColor: redColor,
              unselectedLabelColor: greyColor,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorPadding: EdgeInsets.all(3),
              indicatorColor: Colors.transparent,
            ),
            backgroundColor: Colors.white,
          ),
        ),
      ),
    );
  }

  logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('API_Token', "");
    setState(() {
      build(context);
    });
  }

  @override
  void initState() {
    super.initState();
  }
}
