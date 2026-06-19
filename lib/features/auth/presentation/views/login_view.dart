import 'package:flutter/material.dart';

import 'package:jawali/features/auth/presentation/views/widgets/login_body.dart';

class LoginView extends StatelessWidget {
  static const String name = 'LoginView';
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: LoginBody()));
  }
}
