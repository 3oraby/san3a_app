import 'package:dartz/dartz.dart';
import 'package:san3a_app/core/errors/failures.dart';

abstract class AuthRepo {
  Future<Either<Failure, void>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<Either<Failure, void>> signUp({required Map<String, dynamic> data});
  Future<Either<Failure, void>> logOut();

  Future<Either<Failure, void>> verifyEmail({
    required String email,
    required String code,
  });

  Future<Either<Failure, void>> resendVerifyOtp({required String email});

  Future<Either<Failure, void>> updateUserProfile({
    required Map<String, dynamic> data,
  });

  Future<Either<Failure, void>> updateBrandProfile({
    required Map<String, dynamic> data,
  });

  Future<Either<Failure, void>> forgetPassword({required String email});

  Future<Either<Failure, void>> verifyResetPassword({
    required String email,
    required String code,
  });

  Future<Either<Failure, void>> resetPassword({
    required String resetToken,
    required String email,
    required String code,
  });
}
