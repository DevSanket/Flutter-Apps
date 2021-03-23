class PostList{
  final List<Post> posts;

  PostList(this.posts);

  factory PostList.fromJson(List<dynamic> parsedJson){
    List<Post> posts = new List<Post>();
    posts = parsedJson.map((data) => Post.fromJson(data)).toList();
    return new PostList(posts);
  }
}

class Post{
  int userId;
  int id;
  String title;
  String body;
  Post({this.userId, this.id, this.title, this.body});
  
  factory Post.fromJson(Map<String,dynamic> json){
    return Post(
        userId : json['userId'],
        id : json['id'],
        title: json['title'],
        body: json['body']);
  }

}