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
        data: {ApiKeys.emailOrUsername: email, ApiKeys.password: password},
      ),
      backendMessageMapping: {
        "Invalid credentials": LocaleKeys.messagesFailuresIncorrectCredentials,
        "Email verification required. A new verification link has been sent to your email.":
            LocaleKeys.messagesFailuresInactiveUser,
      },
    ).onSuccess((data) async {
      log("user data: ${data.toString()}");
      final accessToken = data[ApiKeys.token];
      await AppStorageHelper.setSecureData(
        StorageKeys.accessToken,
        accessToken,
      );

      await AppStorageHelper.setSecureData(
        StorageKeys.refreshToken,
        data[ApiKeys.refreshToken],
      );

      log("access token is saved in secure data");
      await AppStorageHelper.setBool(StorageKeys.isLoggedIn, true);

      // await saveJsonDataLocally(
      //   storageKey: StorageKeys.currentUser,
      //   json: result["data"]["account"],
      // );

      // TODO: update later after back update it
      final userRole = data["role"] ?? Role.customer.name;
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
    required String code,
  }) async {
    await handleApi(
      () => api.post(
        EndPoints.verifyEmail,
        data: {ApiKeys.email: email, ApiKeys.code: code},
      ),
      backendMessageMapping: {
        "Verification code has expired":
            LocaleKeys.messagesFailuresInvalidOrExpiredCode,
        "Invalid or expired verification code":
            LocaleKeys.messagesFailuresVerificationCodeNotFound,
      },
    ).onSuccess((result) async {
      // TODO: update later after back update it
      // final accessToken = result[ApiKeys.accessToken];
      // await AppStorageHelper.setSecureData(
      //   StorageKeys.accessToken,
      //   accessToken,
      // );

      await AppStorageHelper.setBool(StorageKeys.isLoggedIn, true);
    }).asVoid();

    return const Right(null);
  }

  @override
  Future<Either<Failure, void>> resendVerifyEmail({required String email}) {
    return handleApi(
      () => api.post(EndPoints.resendVerifyEmail, data: {ApiKeys.email: email}),
      backendMessageMapping: {
        "Invalid email": LocaleKeys.messagesFailuresInvalidEmail,
        "user already active": LocaleKeys.messagesFailuresUserAlreadyActive,
      },
    ).asVoid();
  }

  @override
  Future<Either<Failure, void>> logOut() {
    return handleApi(() => api.post(EndPoints.logOut)).asVoid();
  }

  @override
  Future<Either<Failure, void>> forgetPassword({required String email}) {
    return handleApi(
      () => api.post(EndPoints.forgetPassword, data: {ApiKeys.email: email}),
      backendMessageMapping: {
        "Invalid email": LocaleKeys.messagesFailuresInvalidEmail,
      },
    ).asVoid();
  }

  @override
  Future<Either<Failure, void>> verifyResetCode({
    required String email,
    required String code,
  }) {
    return handleApi(
      () => api.post(
        EndPoints.verifyResetCode,
        data: {ApiKeys.email: email, ApiKeys.code: code},
      ),
      backendMessageMapping: {
        "Invalid email": LocaleKeys.messagesFailuresInvalidEmail,
        "Invalid or expired verification code":
            LocaleKeys.messagesFailuresVerificationCodeNotFound,
      },
    ).asVoid();
  }

  @override
  Future<Either<Failure, void>> resendResetCode({required String email}) {
    return handleApi(
      () => api.post(EndPoints.resendResetCode, data: {ApiKeys.email: email}),
      backendMessageMapping: {
        "Invalid email": LocaleKeys.messagesFailuresInvalidEmail,
      },
    ).asVoid();
  }

  @override
  Future<Either<Failure, void>> resetPassword({
    required String newPassword,
    required String confirmPassword,
  }) {
    return handleApi(
      () => api.post(
        EndPoints.resetPassword,
        data: {
          ApiKeys.newPassword: newPassword,
          ApiKeys.confirmPassword: confirmPassword,
        },
      ),
      backendMessageMapping: {
        "Invalid email": LocaleKeys.messagesFailuresInvalidEmail,
        "Invalid or expired verification code":
            LocaleKeys.messagesFailuresVerificationCodeNotFound,
      },
    ).asVoid();
  }
}
