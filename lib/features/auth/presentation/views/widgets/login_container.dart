import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jawali/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:jawali/features/auth/presentation/views/widgets/app_text_field.dart';

class LoginContainer extends StatelessWidget {
  
  const LoginContainer({super.key});

  @override
  Widget build(BuildContext context) {
    String? emailError;
String? passwordError;

    return BlocBuilder<LoginCubit, LoginState>(
      
      builder: (context, state) {
        if (state is LoginValidationError) {
  emailError = state.emailError;
  passwordError = state.passwordError;
}
        final cubit = context.read<LoginCubit>();

        return Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.06),
                blurRadius: 20,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTextField(
  controller: cubit.emailController,
  hint: "Email or Phone Number",
  prefixIcon: Icons.mail_outline_rounded,
  errorText: emailError,
),

              const SizedBox(height: 16),

              // ─── Password Field ────────────────────────────────────
AppTextField(
  controller: cubit.passwordController,
  hint: "Password",
  prefixIcon: Icons.lock_outline_rounded,
  obscureText: true,
  errorText: passwordError,
),
              const SizedBox(height: 16),

              // ─── Remember Me + Forgot Password ────────────────────
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /*
                  Row(
                    children: [
                      SizedBox(
                        width: 22,
                        height: 22,
                        child: Checkbox(
                          value: state.rememberMe,
                          onChanged: cubit.toggleRememberMe,
                          activeColor: AppColors.cyan,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          side: const BorderSide(
                            color: AppColors.border,
                            width: 1.5,
                          ),
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text('Remember Me', style: AppTextStyles.bodySmall),
                    ],
                  ),
                  */

                  GestureDetector(
                    onTap: (){},
                    child: Text(
                      'Forgot Password?',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: const Color(0xFF06B6D4),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
