import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:san3a_app/features/auth/presentation/providers/get_auth_repo_provider.dart';

final signUpProvider = AsyncNotifierProvider.autoDispose<SignUpNotifier, void>(
  SignUpNotifier.new,
);

class SignUpNotifier extends AsyncNotifier<void> {
  @override
  Future<void> build() async {
    log("message");
    state = const AsyncLoading();
  }

  Future<void> signUp({required Map<String, dynamic> data}) async {
    log("signUp");
    state = const AsyncData(null);
    state = const AsyncLoading();
    final result = await ref.read(getAuthRepoProvider).signUp(data: data);
    result.fold(
      (l) => state = AsyncError(l, StackTrace.fromString(l.toString())),
      (r) => state = const AsyncData(null),
    );
  }
}
