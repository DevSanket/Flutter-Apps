import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quize_app/quize/questions.dart';

class quize extends StatefulWidget {
  @override
  _quizeState createState() => _quizeState();
}

class _quizeState extends State<quize> {
  int i=0;
  List QuestionBank = [
    Question.name("I am Developer", true),
    Question.name("Flutter is Hard", false),
    Question.name("Software Engineer Doing Less Work", false)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quize Master"),
        centerTitle: true,
        // backgroundColor: Colors.indigo,
      ),
      // backgroundColor: Colors.indigo.shade50,
      body: Builder(
        builder: (BuildContext context) => Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top:8.0),
                child: Center(child: Icon(Icons.alarm,size: 140,),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: Colors.indigo.shade200,
                      style: BorderStyle.solid
                    )
                  ),
                  height: 120,
                  child: Center(
                    child: Text(QuestionBank[i].questionText,
                    //   style: TextStyle(
                    //   fontSize: 18,
                    //   color: Colors.black
                    // ),
                       ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(icon: Icon(Icons.navigate_before), onPressed: () => _prevQuize()),
                  RaisedButton(onPressed: () =>_checkAnswer(true,context),child: Text("True"),),
                  SizedBox(width: 14,),
                  RaisedButton(onPressed: () => _checkAnswer(false,context),child: Text("False"),),
                  IconButton(icon: Icon(Icons.navigate_next), onPressed: () => _nextQuize()),

                ],
              )

            ],
          ),
        ),
      ),
      );
  }

_checkAnswer(bool userChoice,BuildContext context) {
    if(userChoice == QuestionBank[i].isCorrect){
      final snackbar = SnackBar(
          content: Text("Correct"),
        duration: Duration(milliseconds: 500),
        backgroundColor: Colors.green,
      );
      Scaffold.of(context).showSnackBar(snackbar);
      _nextQuize();
    }else{
      final snackbar = SnackBar(
        content: Text("inCorrect"),
        duration: Duration(milliseconds: 500),
        backgroundColor: Colors.red,
      );
      Scaffold.of(context).showSnackBar(snackbar);
      _nextQuize();

    }
  }

  _nextQuize(){
    setState(() {
      i =( i+ 1)% QuestionBank.length;
    });
  }

  _prevQuize(){
    setState(() {
      if(i <=0){
        i=0;
      }else{
        i--;
      }
    });
  }
}
