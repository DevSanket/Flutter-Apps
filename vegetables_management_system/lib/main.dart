import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: FirstScreen(),
  ));
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("images/main.png",width: 400,),
            SizedBox(height: 70,),
            Text("#Stock Management",style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 30
            ),),
          ],
        ),
      ),
    );
  }
}
