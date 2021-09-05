import 'package:flutter/widgets.dart';
import 'package:https/core/models/post.dart';
import 'package:https/core/services/user.dart';

class UserProvider extends ChangeNotifier {
  final User userService = User();
  bool dataSent = false;
  List<Post> _post = [];
  List<Post> get post => _post;

  //! Post p =  Post.fromJson(jsondecode(result));

  postData() {
    var body = {
      'title': "Anything",
      'body': 'Post body',
      'userId': '1',
    };
    var res = userService.postData(body);
    if (res != null) {
      dataSent = true;
      notifyListeners();
    }
  }

  getPosts() async {
    final result = await userService.fetchPosts();
    if (result == "An error occured") {
      print('An error occured');
    } else {
      _post = result;
      notifyListeners();
    }
  }
}
