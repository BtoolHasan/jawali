import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jawali/core/utils/app_router.dart';
import 'package:jawali/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:jawali/features/auth/presentation/views/signup_view.dart';
import 'package:jawali/features/auth/presentation/views/widgets/login_container.dart';
import 'package:jawali/features/auth/presentation/views/widgets/login_header.dart';
import 'package:jawali/features/auth/presentation/views/widgets/login_link.dart';
import 'package:jawali/features/auth/presentation/views/widgets/social_login_buttons.dart';
import 'package:jawali/features/auth/presentation/views/widgets/submit_button.dart';
import 'package:jawali/features/home/presentation/views/home_view.dart';

class LoginBody extends StatelessWidget {
  const LoginBody();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F9FF), // sky-50 — نفس signup
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
              BlocBuilder<LoginCubit, LoginState>(
                builder:
                    (context, state) => SubmitButton(
                      isLoading: state.isLoading,
                      onTap:
                          () => {
                            Navigator.pushReplacementNamed(
                              context,
                              HomeView.name,
                            ),
                            context.read<LoginCubit>().onLogin,
                          },
                      text: 'Login',
                    ),
              ),

              const SizedBox(height: 24),

              // ── 4. Social Buttons (Google / Apple) ─────────────
              const SocialLoginButtons(),
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
  }
}
