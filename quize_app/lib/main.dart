import 'package:flutter/material.dart';
import 'package:quize_app/quize/quize.dart';


final ThemeData _apptheme = _buildAppTheme();

ThemeData _buildAppTheme(){
  final ThemeData base = ThemeData.dark();

  return base.copyWith(
    brightness: Brightness.dark,
    accentColor: Colors.amber[200],
    primaryColor: Colors.grey[600],
    scaffoldBackgroundColor: Colors.red,
    backgroundColor: Colors.blue,
    textTheme: _appTextTheme(base.textTheme)
  );
}

TextTheme _appTextTheme(TextTheme base){
    return base.copyWith(
      headline: base.headline.copyWith(
          fontWeight: FontWeight.w500
      ),
      button: base.button.copyWith(
        letterSpacing: 4
      ),
      caption: base.caption.copyWith(
        fontWeight: FontWeight.w400
      ),
      body1: base.body1.copyWith(
        fontSize: 23,
        fontFamily: "Lobster",
      ),
      title: base.title.copyWith(
        fontSize: 15
      )
    );
}

void main() {
  runApp(MaterialApp(
    theme: _apptheme,
    home: quize(),
  ));
}
