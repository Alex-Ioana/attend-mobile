import '../models/auth_models.dart';
import '../models/content_models.dart';

abstract class IEventRepository {
  Future<List<CuratorProfile>> getCurators();
  Future<List<Shoutout>> getLiveShoutouts();
  Future<List<SpaceProfile>> getLocalSpaces();
}
