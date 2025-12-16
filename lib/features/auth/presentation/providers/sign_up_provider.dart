import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:san3a_app/core/extensions/either_extensions.dart';
import 'package:san3a_app/core/utils/success.dart';
import 'package:san3a_app/features/auth/presentation/providers/get_auth_repo_provider.dart';

final signUpProvider =
    AsyncNotifierProvider.autoDispose<SignUpNotifier, Success?>(
      SignUpNotifier.new,
    );

class SignUpNotifier extends AsyncNotifier<Success?> {
  @override
  Future<Success?> build() async {
    return null;
  }

  Future<void> signUp({required Map<String, dynamic> data}) async {
    state = const AsyncLoading();
    await ref
        .read(getAuthRepoProvider)
        .signUp(data: data)
        .onSuccess((_) async {
          state = const AsyncData(Success());
        })
        .onFailure((l) {
          state = AsyncError(l, StackTrace.current);
        });
  }
}
