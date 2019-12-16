import 'package:flutter/material.dart';
import 'package:todo_app/Interfaces/Login/Login.dart';
import 'package:todo_app/Interfaces/Own_tasks.dart';
import 'package:todo_app/Styling/global_styling.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:todo_app/Models/Classes/registerUser.dart';
import 'package:todo_app/bloc/blocs/register_bloc.dart';

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
        home: MyHomePage()
        // home: FutureBuilder(
        //     future: getUser(),
        //     builder: (BuildContext context, AsyncSnapshot snapshot) {

        //       if (snapshot.connectionState == ConnectionState.none && snapshot.hasData == null) {
        //             // print('the snapshot of the project is : ${snapshot.data}');
        //         return Container();
        //       }

        //       return ListView.builder(
        //           itemCount: snapshot.data.length,
        //           itemBuilder: (context, index) {
        //             return Column(children: <Widget>[]);
        //           });
        //     }),
        );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  SharedPreferences prefs;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
        future: getApiKey(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          String apiKey = '';
          if (snapshot.hasData) {
            apiKey = snapshot.data;
            print('the api key is:' + apiKey);
            print('there is data');
          } else {
            //print('there is no data');
          }
          return apiKey.length > 0 ? getHomePage(): LoginPage();
        });
  }

  Future getApiKey() async {
    String apiKey;
    try{
      apiKey = prefs.getString('API_Token');
    }catch (Exception){
      apiKey = "";
    }
    return apiKey;
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
                    HomeTab(),
                    Container(color: Colors.purpleAccent),
                    Container(color: Colors.blue),
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
                        'My Tasks',
                        style: lobbyText,
                      ),
                      Container(),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 185),
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
                  icon: Icon(Icons.menu),
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

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((SharedPreferences sp) {
      prefs = sp;
    });
  }
}
