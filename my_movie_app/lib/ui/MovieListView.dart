
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieListView extends StatelessWidget {
  final List Movies = [
    "Titanic",
    "Avatar",
    "Avengers",
    "Hulk",
    "IronMan",
    "Programmer"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text("Movies"),
      backgroundColor: Colors.blueGrey.shade900,
    ),
      backgroundColor: Colors.blueGrey.shade400,
      body: ListView.builder(
           itemCount: Movies.length,
          itemBuilder: (BuildContext context,int index){
          return Card(
            elevation: 4.5,
            color: Colors.white,
            child: ListTile(
              leading: CircleAvatar(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(13.9)
                  ),
                  child: Text(Movies[index][0]),
                ),
              ),
              trailing: Text("..."),
              subtitle: Text("subtitle"),
              title: Text(Movies[index]),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => MovieListViewDetails())),
            ),
          );
      }),
    );
  }
}

class MovieListViewDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie Details"),
        backgroundColor: Colors.blueGrey.shade900
      ),
      body: Center(
        child: Container(
          child: RaisedButton(
            child: Text("Go Back"),
            onPressed: (){
                Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}

