import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/mock/mock_event_repository.dart';
import '../domain/models/auth_models.dart';
import '../domain/models/content_models.dart';
import '../domain/repositories/event_repository.dart';

final eventRepositoryProvider = Provider<IEventRepository>((ref) {
  return MockEventRepository();
});

final curatorsProvider = FutureProvider<List<CuratorProfile>>((ref) async {
  final repo = ref.watch(eventRepositoryProvider);
  return repo.getCurators();
});

final liveShoutoutsProvider = FutureProvider<List<Shoutout>>((ref) async {
  final repo = ref.watch(eventRepositoryProvider);
  return repo.getLiveShoutouts();
});

final localSpacesProvider = FutureProvider<List<SpaceProfile>>((ref) async {
  final repo = ref.watch(eventRepositoryProvider);
  return repo.getLocalSpaces();
});
