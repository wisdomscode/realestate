import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:realestate/models/post_model.dart';
import 'package:http/http.dart' as http;
import 'package:realestate/widgets/button_widget.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  // Fetch data from an api

  Future<List<PostModel>> fetchPosts() async {
    List<PostModel> allPosts = [];

    String url = "https://jsonplaceholder.typicode.com/posts";

    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var responseBody = jsonDecode(response.body);

      print(responseBody);
      for (var post in responseBody) {
        allPosts.add(PostModel.fromJson(post));
      }
    } else {
      throw Exception('Failed to fetch posts');
    }

    return allPosts;
  }

  Future sendPost() async {
    final String url = "https://jsonplaceholder.typicode.com/posts/create";

    var response = await http.post(
      Uri.parse(url),
      body: jsonEncode({
        'userId': '3',
        "title": "A new post",
        "body": "Body of my post",
      }),
    );

    if (response.statusCode == 200) {
      print('Post created successfully');
    } else {
      print('Post failed to create');
    }
  }

  @override
  void initState() {
    super.initState();
    // fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: fetchPosts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else if (snapshot.hasData == false) {
          return Center(
            child: Text('No data available'),
          );
        } else {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final PostModel post = snapshot.data![index];

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 10,
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text(
                        post.title.substring(0, 1).toUpperCase(),
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                    title: Text(post.title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(post.body.substring(0, 50)),
                        SizedBox(height: 15),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('View'),
                          style: ElevatedButton.styleFrom(foregroundColor: Colors.white, backgroundColor: Colors.black),
                        ),
                      ],
                    ),
                    trailing: IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border)),
                  ),
                ),
              );
            },
          );
        }
      },
    ));
  }
}
