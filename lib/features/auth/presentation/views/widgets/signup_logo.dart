import 'package:flutter/material.dart';
import 'package:jawali/core/utils/constant.dart';

class SignupLogo extends StatelessWidget {
  const SignupLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: const Image(
        image: AssetImage('assets/images/logo.png'),
        width: 100,
        height: 100,
      ),
    );
  }
}
