import '../../../../core/either/either.dart';
import '../../../../core/exception/exception.dart';
import '../../../../core/failure/failure.dart';
import '../../domain/entity/entity.dart';
import '../../domain/repository/repository.dart';
import '../data_source/data_source.dart';
import '../models/user.dart';

class AuthRepositoryImpl implements AuthRepository{
  final AuthenticationDataSource _dataSource;
  const AuthRepositoryImpl({required AuthenticationDataSource dataSource}):_dataSource=dataSource;

  @override
  Future<Either<Failure, AuthUserEntity>> getUser() async{
    try {
      final user = await _dataSource.getUser();
      return Right(AuthUserModel.fromFirebaseUser(user));
    } on ServerException catch (error) {
      return Left(ServerFailure(message: error.message, code: error.code));
    }
  }

  @override
  Future<Either<Failure, AuthUserEntity>> logIn(String email, String password)async {
    try {
      final user = await _dataSource.getUser();
      return Right(AuthUserModel.fromFirebaseUser(user));
    } on ServerException catch (error) {
      return Left(ServerFailure(message: error.message, code: error.code));
    }
  }

  @override
  Future<Either<Failure, void>> logOut() async{
    try {
      final response = await _dataSource.logOut();
      return Right(response);
    } on ServerException catch (error) {
      return Left(ServerFailure(message: error.message, code: error.code));
    }
  }

  @override
  Future<Either<Failure, AuthUserEntity>> signUp(String email, String password) async{
    try {
      final response = await _dataSource.singUp(email, password);
      return Right(AuthUserModel.fromFirebaseUser(response));
    } on ServerException catch (error) {
      return Left(ServerFailure(message: error.message, code: error.code));
    }
  }
}