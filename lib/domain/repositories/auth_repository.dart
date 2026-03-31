import '../models/auth_models.dart';

abstract class IAuthRepository {
  Future<User?> getCurrentUser();
  Future<User> loginAs(UserRole role);
  Future<void> logout();
}
