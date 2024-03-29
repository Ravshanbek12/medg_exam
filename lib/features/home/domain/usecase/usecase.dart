import 'package:medg_exam/core/either/either.dart';
import 'package:medg_exam/core/failure/failure.dart';
import 'package:medg_exam/core/usecase/usecase.dart';
import 'package:medg_exam/features/home/domain/entity/entity.dart';
import 'package:medg_exam/features/home/domain/repository/repository.dart';

class ArticleUseCase implements UseCase<List<ArticleEntity>, NoParams> {
  final ArticleRepository _repositoryImpl;

  ArticleUseCase({required ArticleRepository repositoryImpl})
      : _repositoryImpl = repositoryImpl;

  @override
  Future<Either<Failure, List<ArticleEntity>>> call(NoParams param)async {
    if(param is GetDataArticle){
      print(_repositoryImpl.getData());
      return await _repositoryImpl.getData();
    }
    else {
      print("---------------------------------------UnimplementedError-------------------------------");
      throw UnimplementedError();
    }
  }
}

class GetDataArticle extends NoParams {}
