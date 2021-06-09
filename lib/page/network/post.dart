import 'dart:convert';
import 'package:equatable/equatable.dart';

List<Post> postFromJson(String str) => List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post extends Equatable {
  const Post({required this.id, required this.userId, required this.title, required this.body});

  final int id;
  final int userId;
  final String title;
  final String body;

  @override
  List<Object> get props => [id, userId, title, body];

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "body": body,
  };
}
