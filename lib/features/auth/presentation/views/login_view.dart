import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jawali/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:jawali/features/auth/presentation/views/widgets/login_body.dart';

class LoginView extends StatelessWidget {
  static const String name = 'LoginView';
  const LoginView({super.key});
 
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(),
      child: const LoginBody(),
    );
  }
}