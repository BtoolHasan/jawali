import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jawali/core/utils/constant.dart';
import 'package:jawali/core/widgets/app_button_nav_bar.dart';
import 'package:jawali/core/widgets/app_drawer.dart';
import 'package:jawali/core/widgets/app_top_bar.dart';
import 'package:jawali/features/home/data/repo/home_rerpo_impl.dart';
import 'package:jawali/features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:jawali/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatefulWidget {
  static const String name = 'homeView';
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(HomeRepoImpl()),
      child: Scaffold(
        backgroundColor: AppColors.white,
        drawer: const AppDrawer(),
        appBar: const AppTopBar(),
        body: const HomeViewBody(),
        bottomNavigationBar: AppBottomNavBar(
          currentIndex: _currentNavIndex,
          
        ),
      ),
    );
  }
}
