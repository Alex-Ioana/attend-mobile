import '../../domain/repositories/presence_repository.dart';

class MockPresenceRepository implements IPresenceRepository {
  @override
  Future<bool> verifyPresence(String qrData) async {
    // Simulate network delay and validation logic
    await Future.delayed(const Duration(seconds: 1));
    
    // In our mock, if the QR data isn't empty, we consider it a success
    // In reality, this would submit a claim to the attend-backend and receive an ephemeral perk or boolean.
    return qrData.isNotEmpty;
  }
}
