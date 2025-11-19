import 'package:san3a_app/core/models/error_model.dart';

class ServerException implements Exception {
  final ErrorModel errModel;

  const ServerException({required this.errModel});
}