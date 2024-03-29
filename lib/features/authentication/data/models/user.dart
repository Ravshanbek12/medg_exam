import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/entity/entity.dart';

class AuthUserModel extends AuthUserEntity{
  AuthUserModel({required super.email,});

factory AuthUserModel.fromFirebaseUser(User user){
return AuthUserModel(email: user.email??"",);
}



}