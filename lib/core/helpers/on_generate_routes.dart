import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:san3a_app/core/widgets/undefined_route_page.dart';
import 'package:san3a_app/core/utils/app_routes.dart';
import 'package:san3a_app/features/auth/presentation/screens/forget_password_screen.dart';
import 'package:san3a_app/features/auth/presentation/screens/initial_auth_screen.dart';
import 'package:san3a_app/features/auth/presentation/screens/login_screen.dart';
import 'package:san3a_app/features/auth/presentation/screens/reset_password_screen.dart';
import 'package:san3a_app/features/auth/presentation/screens/create_new_account_screen.dart';
import 'package:san3a_app/features/auth/presentation/screens/verify_forget_password_otp_screen.dart';
import 'package:san3a_app/features/customer_home/presentation/screens/customer_home_screen.dart';

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

    case Routes.createNewAccountScreen:
      return MaterialPageRoute(builder: (_) => const CreateNewAccountScreen());

    case Routes.forgetPasswordScreen:
      return MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());

    case Routes.resetPasswordScreen:
      return MaterialPageRoute(builder: (_) => const ResetPasswordScreen());

    case Routes.verifyForgetPasswordOtpScreen:
      return MaterialPageRoute(
        builder: (_) => const VerifyForgetPasswordOtpScreen(),
      );

    case Routes.customerHomeScreen:
      return MaterialPageRoute(builder: (_) => const CustomerHomeScreen());

    default:
      return MaterialPageRoute(
        builder: (context) => const UndefinedRoutePage(),
      );
  }
}
