import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../shimmer.dart';

// Define a model class for the data
class Post {
  final int id;
  final String title;
  final String body;

  Post({
    required this.id,
    required this.title,
    required this.body,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}

class NewsPage extends StatelessWidget {
  final String apiUrl = "https://jsonplaceholder.typicode.com/posts";

  Future<List<Post>> fetchPosts() async {
    var result = await http.get(Uri.parse(apiUrl));
    if (result.statusCode == 200) {
      List<dynamic> body = jsonDecode(result.body);
      List<Post> posts = body.map((dynamic item) => Post.fromJson(item)).toList();
      return posts;
    } else {
      throw Exception('Failed to fetch posts');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body:


        Center(
          child:
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              skeleton(
                height: 200,
                width: 20,
              ),
            ],

          ),


          // child: FutureBuilder<List<Post>>(
          //   future: fetchPosts(),
          //   builder: (context, snapshot) {
          //     if (snapshot.hasData) {
          //       List<Post>? posts = snapshot.data;
          //       return ListView.builder(
          //         itemCount: posts!.length,
          //         itemBuilder: (context, index) {
          //           return ListTile(
          //             title: Text(posts[index].title),
          //             subtitle: Text(posts[index].body),
          //           );
          //         },
          //       );
          //     } else if (snapshot.hasError) {
          //       return Text('${snapshot.error}');
          //     }
          //     return CircularProgressIndicator();
          //   },
          // ),
        ),
      ),
    );
  }
}

void main() {
  runApp(NewsPage());
}
