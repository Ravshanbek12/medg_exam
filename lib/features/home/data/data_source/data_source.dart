import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medg_exam/core/extensions/extentions.dart';
import 'package:medg_exam/features/home/data/model/article.dart';
import 'package:medg_exam/features/home/domain/entity/entity.dart';

import '../../../../core/exception/exception.dart';

abstract class ArticleDataSource {
  Future<List<ArticleEntity>> getData();

  factory ArticleDataSource()=>_ArticleDataSource();
}


class _ArticleDataSource implements ArticleDataSource{
  @override
  Future<List<ArticleEntity>> getData()async {
    try{
      final result = await FirebaseFirestore.instance.collection("articles").get();
      final result2 = result.docs;
      final result3=[];
      for(int i=0;i<result2.length;i++){
        result3.add(result2[i].data());
      }
      print(result3);
      final response = (result3).map((e) => ArticleModel.fromJson(e)).toList();
      return response.map((e) => e.toEntitiesArticle).toList();
    }
    catch(e){
      print(e);
      throw ServerException(
        errorMessage: "",
        errorCode: "666",
      );
    }
  }

}
