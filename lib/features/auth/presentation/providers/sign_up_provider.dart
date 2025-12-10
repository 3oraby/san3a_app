import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:san3a_app/features/auth/presentation/providers/get_auth_repo_provider.dart';

final signUpProvider = FutureProvider.family<void, Map<String, dynamic>>((
  ref,
  data,
) {
  final authRepo = ref.read(getAuthRepoProvider);

  return authRepo.signUp(data: data);
});
