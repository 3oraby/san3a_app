import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:san3a_app/features/auth/domain/repos/auth_repo.dart';
import 'package:san3a_app/core/services/get_it_service.dart';

final getAuthRepoProvider = Provider<AuthRepo>((ref) {
  return getIt<AuthRepo>();
});
