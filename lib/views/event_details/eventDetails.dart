import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/event.dart';
import 'package:todo_app/views/event_details/event_background.dart';

import 'event_content.dart';

class EventDetails extends StatelessWidget {
  final Event event;

  const EventDetails({Key key, this.event}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Provider<Event>.value(
          value: event,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              EventBackGround(),
              EventContent(),
            ],
          ),
        ),
      ),
    );
  }
}
