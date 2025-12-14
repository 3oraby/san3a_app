import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:san3a_app/core/constants/storage_keys.dart';
import 'package:san3a_app/core/helpers/app_storage_helper.dart';
import 'package:san3a_app/features/auth/presentation/screens/initial_auth_screen.dart';
import 'package:san3a_app/features/home/presentation/screens/home_screen.dart';

Widget getInitialRoute() {  
  final bool isLoggedIn =
      AppStorageHelper.getBool(StorageKeys.isLoggedIn) ?? false;

  log("get initial route, user isLoggedIn: $isLoggedIn");
  // if (isLoggedIn) {
  //   return const HomeScreen();
  // }
  return const InitialAuthScreen();
}
