import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:san3a_app/core/widgets/undefined_route_page.dart';
import 'package:san3a_app/core/utils/app_routes.dart';
import 'package:san3a_app/features/auth/presentation/screens/initial_auth_screen.dart';
import 'package:san3a_app/features/auth/presentation/screens/login_screen.dart';

Route<dynamic> onGenerateRoutes(RouteSettings settings, BuildContext context) {
  log("Navigating to ${settings.name}");

  switch (settings.name) {
    // case Routes.showProductScreen:
    //   final ProductDetailsArgs productDetailsArgs =
    //       settings.arguments as ProductDetailsArgs;
    //   return MaterialPageRoute(
    //     builder: (_) => BlocProvider.value(
    //       value: productDetailsArgs.cartCubit,
    //       child: ShowProductScreen(product: productDetailsArgs.product),
    //     ),
    //   );

    case Routes.initialAuthScreen:
      return MaterialPageRoute(builder: (_) => const InitialAuthScreen());

    case Routes.loginScreen:
      return MaterialPageRoute(builder: (_) => const LoginScreen());

    default:
      return MaterialPageRoute(
        builder: (context) => const UndefinedRoutePage(),
      );
  }
}
