import '../../domain/models/auth_models.dart';
import '../../domain/repositories/auth_repository.dart';

class MockAuthRepository implements IAuthRepository {
  User? _currentUser;

  @override
  Future<User?> getCurrentUser() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _currentUser;
  }

  @override
  Future<User> loginAs(UserRole role) async {
    await Future.delayed(const Duration(milliseconds: 800));
    
    switch (role) {
      case UserRole.clubber:
        _currentUser = const User(
          id: 'clubber_1',
          name: 'Alex C.',
          role: UserRole.clubber,
          avatarUrl: 'https://i.pravatar.cc/150?u=clubber_1',
        );
        break;
      case UserRole.curator:
        _currentUser = const User(
          id: 'curator_1',
          name: 'DJ Neon',
          role: UserRole.curator,
          avatarUrl: 'https://i.pravatar.cc/150?u=curator_1',
        );
        break;
      case UserRole.space:
        _currentUser = const User(
          id: 'space_1',
          name: 'Onyx Club',
          role: UserRole.space,
          avatarUrl: 'https://i.pravatar.cc/150?u=space_1',
        );
        break;
    }
    return _currentUser!;
  }

  @override
  Future<void> logout() async {
    await Future.delayed(const Duration(milliseconds: 300));
    _currentUser = null;
  }
}
