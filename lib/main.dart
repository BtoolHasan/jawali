import 'package:flutter/material.dart';
import 'package:jawali/core/providers/cart_provider.dart';
import 'package:jawali/core/utils/app_router.dart';
import 'package:jawali/features/auth/presentation/views/login_view.dart';
import 'package:jawali/features/auth/presentation/views/signup_view.dart';
import 'package:jawali/features/home/presentation/views/home_view.dart';
import 'package:jawali/features/shop/presentation/views/cart_view.dart';
import 'package:jawali/features/shop/presentation/views/widgets/product_details_body.dart';
import 'package:provider/provider.dart';

void main() {
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
      home: const CartView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
