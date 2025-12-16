import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:san3a_app/core/api/api_keys.dart';
import 'package:san3a_app/core/api/end_points.dart';
import 'package:san3a_app/core/constants/locale_keys.dart';
import 'package:san3a_app/core/constants/storage_keys.dart';
import 'package:san3a_app/core/enums/role.dart';
import 'package:san3a_app/core/errors/failures.dart';
import 'package:san3a_app/core/extensions/either_extensions.dart';
import 'package:san3a_app/core/helpers/app_storage_helper.dart';
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
      backendMessageMapping: {
        "Invalid credentials": LocaleKeys.messagesFailuresIncorrectCredentials,
        "Email verification required. A new verification link has been sent to your email.":
            LocaleKeys.messagesFailuresInactiveUser,
      },
    ).onSuccess((data) async {
      log("user data: ${data.toString()}");
      final accessToken = data[ApiKeys.accessToken];
      await AppStorageHelper.setSecureData(
        StorageKeys.accessToken,
        accessToken,
      );

      log("access token is saved in secure data");
      await AppStorageHelper.setBool(StorageKeys.isLoggedIn, true);

      // await saveJsonDataLocally(
      //   storageKey: StorageKeys.currentUser,
      //   json: result["data"]["account"],
      // );

      final userRole = data["data"]["user"]["role"];
      log("save current role: $userRole");
      await AppStorageHelper.setString(StorageKeys.userRole, userRole);
    }).asVoid();
  }

  @override
  Future<Either<Failure, void>> signUp({
    required Map<String, dynamic> data,
  }) async {
    final userRole = AppStorageHelper.getString(StorageKeys.userRole);

    log("user role: $userRole");
    final endPoint = userRole == Role.customer.name
        ? EndPoints.customerSignUp
        : EndPoints.craftmanSignUp;

    return handleApi(
      () => api.post(endPoint, data: data),
      backendMessageMapping: {
        'National ID already exists':
            LocaleKeys.messagesFailuresNationalIdAlreadyExists,
        'Username \'${data['email'].split('@')[0]}\' is already taken.':
            LocaleKeys.messagesFailuresAccountAlreadyExists,
      },
    ).onSuccess((_) async {
      await AppStorageHelper.setString(StorageKeys.userEmail, data['email']);
    }).asVoid();
  }

  @override
  Future<Either<Failure, void>> verifyEmail({
    required String email,
    required String otp,
  }) async {
    await handleApi(
      () => api.get(
        EndPoints.verifyEmail,
        queryParameters: {ApiKeys.token: otp},
        data: {ApiKeys.email: email},
      ),
      backendMessageMapping: {
        "Verification code has expired":
            LocaleKeys.messagesFailuresInvalidOrExpiredCode,
        "Invalid or expired verification code":
            LocaleKeys.messagesFailuresVerificationCodeNotFound,
      },
    ).onSuccess((result) async {
      final accessToken = result[ApiKeys.accessToken];
      await AppStorageHelper.setSecureData(
        StorageKeys.accessToken,
        accessToken,
      );

      await AppStorageHelper.setBool(StorageKeys.isLoggedIn, true);
    }).asVoid();

    return const Right(null);
  }

  @override
  Future<Either<Failure, void>> logOut() {
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
