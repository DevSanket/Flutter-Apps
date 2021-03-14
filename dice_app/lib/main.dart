import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(
    MaterialApp(
      home: Dice(),
    )
  );
}


class Dice extends StatefulWidget {
  @override
  _DiceState createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  int DiceNumber =2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dice"),
        backgroundColor: Colors.blue.shade300,
      ),
      backgroundColor: Colors.blueAccent.shade100,
      body: Center(
        child: Row(
          children: [
            Expanded(child: FlatButton(
              minWidth: 200,
              height: 200,
              onPressed: (){
                setState(() {
                  DiceNumber = Random().nextInt(6) + 1;
                  debugPrint("THe value $DiceNumber");
                });
              },
              child: Image.asset('images/dice$DiceNumber.png',width: 200,),
            ))
          ],
        ),
      ),
    );
  }
}

