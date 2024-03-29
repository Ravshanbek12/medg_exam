import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/data_source/data_source.dart';
import '../../data/repository/repository.dart';
import '../../domain/entity/entity.dart';
import '../../domain/repository/repository.dart';
import '../../domain/usecase/usecase.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthenticationBloc
    extends Bloc<AuthentitationEvent, AuthenticationState> {
  AuthenticationBloc()
      : super(AuthenticationState(
          status: AuthenticationStatus.unknown,
          authenticatedUser: const AuthUserEntity(
            email: "",
          ),
        )) {
    on<AuthenticationGetStatusEvent>((event, emit) async {
      final usecase = AuthUseCase(
        AuthRepositoryImpl(
          dataSource: AuthenticationDataSource(),
        ) as AuthRepository,
      );
      final either = await usecase.call(GetStatusParams());
      either.either((failure) {
        emit(state.copyWith(status: AuthenticationStatus.unauthenticated));
      }, (user) {
        emit(state.copyWith());
        emit(state.copyWith(
            status: AuthenticationStatus.authenticated,
            authenticatedUser: user));
      });
      either.either((failure) {}, (user) {});
    });
    on<AuthenticationLogoutRequestedEvent>((event, emit) async {
      final usecase = await AuthUseCase(
          AuthRepositoryImpl(dataSource: AuthenticationDataSource())
              as AuthRepository
          // emit(state.copyWith(
          //   status: AuthenticationStatus.unauthenticated,
          );
      final either = await usecase.call(GetStatusParams());
      either.either((failure) {}, (user) {
        emit(state.copyWith(status: AuthenticationStatus.unauthenticated));
      });
    });

    on<AuthenticationLoginRequestEvent>((event, emit) async {
      final usecase = AuthUseCase(
          AuthRepositoryImpl(dataSource: AuthenticationDataSource())
              as AuthRepository);
      final either = await usecase
          .call(LoginParams(email: event.email, password: event.password));
      either.either(
        (failure) {
          emit(state.copyWith(status: AuthenticationStatus.unauthenticated));
          event.onFailure();
        },
        (value) {
          emit(
            state.copyWith(
              status: AuthenticationStatus.authenticated,
              authenticatedUser: value,
            ),
          );
          event.onSuccess();
        },
      );
    });
    on<AuthenticationSingUpRequested>((event, emit) async {
      final usecase = await AuthUseCase(
          AuthRepositoryImpl(dataSource: AuthenticationDataSource())
              as AuthRepository);
      final either = await usecase
          .call(SingUpParams(email: event.email, password: event.password));
      either.either((failure) {
        emit(state.copyWith(status: AuthenticationStatus.unauthenticated));
        event.onFailure();
      }, (user) {
        emit(state.copyWith(
            authenticatedUser: user,
            status: AuthenticationStatus.authenticated));
        event.onSuccess();
      });
    });
  }
}
