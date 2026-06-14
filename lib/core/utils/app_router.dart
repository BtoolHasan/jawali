import 'package:flutter/material.dart';
import 'package:jawali/features/auth/presentation/views/login_view.dart';
import 'package:jawali/features/auth/presentation/views/signup_view.dart';
import 'package:jawali/features/home/presentation/views/home_view.dart';


Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginView.name:
      return MaterialPageRoute(builder: (context) => const LoginView());
    case SignupView.name:
      return MaterialPageRoute(builder: (context) => const SignupView());
    case HomeView.name:
      return MaterialPageRoute(builder: (context) => const HomeView());
    default:
      return MaterialPageRoute(builder: (context) => const SignupView());
  }
}
