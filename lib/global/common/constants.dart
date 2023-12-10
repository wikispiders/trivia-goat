import 'package:flutter/material.dart';

List<String> myCategories = [
  'General Knowledge',
  'Books',
  'Film',
  'Music',
  'Musical & Theatres',
  'TV',
  'Video Games',
  'Board Games',
  'Science & Nature',
  'Computers',
  'Mathematics',
  'Mythology',
  'Sports',
  'Geography',
  'History',
  'Politics',
  'Art',
  'Celebrities',
  'Animals',
  'Vehicles',
  'Comics',
  'Gadgets',
  'Anime & Manga',
  'Cartoon & Animations',
];

const int categoryOffset = 9;

List<String> myTypes = ['Multiple Choice', 'True or False'];

class CustomColors {
  static const Color playerListPink = Color.fromARGB(137, 233, 30, 98);
  static const Color buttonShadowPink = Color.fromARGB(255, 255, 136, 175);
  static const Color widgetWhite = Color.fromARGB(255, 255, 244, 248);
  static const Color timerPink = Color.fromARGB(255, 255, 59, 196);
}

final kHintTextStyle = TextStyle(
  color: Colors.white54,
  fontFamily: 'OpenSans',
);

final kLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

final kBoxDecorationStyle = BoxDecoration(
  color: const Color.fromARGB(255, 241, 108, 190),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);
