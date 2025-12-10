import 'package:dartz/dartz.dart';
import 'package:san3a_app/core/api/api_keys.dart';
import 'package:san3a_app/core/api/end_points.dart';
import 'package:san3a_app/core/errors/failures.dart';
import 'package:san3a_app/core/repos/base_repo/base_repo_impl.dart';
import 'package:san3a_app/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends BaseRepoImpl implements AuthRepo {
  AuthRepoImpl({required super.api});

  @override
  Future<Either<Failure, void>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    return handleApi(
      () => api.post(
        EndPoints.login,
        data: {ApiKeys.email: email, ApiKeys.password: password},
      ),
    );
  }

  @override
  Future<Either<Failure, void>> signUp({required Map<String, dynamic> data}) {
    return handleApi(() => api.post(EndPoints.signUp, data: data));
  }

  @override
  Future<Either<Failure, void>> logOut() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> verifyOtp({
    required String email,
    required String code,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> resendVerifyOtp({required String email}) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> updateUserProfile({
    required Map<String, dynamic> data,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> updateBrandProfile({
    required Map<String, dynamic> data,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> forgetPassword({required String email}) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> verifyResetPassword({
    required String email,
    required String code,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> resetPassword({
    required String resetToken,
    required String email,
    required String code,
  }) {
    throw UnimplementedError();
  }
}
