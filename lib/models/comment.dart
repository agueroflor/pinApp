import 'package:equatable/equatable.dart';

class Comment extends Equatable {
  final int id;
  final String name;
  final String body;

  const Comment({required this.id, required this.name, required this.body});

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id'],
      name: json['name'],
      body: json['body'],
    );
  }

  @override
  List<Object?> get props => [id, name, body];
}