import 'package:medg_exam/core/either/either.dart';
import 'package:medg_exam/core/failure/failure.dart';
import 'package:medg_exam/core/usecase/usecase.dart';
import 'package:medg_exam/features/authentication/domain/repository/repository.dart';

import '../entity/entity.dart';

class AuthUseCase implements UseCase<AuthUserEntity,Params>{

  final AuthRepository _repository;

  AuthUseCase(AuthRepository repository) : _repository = repository;

  @override
  Future<Either<Failure, AuthUserEntity>> call(Params param) {
    if (param is GetStatusParams) {
      return _repository.getUser();
    }
    else if (param is SingUpParams) {
    return _repository.signUp(param.email, param.password);
    } else if (param is LoginParams) {
    return _repository.logIn(param.email, param.password);
    } else {
    return throw UnimplementedError();
    }
  }

}
abstract class Params {}

class GetStatusParams extends Params {}

class LoginParams extends Params {
  final String email;
  final String password;

  LoginParams({
    required this.email,
    required this.password,
  });
}

class SingUpParams extends Params {
  final String email;
  final String password;

  SingUpParams({required this.email, required this.password});
}