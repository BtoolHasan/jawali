import 'package:flutter/material.dart';
import 'package:jawali/core/widgets/app_button_nav_bar.dart';
import 'package:jawali/core/widgets/app_top_bar.dart';

class SearchBody extends StatefulWidget {
  const SearchBody({super.key});

  @override
  State<SearchBody> createState() => _SearchBodyState();
}

class _SearchBodyState extends State<SearchBody> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [AppTopBar(), Spacer(), AppBottomNavBar(currentIndex: 2)],
      ),
    );
  }
}
