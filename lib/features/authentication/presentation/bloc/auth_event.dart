// ignore_for_file: public_member_api_docs, sort_constructors_first
part of "auth_bloc.dart";

abstract class AuthentitationEvent {}

class AuthenticationGetStatusEvent extends AuthentitationEvent {}

class AuthenticationLogoutRequestedEvent extends AuthentitationEvent {}

class AuthenticationLoginRequestEvent extends AuthentitationEvent {
  final String email;
  final String password;
  final VoidCallback onSuccess;
  final VoidCallback onFailure;
  AuthenticationLoginRequestEvent({
    required this.email,
    required this.password,
    required this.onSuccess,
    required this.onFailure,
  });
}

class AuthenticationSingUpRequested extends AuthentitationEvent {
  final String email;
  final String password;
  final VoidCallback onSuccess;
  final VoidCallback onFailure;
  AuthenticationSingUpRequested({
    required this.email,
    required this.password,
    required this.onSuccess,
    required this.onFailure,
  });
}
