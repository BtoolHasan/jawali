import 'package:flutter/material.dart';
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
    return SafeArea(
      child: Scaffold(
        body: SignupScreen(
          onLoginTap:  () => Navigator.pushReplacementNamed(
                      context,
                      LoginView.name,
                    ),
          onTermsTap: () {},
          onPrivacyTap: () {},
        ),
      ),
    );
  }
}
