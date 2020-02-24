import 'package:flutter/material.dart';
import 'package:todo_app/Styling/global_styling.dart';
import 'package:todo_app/models/event.dart';

class Events extends StatelessWidget {
  final Event event;

  const Events({Key key, this.event}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      color: Colors.white,
      elevation: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            child: Image.asset(
              event.imageUrl,
              height: 170,
              width: 150,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(event.title, style: eventTitle),
                      SizedBox(height: 10),
                      Text(event.description, style: eventDescription),
                      SizedBox(height: 5),
                      FittedBox(
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.location_on,
                              color: greyColor,
                              size: 20,
                            ),
                            SizedBox(width: 5),
                            Text(event.location)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Spacer(),
                Text(
                  event.duration,
                  style: eventDuration,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
