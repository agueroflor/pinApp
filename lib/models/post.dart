import 'package:equatable/equatable.dart';

class Post extends Equatable {
  final int id;
  final String title;
  final String body;
  bool isLiked;

  Post({
    required this.id,
    required this.title,
    required this.body,
    this.isLiked = false
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  @override
  List<Object?> get props => [id, title];
}