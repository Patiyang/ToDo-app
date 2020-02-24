import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Styling/global_styling.dart';
import 'package:todo_app/models/category.dart';
import 'package:todo_app/models/event.dart';
import 'package:todo_app/models/guests.dart';
import 'package:todo_app/views/event_details/eventDetails.dart';
import 'package:todo_app/views/home/category_widget.dart';
import 'package:todo_app/views/home/homepage_background.dart';

import '../../appstate.dart';
import 'event.dart';

class Home extends StatefulWidget {
  final Event events;
  final Guest guest;

  const Home({Key key, this.events, this.guest}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return AppState();
      },
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            HomeBackground(
              screenHeight: MediaQuery.of(context).size.height,
            ),
            SafeArea(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 8),
                      child: Row(
                        children: <Widget>[
                          Text(
                            'RAVER',
                            style: fadedTextStyle,
                          ),
                          Spacer(),
                          IconButton(
                            icon: Icon(
                              Icons.person,
                              color: greyColor,
                              size: 20,
                            ),
                            onPressed: () {
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
                    Consumer<AppState>(
                      builder: (context, appState, child) =>
                          SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15.0),
                          child: Row(
                            children: <Widget>[
                              for (final category in categories)
                                CategoryWidget(category: category)
                            ],
                          ),
                        ),
                      ),
                    ),
                    Consumer<AppState>(
                      builder: (context, appState, widget) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            for (final event in events.where((event) => event
                                .categoryId
                                .contains(appState.selectedCatId)))
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30.0),
                                child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => EventDetails(event:event)));
                                    },
                                    child: Events(event: event)),
                              )
                          ],
                        );
                      },
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
