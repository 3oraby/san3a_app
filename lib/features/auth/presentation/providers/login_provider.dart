import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:san3a_app/core/extensions/either_extensions.dart';
import 'package:san3a_app/core/utils/success.dart';
import 'package:san3a_app/features/auth/presentation/providers/get_auth_repo_provider.dart';

final loginProvider =
    AsyncNotifierProvider.autoDispose<LoginNotifier, Success?>(
      LoginNotifier.new,
    );

class LoginNotifier extends AsyncNotifier<Success?> {
  @override
  Future<Success?> build() async {
    return null;
  }

  Future<void> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();
    await ref
        .read(getAuthRepoProvider)
        .signInWithEmailAndPassword(email: email, password: password)
        .onSuccess((_) async {
          state = const AsyncData(Success());
        })
        .onFailure((l) {
          state = AsyncError(l, StackTrace.current);
        });
  }
}
