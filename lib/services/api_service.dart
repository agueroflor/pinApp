import 'package:dio/dio.dart';

import 'package:pin_app/utils/models.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<List<Post>> fetchPosts() async {
    final response = await _dio.get('https://jsonplaceholder.typicode.com/posts');
    return (response.data as List).map((post) => Post.fromJson(post)).toList();
  }

  Future<List<Comment>> fetchComments(int postId) async {
    final response = await _dio.get('https://jsonplaceholder.typicode.com/comments', queryParameters: {'postId': postId});
    return (response.data as List).map((comment) => Comment.fromJson(comment)).toList();
  }
}