import 'package:cat_adoption/cat.dart';
import 'package:flutter/material.dart';

class CatDetailsHeader extends StatefulWidget {
  final Cat cat;
  final Object avatarTag;

  const CatDetailsHeader({Key key, this.cat, this.avatarTag}) : super(key: key);
  @override
  _CatDetailsHeaderState createState() => _CatDetailsHeaderState();
}

class _CatDetailsHeaderState extends State<CatDetailsHeader> {

  static const BACKGROUND_IMAGE = 'images/profile_header_background.png';


  @override
  Widget build(BuildContext context) {

    var avatar = new Hero(tag: widget.avatarTag, child: new CircleAvatar(
      backgroundImage: new NetworkImage(widget.cat.avatarUrl),
      radius: 75.0,
    ));
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;
    var screenWidth = MediaQuery.of(context).size.width;
    var diagonalBackground = new DigonallyCutColoredImage(
      image: new Image.asset(
        BACKGROUND_IMAGE,
        width: screenWidth,
        height: 280.0,
        fit: BoxFit.cover,

      ),
      color: const Color(0xBB42A5f5),
    );

    var likeInfo = new Padding(padding: const EdgeInsets.only(top: 16.0),
    child: new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        new Icon(Icons.thumb_up,
        color: Colors.white,
          size: 16,
        ),
        new Padding(padding: const EdgeInsets.only(left: 8),
        child: Text(
          widget.cat.likeCounter.toString(),
          style: textTheme.subhead.copyWith(color: Colors.white),
        ),
        )

      ],
    ),
    );

    var actionButtons = Padding(
      padding: const EdgeInsets.only(top:16,left: 16,right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          new ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: MaterialButton(
              minWidth: 140,
              color: theme.accentColor,
              textColor: Colors.white,
              child: Text("ADOPT ME"),
              onPressed: () async{

              },
            ),
          ),
          ClipRRect(
            borderRadius: new BorderRadius.circular(30.0),
            child: RaisedButton(
              onPressed: (){},
              disabledColor: Colors.grey,
              color: Colors.lightGreen,
              textColor: Colors.white,
              child: Text("Like"),
            ),
          )
        ],

      ),

    );


    return Stack(
      children: [
        diagonalBackground,
        Align(
          alignment: FractionalOffset.bottomCenter,
          heightFactor: 1.4,
          child: Column(
            children: [
              avatar,
              likeInfo,
              actionButtons
            ],
          ),
        ),
        Positioned(child: new BackButton(
          color: Colors.white,
        ),
        top: 26,
          left: 4.0,
        )
      ],
    );
  }
}


class DigonallyCutColoredImage extends StatelessWidget {
  final Image image;
  final Color color;

  const DigonallyCutColoredImage({Key key, this.image, this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new ClipPath(
      clipper: new DiagonalClipper(),
      child: new DecoratedBox(
          position: DecorationPosition.foreground,
          decoration: BoxDecoration(color: color),
        child: image,
      ),
    );
  }
}


class DiagonalClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size){
    Path path = new Path();
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height - 50.0);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }
  @override bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}