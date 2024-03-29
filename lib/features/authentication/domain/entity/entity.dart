class AuthUserEntity{
final String email;

const AuthUserEntity({required this.email,});

@override
  String toString() {
    return 'AuthUserEntity{email: $email, }';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthUserEntity &&
          runtimeType == other.runtimeType &&
          email == other.email;

  @override
  int get hashCode => email.hashCode ;



AuthUserEntity copyWith({
    String? email,
    String? password,
  }) {
    return AuthUserEntity(
      email: email ?? this.email,
    );
  }
}