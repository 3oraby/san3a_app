import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:san3a_app/core/extensions/either_extensions.dart';
import 'package:san3a_app/core/utils/success.dart';
import 'package:san3a_app/features/auth/presentation/providers/get_auth_repo_provider.dart';

final resendResetCodeProvider =
    AsyncNotifierProvider.autoDispose<ResendResetCodeNotifier, Success?>(
      ResendResetCodeNotifier.new,
    );

class ResendResetCodeNotifier extends AsyncNotifier<Success?> {
  @override
  Future<Success?> build() async {
    return null;
  }

  Future<void> resendResetCode({required String email}) async {
    state = const AsyncLoading();
    await ref
        .read(getAuthRepoProvider)
        .resendResetCode(email: email)
        .onSuccess((_) async {
          state = const AsyncData(Success());
        })
        .onFailure((l) {
          state = AsyncError(l, StackTrace.current);
        });
  }
}
