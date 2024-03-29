import 'package:medg_exam/features/home/data/model/article.dart';
import 'package:medg_exam/features/home/domain/entity/entity.dart';

extension ArticleToArticleEntites on ArticleModel {
  ArticleEntity get toEntitiesArticle {
    return ArticleEntity(
        title: title,
        description: description,
        auth: auth,
        category: category,
        date: date);
  }
}
