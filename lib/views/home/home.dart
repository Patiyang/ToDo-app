import 'package:flutter/material.dart';
import 'package:todo_app/Styling/global_styling.dart';
import 'package:todo_app/models/category.dart';
import 'package:todo_app/views/home/category_widget.dart';
import 'package:todo_app/views/home/homepage_background.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   automaticallyImplyLeading: false,
        //   actions: <Widget>[
        //     IconButton(onPressed: () {}, icon: Icon(Icons.exit_to_app)),
        //   ],
        //   centerTitle: true,
        // ),
        body: Stack(
      children: <Widget>[
        HomeBackground(
          screenHeight: MediaQuery.of(context).size.height,
        ),
        SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'RAVER',
                        style: fadedTextStyle,
                      ),
                      Spacer(),
                      IconButton(
                        icon:Icon( Icons.person,
                        color: greyColor,
                        size: 20,),
                       onPressed: (){
                         print('object');
                       },
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'What\'s good \ntoday',
                    style: heading,
                  ),
                ),
                SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical:10.0),
                    child: Row(
                      children: <Widget>[
                        for (final category in categories)
                          CategoryWidget(category: category)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
}
