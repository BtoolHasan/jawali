import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jawali/core/providers/login_info_provider.dart';
import 'package:jawali/features/auth/data/models/login_model.dart';
import 'package:jawali/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:jawali/features/auth/presentation/views/signup_view.dart';
import 'package:jawali/features/auth/presentation/views/widgets/login_button.dart';
import 'package:jawali/features/auth/presentation/views/widgets/login_container.dart';
import 'package:jawali/features/auth/presentation/views/widgets/login_header.dart';
import 'package:jawali/features/auth/presentation/views/widgets/login_link.dart';
import 'package:jawali/features/auth/presentation/views/widgets/social_login_buttons.dart';
import 'package:jawali/features/auth/presentation/views/widgets/submit_button.dart';
import 'package:jawali/features/home/presentation/views/home_view.dart';
import 'package:provider/provider.dart';

class LoginBody extends StatelessWidget {
  const LoginBody();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          Navigator.pushReplacementNamed(context, HomeView.name);
        } else if (state is LoginLoading) {
        } else if (state is LoginFailuer) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(state.errorMessage),
            ),
          );
        }
      },
      builder: (BuildContext context, state) {
        return Scaffold(
          backgroundColor: const Color(0xFFF0F9FF),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // ── 1. Header: Logo + Welcome Back + subtitle ──────
                  const LoginHeader(),
                  const SizedBox(height: 32),

                  // ── 2. Form container ──────────────────────────────
                  const LoginContainer(),
                  const SizedBox(height: 24),

                  // ── 3. Login Button ────────────────────────────────
                  LoginButton(
                    text: "Login",
                    onTap: () {
                      context.read<LoginCubit>().loginRequest();
                    },
                  ),

                  const SizedBox(height: 24),

                  // ── 4. Social Buttons (Google / Apple) ─────────────
                  // const SocialLoginButtons(),
                  const SizedBox(height: 32),

                  // ── 5. Bottom text: Don't have an account? Sign Up ─
                  LoginLink(
                    onTap:
                        () => Navigator.pushReplacementNamed(
                          context,
                          SignupView.name,
                        ),
                    text1: "Don't have an account? ",
                    text2: 'Sign Up',
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
