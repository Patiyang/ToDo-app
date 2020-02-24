import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Styling/global_styling.dart';
import 'package:todo_app/models/event.dart';
import 'package:todo_app/models/guests.dart';
// import 'package:todo_app/models/guests.dart';

class EventContent extends StatelessWidget {
  final Event event;

  const EventContent({Key key, this.event}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final event = Provider.of<Event>(context);

    final screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * .07),
            child: Text(
              event.title,
              style: eventDetailsTitle,
              textAlign: TextAlign.right,
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * .07),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FittedBox(
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                        color: Colors.white70,
                        size: 20,
                      ),
                      SizedBox(width: 5),
                      Text(
                        event.location,
                        textAlign: TextAlign.right,
                        style: eventLocationdetails,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 90),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text('Scheduled Guests',
                style: eventTitle.copyWith(fontSize: 17)),
          ),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                for (final guest in guests)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: <Widget>[
                        ClipOval(
                          child: Image.asset(guest.imagePath,
                              width: 90, height: 90, fit: BoxFit.cover),
                        ),
                        Text(
                          guest.name,
                          style: location.copyWith(fontSize: 12),
                        )
                      ],
                    ),
                  )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: event.punchline,
                  style: guest.copyWith(
                      color: redColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              TextSpan(
                  text: event.description,
                  style: guest.copyWith(
                      color: greyColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold))
            ])),
          ),
          if (event.images.isNotEmpty)
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
              child: Text('Gallery',
                  style: guest.copyWith(
                      fontSize: 25, fontWeight: FontWeight.bold)),
            ),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                for (final image in event.images)
                  Container(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: Image.asset(
                          image,
                          height: 200,
                          width: 150,
                          fit: BoxFit.cover,
                        )),
                  ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
