import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:san3a_app/core/constants/storage_keys.dart';
import 'package:san3a_app/core/enums/role.dart';
import 'package:san3a_app/core/helpers/app_storage_helper.dart';
import 'package:san3a_app/core/utils/app_routes.dart';

navigateToHomeScreen(BuildContext context) {
  final String userRole =
      AppStorageHelper.getString(StorageKeys.userRole) ?? "";

  if (userRole == Role.customer.name) {
    Navigator.of(
      context,
    ).pushNamedAndRemoveUntil(Routes.customerHomeScreen, (route) => false);
  } else if (userRole == Role.craftman.name) {
    Navigator.of(
      context,
    ).pushNamedAndRemoveUntil(Routes.craftmanHomeScreen, (route) => false);
  } else {
    log("user role is not customer or craftman, go to initial auth");
    Navigator.of(
      context,
    ).pushNamedAndRemoveUntil(Routes.initialAuthScreen, (route) => false);
  }
}
