
import 'dart:convert';
import 'package:http/http.dart' as http;
import './index.dart';

class PostProvider {

  Future<List<Post>> fetchPosts(int startIndex, int limit) async {
    final http.Client httpClient = http.Client();

    final response = await httpClient.get('https://jsonplaceholder.typicode.com/posts?_start=$startIndex&_limit=$limit');

    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List;
      return data.map((rawPost) {
        return Post(
          id: rawPost['id'],
          title: rawPost['title'],
          body: rawPost['body'],
        );
      }).toList();
    } else {
      throw Exception('error fetching posts');
    }
  }
}