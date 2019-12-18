
import 'dart:convert';
import './index.dart';
import '../../helper/Api_service.dart';

class PostProvider {
  final _api = ApiService();

  // Fetch List of Post
  Future<List<Post>> fetchPosts(int startIndex, int limit) async {

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

  // Fetch Detail of Post
  Future<Post> fetchPostDetail(int postId) async {

    final response = await _api.getNoAuth('posts/$postId');

    if (response.statusCode == 200) {
      final data = json.decode(response.body) as Map;
      
      return Post(
        id: data['id'],
        title: data['title'],
        body: data['body'],
      );

    } else {
      throw Exception('error fetching post detail');
    }
  }
}