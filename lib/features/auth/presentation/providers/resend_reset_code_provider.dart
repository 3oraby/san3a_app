import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:san3a_app/features/auth/presentation/providers/get_auth_repo_provider.dart';

final resendResetCodeProvider = FutureProvider.autoDispose.family<void, String>(
  (ref, String email) async {
    await ref.read(getAuthRepoProvider).resendResetCode(email: email);
  },
);
