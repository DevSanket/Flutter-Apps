import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Quote extends StatefulWidget {
  @override
  _QuoteState createState() => _QuoteState();
}

class _QuoteState extends State<Quote> {
  int index = 0;
  List quotes = [
    "Act as if what you do makes a difference. It does.",
    "Success is not final, failure is not fatal: it is the courage to continue that counts",
    "Never bend your head. Always hold it high. Look the world straight in the eye.",
    "What you get by achieving your goals is not as important as what you become by achieving your goals.",
    "Believe you can and you're halfway there."
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent.shade400,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(bottom: 20),
              width: 400,
              height: 300,
              child: Card(
                child: Center(
                  child: Text(
                    quotes[index % quotes.length],
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
          FlatButton.icon(
            onPressed: ShowQuotes,
            icon: Icon(Icons.wb_sunny),
            label: Text("Inspire Me"),
            color: Colors.blue.shade200,
          )
        ],
      ),
    );
  }

  void ShowQuotes() {
    setState(() {
      index++;
    });
  }
}
