/*
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ══════════════════════════════════════════════════════════
//  STATE
// ══════════════════════════════════════════════════════════
class LoginState {
  final String email;
  final String password;
  final bool rememberMe;
  final bool isLoading;
  final bool isGoogleLoading;
  final bool isAppleLoading;
  final String? emailError;
  final String? passwordError;
  final String? generalError;
  final bool obscurePassword;

  const LoginState({
    this.email = '',
    this.password = '',
    this.rememberMe = false,
    this.isLoading = false,
    this.isGoogleLoading = false,
    this.isAppleLoading = false,
    this.emailError,
    this.passwordError,
    this.generalError, 
    this.obscurePassword = false,
    
  });

  LoginState copyWith({
    String? email,
    String? password,
    bool? rememberMe,
    bool? isLoading,
    bool? isGoogleLoading,
    bool? isAppleLoading,
    String? emailError,
    String? passwordError,
    String? generalError,
    bool? obscurePassword,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      rememberMe: rememberMe ?? this.rememberMe,
      isLoading: isLoading ?? this.isLoading,
      isGoogleLoading: isGoogleLoading ?? this.isGoogleLoading,
      isAppleLoading: isAppleLoading ?? this.isAppleLoading,
      emailError: emailError,
      passwordError: passwordError,
      generalError: generalError,
      obscurePassword: obscurePassword ?? this.obscurePassword,
    );
  }
}

// ══════════════════════════════════════════════════════════
//  CUBIT
// ══════════════════════════════════════════════════════════
class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());

  // ─── Controllers ─────────────────────────────────────
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  

  // ─── Remember Me ─────────────────────────────────────
  void toggleRememberMe(bool? value) {
    emit(state.copyWith(rememberMe: value ?? false));
  }

  // ─── Forgot Password ─────────────────────────────────
  void onForgotPassword() {
    // TODO: navigate to ForgotPasswordScreen
  }
  void togglePasswordVisibility() {
  emit(state.copyWith(obscurePassword: !state.obscurePassword));
}

  // ─── Login ───────────────────────────────────────────
  Future<void> onLogin() async {
    if (!_validate()) return;

    emit(state.copyWith(isLoading: true));
    try {
      
      // TODO: inject AuthRepository and call login(email, password)
      // final result = await _authRepo.login(
      //   email: emailController.text.trim(),
      //   password: passwordController.text,
      // );
      // TODO: navigate to HomeScreen on success
    } catch (e) {
      emit(state.copyWith(isLoading: false, generalError: e.toString()));
    }
  }

  // ─── Google Sign-In ───────────────────────────────────
  Future<void> onGoogleSignIn() async {
    emit(state.copyWith(isGoogleLoading: true));
    try {
      // TODO: inject GoogleAuthService and call signIn()
    } catch (e) {
      emit(state.copyWith(isGoogleLoading: false, generalError: e.toString()));
    }
  }

  // ─── Apple Sign-In ────────────────────────────────────
  Future<void> onAppleSignIn() async {
    emit(state.copyWith(isAppleLoading: true));
    try {
      // TODO: inject AppleAuthService and call signIn()
    } catch (e) {
      emit(state.copyWith(isAppleLoading: false, generalError: e.toString()));
    }
  }

  // ─── Validation ───────────────────────────────────────
  bool _validate() {
    final email = emailController.text.trim();
    final password = passwordController.text;

    String? emailError;
    String? passwordError;

    if (email.isEmpty) {
      emailError = 'Email or phone number is required';
    }
    if (password.isEmpty) {
      passwordError = 'Password is required';
    } else if (password.length < 8) {
      passwordError = 'Password must be at least 8 characters';
    }

    emit(state.copyWith(emailError: emailError, passwordError: passwordError));
    return emailError == null && passwordError == null;
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
*/



import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jawali/features/auth/data/models/login_model.dart';
import 'package:jawali/features/auth/data/models/login_response.dart';
import 'package:jawali/features/auth/data/repo/auth_repo.dart';
import 'package:flutter/material.dart';

part 'login_state.dart'; 

class LoginCubit extends Cubit<LoginState> {
  final emailController = TextEditingController();

final passwordController = TextEditingController();
  LoginCubit(this.authRepo) : super(LoginInitial());
  final AuthRepo authRepo;


  bool validateFields() {
  String? emailError;
  String? passwordError;

  if (emailController.text.trim().isEmpty) {
    emailError = "Email is required";
  }

  if (passwordController.text.trim().isEmpty) {
    passwordError = "Password is required";
  }

  if (emailError != null || passwordError != null) {
    emit(
      LoginValidationError(
        emailError: emailError,
        passwordError: passwordError,
      ),
    );

    return false;
  }

  return true;
}

  Future<void> loginRequest() async {
  if (!validateFields()) {
    return;
  }

  emit(LoginLoading());

  final result = await authRepo.loginRequest(
    loginModel: LoginModel(
      email: emailController.text.trim(),
      passowrd: passwordController.text,
    ),
  );

  result.fold(
    (failuer) {
      emit(LoginFailuer(failuer.errorMessage));
    },
    (response) {
      emit(LoginSuccess(response));
    },
  );
}

@override
Future<void> close() {
  emailController.dispose();
  passwordController.dispose();
  return super.close();
}

}
