import 'package:http/http.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import '../model/post.dart';
import './list_view_posts.dart';

class ListData extends StatelessWidget {
  Future loadPost() async{
    Response resp = await get("https://jsonplaceholder.typicode.com/posts");
    print(resp.body);
    List<dynamic> data = json.decode(resp.body).cast<Map<String, dynamic>>();
    List<Post> posts = List();
    data.forEach((d){
      posts.add(Post.fromJson(d));
    });
    print(posts.length);
    print(posts.elementAt(20).title);
    return posts;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("ListData"),
      ),
      body: FutureBuilder(
        future: loadPost(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if(snapshot.hasError) print("load data error");
          return snapshot.hasData 
          ? ListViewPosts(posts: snapshot.data)
          : Center(
            child: CircularProgressIndicator(),
            );
        },
      )
    );
  }
}
