class Event {
  final String imageUrl, title, description, location, duration, punchline;
  final List categoryId, images;

  Event({
    this.imageUrl,
    this.title,
    this.description,
    this.location,
    this.categoryId,
    this.images,
    this.punchline,
    this.duration,
  });
}

final musicEvent = Event(
  imageUrl: 'images/g1.jpeg',
  categoryId: [0, 2],
  images: ['images/category/C1.jpg', 'images/category/C2.jpg'],
  title: 'Dj Kalonje is coming to town',
  location: 'Luxurious Ibiza',
  duration: '3hrs',
  punchline: 'It\'s friday night again\n',
  description: 'don\'t you miss out in the greatest hype event in nyeri town ',
);

final birthdayEvent = Event(
  imageUrl: 'images/g2.jpeg',
  categoryId: [0, 3],
  images: ['images/category/C3.jpg', 'images/category/C4.jpg'],
  title: 'Get the best birthday cake for any event ',
  location: 'Naivas',
  duration: '1.30h',
  punchline: 'it\'s that time again\n',
  description: 'don\'t you miss out on getting the best on your special day ',
);

final gamingEvent = Event(
  imageUrl: 'images/g3.jpg',
  categoryId: [0, 4],
  images: ['images/category/C5.jpg', 'images/images/c1.jpg'],
  title: 'Get the best recipes yet cooked',
  location: 'Sarit Center',
  duration: '6h',
  punchline: 'Show off your gaming skills\n',
  description: 'think you\'re good enough? Well, think again ',
);

final meetEvent = Event(
    imageUrl: 'images/g4.jpg',
    categoryId: [0, 1],
    images: ['images/images/c2.jpg', 'images/images/c3.jpg'],
    title: 'let\'s meet up this friday for a hike',
    location: 'Golden Gates Hotel',
    duration: '48h',
    punchline: 'Do not miss out\n',
    description: 'this is going to be the most engaging hike ever ');

final events = [musicEvent, birthdayEvent, gamingEvent, meetEvent];
