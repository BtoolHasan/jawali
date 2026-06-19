import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jawali/core/service/get_it.dart';
import 'package:jawali/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:jawali/features/auth/presentation/views/login_view.dart';
import 'package:jawali/features/auth/presentation/views/signup_view.dart';
import 'package:jawali/features/home/data/models/home_model.dart';
import 'package:jawali/features/home/presentation/views/home_view.dart';
import 'package:jawali/features/home/presentation/views/profile_view.dart';
import 'package:jawali/features/home/presentation/views/search_view.dart';
import 'package:jawali/features/shop/data/models/cart_item.dart';
import 'package:jawali/features/shop/presentation/views/cart_view.dart';
import 'package:jawali/features/shop/presentation/views/order_confirmed_view.dart';
import 'package:jawali/features/shop/presentation/views/product_details.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginView.name:
      return MaterialPageRoute(
        builder:
            (context) => BlocProvider(
              create: (_) => getIt<LoginCubit>(),
              child: const LoginView(),
            ),
      );
    case SignupView.name:
      return MaterialPageRoute(builder: (context) => const SignupView());
    case HomeView.name:
      return MaterialPageRoute(builder: (context) => const HomeView());
    case SearchView.name:
      return MaterialPageRoute(builder: (_) => const SearchView());
    case CartView.name:
      return MaterialPageRoute(builder: (_) => const CartView());
    case ProfileView.name:
      return MaterialPageRoute(builder: (_) => const ProfileView());
    case ProductDetailsView.name:
  final phone = settings.arguments as PhoneModel;

  return MaterialPageRoute(
    builder: (_) => ProductDetailsView(phone: phone),
  );
    case OrderConfirmedView.name:
      // البيانات تأتي من CartView عبر arguments
      final args = settings.arguments as Map<String, dynamic>;
      return MaterialPageRoute(
        builder:
            (_) => OrderConfirmedView(
              items: args['items'] as List<CartItem>,
              orderNumber: args['orderNumber'] as String? ?? 'JW-10293',
              deliveryFrom: args['deliveryFrom'] as String? ?? 'Oct 24',
              deliveryTo: args['deliveryTo'] as String? ?? 'Oct 26',
            ),
      );
    default:
      return MaterialPageRoute(builder: (context) => const SignupView());
  }
}
