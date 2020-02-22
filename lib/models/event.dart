import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Event {
  final String imageUrl, title, description, location, duration;
  final List categoryId, images;

  Event(
      {this.imageUrl,
      this.title,
      this.description,
      this.location,
      this.categoryId,
      this.images,
      this.duration});
}

final musicEvent = Event(
  imageUrl: 'images/back',
  categoryId: [0, 2],
  images: ['images/category/C1', 'images/category/C2'],
  title: 'Dj Kalonje is coming to town',
  location: 'IBIZA',
  duration: '3hrs',
  description: 'don\'t you miss out in the greatest hype event in nyeri town',
);

final birthdayEvent = Event(
  imageUrl: 'images/back',
  categoryId: [0, 3],
  images: ['images/category/C3', 'images/category/C4'],
  title: 'Get the best recipes yet cooked',
  location: 'NAIVAS',
  duration: '1 hr 30 minutes',
  description:
      'don\'t you miss out on the best delicacies you could ever taste',
);

final gamingEvent = Event(
  imageUrl: 'images/back',
  categoryId: [0, 4],
  images: ['images/category/C5', 'images/images/c1'],
  title: 'Get the best recipes yet cooked',
  location: 'SARIT CENTER',
  duration: '6 hours',
  description:
      'don\'t you miss out on the best delicacies you could ever taste',
);

final meetEvent = Event(
    imageUrl: 'images/back',
    categoryId: [0, 1],
    images: ['images/images/c2', 'images/images/c3'],
    title: 'let\'s meet up this friday for a hike',
    location: 'GOLDEN GATES HOTEL',
    duration: '48 hours',
    description: 'this is going to be the most engaging hike ever');
