import 'package:flutter/material.dart';
import 'package:jawali/core/utils/constant.dart';
import 'package:jawali/features/home/presentation/views/widgets/search_body.dart';

class SearchView extends StatefulWidget {
  static const String name = 'searchView';
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
     return const Scaffold(
      backgroundColor: AppColors.white,
      body: SearchBody(),
    );
  }
}