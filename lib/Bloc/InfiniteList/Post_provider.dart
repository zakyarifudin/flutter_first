
import 'dart:convert';
import './index.dart';
import '../../helper/Api_service.dart';

class PostProvider {

  Future<List<Post>> fetchPosts(int startIndex, int limit) async {
    final _api = ApiService();

    final response = await _api.getNoAuth('posts?_start=$startIndex&_limit=$limit');

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