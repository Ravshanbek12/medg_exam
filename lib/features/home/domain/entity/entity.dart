import 'package:cloud_firestore/cloud_firestore.dart';

class ArticleEntity {
  final String title;
  final String description;
  final String auth;
  final String category;
  final Timestamp date;

  ArticleEntity({
    required this.title,
    required this.description,
    required this.auth,
    required this.category,
    required this.date,
  });
}
