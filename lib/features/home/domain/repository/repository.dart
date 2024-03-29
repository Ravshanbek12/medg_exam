import 'package:medg_exam/features/home/domain/entity/entity.dart';

import '../../../../core/either/either.dart';
import '../../../../core/failure/failure.dart';

abstract class ArticleRepository{
  Future<Either<Failure, List<ArticleEntity>>> getData();
}