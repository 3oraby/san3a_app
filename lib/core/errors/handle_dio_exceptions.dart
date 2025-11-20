import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:san3a_app/core/errors/exceptions.dart';
import 'package:san3a_app/core/models/error_model.dart';

void handleDioExceptions(DioException e) {
  log("handle dio exceptions, exception is: ${e.toString()}");

  final data = e.response?.data;

  if (data is Map<String, dynamic>) {
    throw ServerException(errModel: ErrorModel.fromJson(data));
  }
  throw ServerException(
    errModel: ErrorModel(message: e.message ?? "Unknown error", code: 404),
  );
}
