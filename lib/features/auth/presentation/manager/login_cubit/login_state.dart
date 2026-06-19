part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final LoginResponse response;

  const LoginSuccess(this.response);

  @override
  List<Object?> get props => [response];
}

class LoginFailuer extends LoginState {
  final String errorMessage;

  const LoginFailuer(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

class LoginValidationError extends LoginState {
  final String? emailError;
  final String? passwordError;

  const LoginValidationError({
    this.emailError,
    this.passwordError,
  });

  @override
  List<Object?> get props => [
        emailError,
        passwordError,
      ];
}