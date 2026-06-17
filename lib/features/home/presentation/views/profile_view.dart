import 'package:flutter/material.dart';
import 'package:jawali/core/utils/constant.dart';
import 'package:jawali/features/home/presentation/views/widgets/profile_body.dart';


 
class ProfileView extends StatelessWidget {
  static const String name = '/profile';
 
  const ProfileView({super.key});
 
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.white,
      body: ProfileBody(),
    );
  }
}