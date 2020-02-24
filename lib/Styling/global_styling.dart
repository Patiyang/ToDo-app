import 'package:flutter/material.dart';

Color greyColor = new Color(0xff212121);
Color redColor = new Color(0xffef5350);
Color lightBlue = new Color(0xF88787A0);

TextStyle register = TextStyle(
    fontSize: 30, color: redColor, fontFamily: 'Sans', letterSpacing: .5);
TextStyle signIn = TextStyle(
    fontSize: 20, color: redColor, fontFamily: 'Sans', letterSpacing: .5);
TextStyle landing = TextStyle(
    color: redColor, fontSize: 14, fontFamily: 'Sans', letterSpacing: .6);

TextStyle landingTwo = TextStyle(
    fontWeight: FontWeight.bold,
    color: lightBlue,
    letterSpacing: .6,
    fontSize: 14);

TextStyle hint = TextStyle(
    color: Colors.red[300],
    fontSize: 14,
    fontFamily: 'Sans',
    letterSpacing: .6);

TextStyle heading = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 30,
    fontFamily: 'Sans',
    letterSpacing: .6);
TextStyle fadedTextStyle = TextStyle(
    color: Colors.white70,
    fontWeight: FontWeight.bold,
    fontSize: 16,
    fontFamily: 'Sans',
    letterSpacing: .6);

TextStyle categoryTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 12,
    fontWeight: FontWeight.bold,
    fontFamily: 'Sans',
    letterSpacing: .6);
TextStyle selectedCategoryText = categoryTextStyle.copyWith(color: redColor);
TextStyle eventTitle = TextStyle(
    color: greyColor,
    fontSize: 15,
    fontWeight: FontWeight.bold,
    fontFamily: 'Sans',
    letterSpacing: .6);
TextStyle eventDescription = TextStyle(
    color: greyColor,
    fontSize: 12,
    // fontWeight: FontWeight.bold,
    fontFamily: 'Sans',
    letterSpacing: .6);

TextStyle eventLocation = TextStyle(
    color: greyColor,
    fontSize: 12,
    // fontWeight: FontWeight.bold,
    fontFamily: 'Sans',
    letterSpacing: .6);
TextStyle eventLocationdetails = TextStyle(
    color: Colors.white,
    fontSize: 13,
    fontWeight: FontWeight.bold,
    fontFamily: 'Sans',
    letterSpacing: .6);
    TextStyle eventDuration = TextStyle(
    color: greyColor,
    fontSize: 12,
    fontWeight: FontWeight.bold,
    fontFamily: 'Sans',
    letterSpacing: .6);
TextStyle eventDetailsTitle = TextStyle(
    color: Colors.white,
    fontSize: 40,
    fontWeight: FontWeight.bold,
    fontFamily: 'Sans',
    letterSpacing: .6);

TextStyle location = TextStyle(fontSize: 15, color: greyColor);
TextStyle guest = TextStyle(fontSize: 15, color: greyColor);
