import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class JsonParseSimple extends StatefulWidget {
  @override
  _JsonParseSimpleState createState() => _JsonParseSimpleState();
}

class _JsonParseSimpleState extends State<JsonParseSimple> {
  Future data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = getData();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Json Parse'),
        backgroundColor: Colors.blue.shade400,
      ),
      body: Center(
        child: Container(
          child: FutureBuilder(
            future: getData(),
            builder: (context,AsyncSnapshot snapshot){
              if(snapshot.hasData) {
                return createListView(snapshot.data,context);
                // return Text(snapshot.data[0]['userId'].toString());
              }
              return CircularProgressIndicator();
            },),
        ),
      ),
    );
  }

  Future getData(){
    var data;
    String url = "posts";
    Network network = Network(url);
    data = network.fetchData();
    // data.then(
    //     (value){
    //       print(value[0]['title']);
    //     }
    // );
     return data;
  }

  Widget createListView(List data, BuildContext context) {
    return Container(
      child: ListView.builder(itemCount: data.length,itemBuilder: (context,int index){
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Divider(height: 5,),
            ListTile(
              title: Text("${data[index]["title"]}"),
              subtitle: Text("${data[index]["body"]}"),
              leading: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.black26,
                    radius: 23,
                    child: Text("${data[index]['id']}"),
                  )
                ],
              ),
            )
          ],
        );
      }),
    );
  }

}

class Network{
  final String url;

  Network(this.url);
  Future fetchData() async{
    print("${url}");
    var response = await http.get(Uri.https('jsonplaceholder.typicode.com', url));
    
    if (response.statusCode == 200){
        return json.decode(response.body);
    }else{
      print(response.statusCode);
    }
  }
}
