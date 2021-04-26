import 'package:cat_adoption/cat.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


final dynamic cattributeLookup = {
  "children":{"name":"Kind Friendly","icon":FontAwesomeIcons.child},
  "desexed":{"name":"Desexed","icon":FontAwesomeIcons.cut},
  "vaccinated":{"name":"Vaccinated","icon":FontAwesomeIcons.eyeDropper},
  "microchipped":{"name":"Microchipped","icon":FontAwesomeIcons.microchip}
};


class CattributesShowCase extends StatelessWidget {
  final Cat cat;

  CattributesShowCase(this.cat);


  _createCircleBadge(IconData iconData,Color bgcolor,Color iconColor,String text){
    return Padding(padding: const EdgeInsets.only(left: 8.0),

      child: Stack(
        children: [
          CircleAvatar(
            backgroundColor: bgcolor,
            child: Icon(
              iconData,
              color: iconColor,
              size: 36,
            ),
            radius: 36,
          ),
          Positioned(child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 10,
              color: iconColor
            ),
          ))
        ],
      ),

    );
  }

  @override
  Widget build(BuildContext context) {

    var items = <Widget> [];

    for(var i=0;i < cat.cattributes.length;i++){
      var badge = _createCircleBadge(cattributeLookup[cat.cattributes[i]]['icon'], Colors.white12, Colors.white, cattributeLookup[cat.cattributes[i]]['name']);
      items.add(badge);
    }

    var delegate = new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0
    );
    return GridView(gridDelegate: delegate,
    padding: const EdgeInsets.only(top: 16),
      children: items,
    );
  }
}
