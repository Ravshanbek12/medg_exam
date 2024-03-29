import 'package:cloud_firestore/cloud_firestore.dart';

class ArticleModel {
  final String title;
  final String description;
  final String auth;
  final String category;
  final Timestamp date;

  ArticleModel({
    required this.title,
    required this.description,
    required this.auth,
    required this.category,
    required this.date,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      title: json['title'],
      description: json['description'],
      auth: json['auth'],
      category: json['category'],
      date: json['date'],
    );
  }
}
