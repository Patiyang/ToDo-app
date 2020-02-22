import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Category {
  final int id;
  final String name;
  final IconData icon;

  Category({this.id, this.name, this.icon});
}

final all = Category(id: 0, name: 'all', icon: Icons.search);
final meet = Category(id: 1, name: 'MeetUp', icon: Icons.location_city);
final music = Category(id: 2, name: 'Music', icon: Icons.library_music);
final birthday = Category(id: 3, name: 'BirthDay', icon: Icons.cake);
final game = Category(id:4, name:'Gaming', icon: Icons.gamepad);

final categories = [all, meet, music, birthday,game];
