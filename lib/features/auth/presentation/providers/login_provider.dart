import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:san3a_app/features/auth/presentation/providers/get_auth_repo_provider.dart';

final loginProvider =
    FutureProvider.family<void, ({String email, String password})>((ref, data) {
      final authRepo = ref.read(getAuthRepoProvider);

      return authRepo.signInWithEmailAndPassword(
        email: data.email,
        password: data.password,
      );
    });
