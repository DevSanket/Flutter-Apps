import 'package:cat_adoption/cat.dart';
import 'package:flutter/material.dart';

class DetailsShowCase extends StatelessWidget {
  final Cat cat;

  DetailsShowCase(this.cat);
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Center(
      child: Text(
        cat.description,
        textAlign: TextAlign.center,
        style: textTheme.subhead.copyWith(color: Colors.white),
      ),
    );
  }
}
