import 'package:medg_exam/core/either/either.dart';
import 'package:medg_exam/core/failure/failure.dart';
import 'package:medg_exam/features/home/data/data_source/data_source.dart';
import 'package:medg_exam/features/home/domain/entity/entity.dart';

import '../../domain/repository/repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final ArticleDataSource _dataSource;

  ArticleRepositoryImpl({required ArticleDataSource dataSource})
      : _dataSource = dataSource;

  @override
  Future<Either<Failure, List<ArticleEntity>>> getData() async{
    try {
      final result = await _dataSource.getData();
      return Right(result);
    } catch (e) {
      return Left(
        const ServerFailure(),
      );
    }
  }
}
