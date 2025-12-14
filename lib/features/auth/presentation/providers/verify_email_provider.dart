import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:san3a_app/core/utils/success.dart';
import 'package:san3a_app/features/auth/presentation/providers/get_auth_repo_provider.dart';

final verifyEmailProvider =
    AsyncNotifierProvider.autoDispose<VerifyEmailNotifier, Success?>(
      VerifyEmailNotifier.new,
    );

class VerifyEmailNotifier extends AsyncNotifier<Success?> {
  @override
  Future<Success?> build() async {
    return null;
  }

  Future<void> verifyEmail({required String email, required String otp}) async {
    state = const AsyncLoading();
    final result = await ref
        .read(getAuthRepoProvider)
        .verifyEmail(email: email, otp: otp);
    result.fold(
      (l) => state = AsyncError(l, StackTrace.fromString(l.toString())),
      (r) => state = const AsyncData(Success()),
    );
  }
}
