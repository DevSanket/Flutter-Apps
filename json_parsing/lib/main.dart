import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:json_parsing/Posts.dart';

void main() {
  runApp(
    MaterialApp(
      home: JsonParsing(),
    )
  );
}


class JsonParsing extends StatefulWidget {
  @override
  _JsonParsingState createState() => _JsonParsingState();
}

class _JsonParsingState extends State<JsonParsing> {

  Future<PostList> data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Network network = Network("posts");
    data = network.loadPosts();
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JSON Parsing"),
      ),
      body: Center(
        child: Container(
          child: FutureBuilder(
            future: data,
            builder: (context,AsyncSnapshot<PostList> snapshot){
              List<Post> allPosts;
              if(snapshot.hasData){
                allPosts = snapshot.data.posts;
                return createView(allPosts, context);
              }else{
                return CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget createView(List<Post> data, BuildContext context) {
    return Container(
      child: ListView.builder(itemCount: data.length,itemBuilder: (context,int index){
      return Column(
        children: [
          ListTile(
            title: Text("${data[index].userId}"),
            subtitle: Text("${data[index].body}"),
            leading: Column(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.amber,
                  radius: 24,
                  child: Text("${data[index].id}"),
                )
              ],
            ),
          )
        ],
      );
    }

  ),
    );
  }
}

class Network{
  final String url;

  Network(this.url);

    Future<PostList> loadPosts() async{
      print("${url}");

      final response = await http.get(Uri.https('jsonplaceholder.typicode.com', url));
      if(response.statusCode == 200){
        print(response.body);
        return PostList.fromJson(json.decode(response.body));
      }else{
        throw Exception("Failed To Get Posts");
      }
    }

}



