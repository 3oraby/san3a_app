import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:san3a_app/core/utils/success.dart';
import 'package:san3a_app/features/auth/presentation/providers/get_auth_repo_provider.dart';

final signUpProvider =
    AsyncNotifierProvider.autoDispose<SignUpNotifier, Success?>(
      SignUpNotifier.new,
    );

class SignUpNotifier extends AsyncNotifier<Success?> {
  @override
  Future<Success?> build() async {
    log("build sign up provider");
    return null;
  }

  Future<void> signUp({required Map<String, dynamic> data}) async {
    state = const AsyncLoading();
    final result = await ref.read(getAuthRepoProvider).signUp(data: data);
    result.fold(
      (l) => state = AsyncError(l, StackTrace.fromString(l.toString())),
      (r) => state = const AsyncData(Success()),
    );
  }
}
