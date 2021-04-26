import 'package:cat_adoption/cat.dart';
import 'package:cat_adoption/ui/Footer/details_footer.dart';
import 'package:cat_adoption/ui/Header/details_header.dart';
import 'package:cat_adoption/ui/details.body.dart';
import 'package:flutter/material.dart';

class CatDetailsPage extends StatefulWidget {
  final Cat cat;
  final Object avatarTag;

  const CatDetailsPage({Key key, this.cat, this.avatarTag}) : super(key: key);
  @override
  _CatDetailsPageState createState() => _CatDetailsPageState();
}

class _CatDetailsPageState extends State<CatDetailsPage> {
  @override
  Widget build(BuildContext context) {

    var linearGradient = new BoxDecoration(
      gradient: LinearGradient(
        begin: FractionalOffset.centerRight,
        end: FractionalOffset.bottomLeft,
        colors: [
          Colors.blue.shade200,
          Colors.pinkAccent.shade400
        ]
      )
    );


    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: linearGradient,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatDetailsHeader(
                cat: widget.cat,
                avatarTag: widget.avatarTag,
              ),
              Padding(padding: const EdgeInsets.all(24.0),
              child: CatDetailsBody(cat: widget.cat,),
              ),
              new CatShowCase(cat: widget.cat,avatarTag: widget.avatarTag,)
            ],
          ),
        ),
      )
    );
  }
}
