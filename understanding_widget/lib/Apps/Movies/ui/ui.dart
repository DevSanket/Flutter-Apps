import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:understanding_widget/Apps/Movies/util/movieclass.dart';

class MovieListView extends StatelessWidget {
  final List<Movie> movieList = Movie.getMovies();
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
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 4.5,
              color: Colors.white,
              child: ListTile(
                leading: CircleAvatar(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(13.9)),
                    child: Text(movieList[index].title[0]),
                  ),
                ),
                trailing: Text("..."),
                subtitle: Text(movieList[index].language),
                title: Text(movieList[index].title),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MovieListViewDetails(
                              Movie: Movies[index],
                            ))),
              ),
            );
          }),
    );
  }
}

class MovieListViewDetails extends StatelessWidget {
  final String Movie;

  const MovieListViewDetails({Key key, this.Movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text(Movie), backgroundColor: Colors.blueGrey.shade900),
      body: Center(
        child: Container(
          child: RaisedButton(
            child: Text("Go Back"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}
