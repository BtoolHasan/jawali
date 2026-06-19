import 'package:flutter/material.dart';
import 'package:jawali/core/providers/cart_provider.dart';
import 'package:jawali/core/service/get_it.dart';
import 'package:jawali/core/utils/app_router.dart';

import 'package:jawali/features/auth/presentation/views/signup_view.dart';

import 'package:provider/provider.dart';

void main() {
  setupGetIt();

  runApp(
    ChangeNotifierProvider(create: (_) => CartProvider(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      onGenerateRoute: onGenerateRoute,
      home: const SignupView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
