// import 'dart:convert';
import 'package:https/core/models/post.dart';
import 'package:http/http.dart';

class User {
  final url = 'https://jsonplaceholder.typicode.com/users';

  fetchPosts() async {
    try {
      final response = await get(Uri.parse(url));

      if (response.statusCode == 200) {
        final List<Post> posts = postFromJson(response.body);
        print(post);
        return posts;
      } else {
        return "An error occured";
      }
      // final data = jsonDecode(response.body);
      // return data;
    } catch (err) {
      // return;
    }
  }

  postData(Map<String, dynamic> json) async {
    try {
      final res = await post(Uri.parse(url), body: json);
      print(res.body);
      return json;
    } catch (err) {}
  }
}
