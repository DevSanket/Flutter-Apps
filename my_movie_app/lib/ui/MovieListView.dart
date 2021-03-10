
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_movie_app/main.dart';
import 'package:my_movie_app/util/movie.dart';

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
           itemCount: movieList.length,
          itemBuilder: (BuildContext context,int index){
             return Stack(
               children: [
                  MovieCard(movieList[index],context),
                 Positioned( top: 10,child: movieImage(movieList[index].images[0]))
               ],
             );
          // return Card(
          //   elevation: 4.5,
          //   color: Colors.white,
          //   child: ListTile(
          //     leading: CircleAvatar(
          //       child: Container(
          //         decoration: BoxDecoration(
          //           color: Colors.transparent,
          //           borderRadius: BorderRadius.circular(13.9)
          //         ),
          //         child: Text(movieList[index].title[0]),
          //       ),
          //     ),
          //     trailing: Text("..."),
          //     subtitle: Text(movieList[index].language),
          //     title: Text(movieList[index].title),
          //     onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => MovieListViewDetails(MovieName: movieList[index].title,))),
          //   ),
          // );
      }),
    );
  }

  Widget MovieCard(Movie movie,BuildContext context){
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(left: 60),
        width: MediaQuery.of(context).size.width,
        height: 120,
        child: Card(
          color: Colors.black45,
          child: Padding(
            padding: const EdgeInsets.only(top: 8,bottom: 8,left: 54),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(child: Text(
                      movie.title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0,
                          color: Colors.white
                      ),
                    )),
                    Text("Rating : ${movie.imdbRating} / 10 ",style: mainTextStyle(),)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Released : ${movie.released}",style:mainTextStyle() ,),
                    Text(movie.runtime,style: mainTextStyle(),),
                    Text(movie.rated,style: mainTextStyle(),)
                  ],
                )

              ],
            ),
          ),
        ),
      ),
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => MovieListViewDetails(movie: movie,))),
    );

  }

  TextStyle mainTextStyle(){
    return TextStyle(
      fontSize: 15,
      color: Colors.grey,
    );
  }

  Widget movieImage(String ImageUrl){
    return Container(
      margin: EdgeInsets.only(left: 4),
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          // color: Colors.white
          image: DecorationImage(
              image: NetworkImage(ImageUrl ?? 'http://www.gergitavan.com/wp-content/uploads/2017/07/default-placeholder-1024x1024-570x321.png'),
              fit: BoxFit.cover
          )
      ),
    );
  }
}

//Another Activity
class MovieListViewDetails extends StatelessWidget {
  final Movie movie;

  const MovieListViewDetails({Key key, this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie"),
        backgroundColor: Colors.blueGrey.shade900
      ),
      body: ListView(
        children: [
              MovieDetailsThumbnail(thumbnail: movie.images[0],),
          MovieDetailsHeaderWithPoster(movie: movie,),
          HorizontalLine(),
          MovieDetailsCast(movie: movie,),
          HorizontalLine(),
          MovieDetailsExtraPosters(posters: movie.images,)

        ],
      )
    );
  }

}

class MovieDetailsThumbnail extends StatelessWidget {
  final String thumbnail;

  const MovieDetailsThumbnail({Key key, this.thumbnail}) : super(key: key);
  @override
  Widget build(BuildContext context,) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 190,
              decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(thumbnail),fit: BoxFit.cover)
              ),
            ),
            Icon(Icons.play_circle_outline,size: 100,color: Colors.white,)
          ],
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Color(0x00f5f5f5),Color(0xfff5f5f5)],
            begin: Alignment.topCenter,
              end: Alignment.bottomCenter
            )
          ),
          height: 80,
        )
        
      ],
    );
  }
}


class MovieDetailsHeaderWithPoster extends StatelessWidget {
  final Movie movie;

  const MovieDetailsHeaderWithPoster({Key key, this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          MoviePoster(Poster: movie.images[1],),
          SizedBox(width: 16,),
          Expanded(child: MovieDetailsHeader(movie: movie,))
        ],
      ),
    );
  }
}

//Movie Poster
class MoviePoster extends StatelessWidget {
  final String Poster;

  const MoviePoster({Key key, this.Poster}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        child: Container(
          width: MediaQuery.of(context).size.width/ 4,
          height: 160,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(Poster),fit: BoxFit.cover
            )
          ),
        ),
      ),
    );
  }
}

class MovieDetailsHeader extends StatelessWidget {
  final Movie movie;

  const MovieDetailsHeader({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("${movie.year} . ${movie.genre}".toUpperCase(),
        style: TextStyle(
          fontWeight: FontWeight.w400,
          color: Colors.cyan
        ),
        ),
        Text(movie.title,style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 32
        ),),
        Text.rich(TextSpan(
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w300
          ),
          children: [
            TextSpan(
              text: movie.plot
            ),
            TextSpan(text: "More...",style: TextStyle(
              color: Colors.indigoAccent
            ))
          ]
        ))
      ],
    );
  }
}


class MovieDetailsCast extends StatelessWidget {
  final Movie movie;

  const MovieDetailsCast({Key key, this.movie}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          MovieFields(field: "Cast",value: movie.actors,),
          MovieFields(field: "Director",value: movie.director,),
          MovieFields(field: "Awards",value: movie.awards,)
        ],
      ),
    );
  }
}


class MovieFields extends StatelessWidget {
  final String field;
  final String value;

  const MovieFields({Key key, this.field, this.value}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("$field : ",style: TextStyle(
          color: Colors.black38,
          fontSize: 12,
          fontWeight: FontWeight.w300
        ),),
        Expanded(child: Text(value,style: TextStyle(
          color: Colors.black,fontSize: 12,fontWeight: FontWeight.w300
        ),))
      ],
    );
  }
}

class HorizontalLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 12),
      child: Container(
        height: 0.5,
        color: Colors.black,
      ),
    );
  }
}


class MovieDetailsExtraPosters extends StatelessWidget {
  final List<String> posters;

  const MovieDetailsExtraPosters({Key key, this.posters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left:8.0),
          child: Text("More Movie Posters...".toUpperCase(),style: TextStyle(
            fontSize: 14,
            color: Colors.black
          ),),
        ),
        Padding(
          padding: const EdgeInsets.only(left:8.0,right: 8.0),
          child: Container(
            height: 170,
            padding: EdgeInsets.symmetric(vertical: 16),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
                separatorBuilder: (context,index) => SizedBox(width: 8,),
              itemCount: posters.length,
                itemBuilder: (context,index) => ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 4,
                    height: 160,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(posters[index]),
                        fit: BoxFit.cover
                      )
                    ),
                  ),
                ),

               ),
          ),
        )
      ],
    );
  }
}
