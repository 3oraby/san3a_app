import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:san3a_app/core/widgets/undefined_route_page.dart';

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

    default:
      return MaterialPageRoute(
        builder: (context) => const UndefinedRoutePage(),
      );
  }
}
