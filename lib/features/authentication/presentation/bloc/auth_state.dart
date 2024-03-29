// ignore_for_file: public_member_api_docs, sort_constructors_first

part of "auth_bloc.dart";

class AuthenticationState  {
  final AuthUserEntity authenticatedUser;
  final AuthenticationStatus status;
  AuthenticationState({
    required this.authenticatedUser,
    required this.status,
  });

  @override
  // TODO: implement props
  List<Object> get props => [authenticatedUser, status];

  AuthenticationState copyWith({
    AuthUserEntity? authenticatedUser,
    AuthenticationStatus? status,
  }) {
    return AuthenticationState(
      authenticatedUser: authenticatedUser ?? this.authenticatedUser,
      status: status ?? this.status,
    );
  }
}

enum AuthenticationStatus { unknown, unauthenticated, authenticated }
