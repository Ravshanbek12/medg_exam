import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/exception/exception.dart';

abstract class AuthenticationDataSource {
  Future<User> getUser();
  Future<User> login(String email, String password);
  Future<User> singUp(String email, String password);
  Future<void> logOut();
  factory AuthenticationDataSource() =>
      _AuthenticationDataSourceImpl();
}

class _AuthenticationDataSourceImpl implements AuthenticationDataSource{
  @override
  Future<User> getUser() async {
    try {
      if (FirebaseAuth.instance.currentUser == null) {
        throw ServerException(errorMessage: "User is null", errorCode: "140");
      }
      return FirebaseAuth.instance.currentUser!;
    } on ServerException {
      rethrow;
    } catch (error) {
      throw ServerException(
        errorMessage: "$error",
        errorCode: "500",
      );
    }
  }
  @override
  Future<void> logOut() async{
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      ServerException(errorMessage: "Cannot logout the user", errorCode: "500");
    }
  }

  @override
  Future<User> login(String email, String password)async {
    try {
      final response = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return await getUser();
    } on ServerException {
      rethrow;
    } catch (error) {
      throw ServerException(errorMessage: "$error", errorCode: "500");
    }
  }

  @override
  Future<User> singUp(String email, String password)async {
    try {
      final response = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return FirebaseAuth.instance.currentUser!;
    } catch (e) {
      throw ServerException(errorMessage: "message", errorCode: "500");
    }
  }
}