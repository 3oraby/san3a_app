import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:san3a_app/core/extensions/either_extensions.dart';
import 'package:san3a_app/core/utils/success.dart';
import 'package:san3a_app/features/auth/presentation/providers/get_auth_repo_provider.dart';

final forgetPasswordProvider =
    AsyncNotifierProvider.autoDispose<ForgetPasswordNotifier, Success?>(
      ForgetPasswordNotifier.new,
    );

class ForgetPasswordNotifier extends AsyncNotifier<Success?> {
  @override
  Future<Success?> build() async {
    return null;
  }

  Future<void> forgetPassword({required String email}) async {
    state = const AsyncLoading();
    await ref
        .read(getAuthRepoProvider)
        .forgetPassword(email: email)
        .onSuccess((_) async {
          state = const AsyncData(Success());
        })
        .onFailure((l) {
          state = AsyncError(l, StackTrace.current);
        });
  }
}
