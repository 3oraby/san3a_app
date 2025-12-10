import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:san3a_app/features/auth/presentation/providers/get_auth_repo_provider.dart';

final signUpProvider = AsyncNotifierProvider.autoDispose<SignUpNotifier, void>(
  SignUpNotifier.new,
);

class SignUpNotifier extends AsyncNotifier<void> {
  SignUpNotifier();

  @override
  Future<void> build() async {
    state = const AsyncData(null);
  }

  Future<void> signUp({required Map<String, dynamic> data}) async {
    state = const AsyncLoading();
    try {
      await ref.read(getAuthRepoProvider).signUp(data: data);
      state = const AsyncData(null);
    } catch (err, st) {
      state = AsyncError(err, st);
    }
  }
}
