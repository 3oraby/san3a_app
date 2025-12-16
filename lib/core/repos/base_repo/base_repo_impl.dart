import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:san3a_app/core/api/api_consumer.dart';
import 'package:san3a_app/core/errors/exceptions.dart';
import 'package:san3a_app/core/errors/failures.dart';
import 'package:san3a_app/core/repos/base_repo/base_repo.dart';

class BaseRepoImpl implements BaseRepo {
  final ApiConsumer api;

  BaseRepoImpl({required this.api});

  @override
  Future<Either<Failure, T>> handleApi<T>(
    Future<T> Function() call, {
    Map<int, String>? statusCodeMessages,
    Map<String, String>? backendMessageMapping,
  }) async {
    try {
      final result = await call();
      return Right(result);
    } on ServerException catch (e) {
      log("Handling ServerException in BaseRepoImpl: ${e.errModel.message}");
      String message = e.errModel.message;

      log((backendMessageMapping?[message]).toString());
      if (backendMessageMapping != null &&
          backendMessageMapping.containsKey(message)) {
        message = backendMessageMapping[message] ?? message;
      }

      if (statusCodeMessages != null &&
          statusCodeMessages.containsKey(e.errModel.code)) {
        message = statusCodeMessages[e.errModel.code] ?? message;
      }

      return Left(CustomFailure(message: message));
    } catch (e) {
      log("Unhandled exception in BaseRepoImpl: $e");
      return const Left(CustomFailure());
    }
  }
}
