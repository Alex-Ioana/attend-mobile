import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/mock/mock_auth_repository.dart';
import '../domain/models/auth_models.dart';
import '../domain/repositories/auth_repository.dart';
import '../core/routing/app_router.dart';
import 'dart:async';

final authRepositoryProvider = Provider<IAuthRepository>((ref) {
  return MockAuthRepository();
});

final authStateProvider = AsyncNotifierProvider<AuthNotifier, User?>(() {
  return AuthNotifier();
});

class AuthNotifier extends AsyncNotifier<User?> {
  late final IAuthRepository _repository;

  @override
  FutureOr<User?> build() async {
    _repository = ref.watch(authRepositoryProvider);
    return await _repository.getCurrentUser();
  }

  Future<void> login(UserRole role) async {
    state = const AsyncLoading();
    try {
      final user = await _repository.loginAs(role);
      state = AsyncData(user);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> logout() async {
    state = const AsyncLoading();
    await _repository.logout();
    state = const AsyncData(null);
    appRouter.go('/auth'); // Route back to login
  }
}
