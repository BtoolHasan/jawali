import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:jawali/core/utils/api_service.dart';

import 'package:jawali/features/auth/data/models/signup_model.dart';
import 'package:jawali/features/auth/data/repo/auth_repo_impl.dart';

import 'package:jawali/features/auth/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:jawali/features/auth/presentation/views/login_view.dart';
import 'package:jawali/features/auth/presentation/views/widgets/signup_view_body.dart';

class SignupView extends StatefulWidget {
  static const String name = '/SignupView';
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignupCubit(AuthRepoImple(apiService: ApiService(Dio()))),
      child: BlocConsumer<SignupCubit, SignupState>(
        listener: (context, state) {
          if (state is SignupFailuer) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
          } else if (state is SignupSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.response.message ?? 'تم التسجيل بنجاح'),
              ),
            );
            Navigator.pushReplacementNamed(context, LoginView.name);
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              body: SignupScreen(
                isLoading: state is SignupLoading,
                onLoginTap:
                    () =>
                        Navigator.pushReplacementNamed(context, LoginView.name),
                onTermsTap: () {},
                onPrivacyTap: () {},
                // يُستدعى من SignupScreen بعد نجاح الـ Form validation
                // (Role و Phone تبقى في الواجهة فقط ولا تُرسل للـ API)
                onSignup: ({
                  required String name,
                  required String email,
                  required String password,
                  required String confirmPassword,
                }) {
                  context.read<SignupCubit>().signupRequest(
                    RegistrationModel(
                      name: name,
                      email: email,
                      password: password,
                      confirmPassowrd: confirmPassword,
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
