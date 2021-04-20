import 'package:cat_adoption/ui.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: new ThemeData(
      primarySwatch: Colors.blue,
      accentColor: Colors.pinkAccent,
      fontFamily: 'Ubuntu'
    ),
    home: CatList(),
  ));
}

