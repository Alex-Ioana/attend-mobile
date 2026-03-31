import '../../domain/models/auth_models.dart';
import '../../domain/models/content_models.dart';
import '../../domain/repositories/event_repository.dart';

class MockEventRepository implements IEventRepository {
  @override
  Future<List<CuratorProfile>> getCurators() async {
    await Future.delayed(const Duration(milliseconds: 600));
    return const [
      CuratorProfile(
        id: 'c1',
        userId: 'u1',
        handle: 'Vika Ray',
        bio: 'Tech house & melodic techno.',
        followersCount: 1200,
        fansCount: 450,
        eventsCount: 22,
        isVerified: true,
        residentAt: 'Watergate',
      ),
      CuratorProfile(
        id: 'c2',
        userId: 'u2',
        handle: 'DJ Neon',
        bio: 'Currently At: Berghain. My Pulse: Heavy House & Intimate Booths.',
        followersCount: 2400,
        fansCount: 890,
        eventsCount: 47,
        isVerified: true,
        residentAt: 'Berghain',
      ),
      CuratorProfile(
        id: 'c3',
        userId: 'u3',
        handle: 'Kira Void',
        bio: 'Dark wave and synth pop.',
        followersCount: 880,
        fansCount: 210,
        eventsCount: 15,
        isVerified: false,
        residentAt: 'Tresor',
      ),
      CuratorProfile(
        id: 'c4',
        userId: 'u4',
        handle: 'Axel',
        bio: 'Industrial techno sounds.',
        followersCount: 5040,
        fansCount: 1200,
        eventsCount: 88,
        isVerified: true,
        residentAt: 'Onyx Club',
      ),
    ];
  }

  @override
  Future<List<Shoutout>> getLiveShoutouts() async {
    await Future.delayed(const Duration(milliseconds: 800));
    return [
      Shoutout(
        id: 's1',
        curatorId: 'c2',
        curatorName: 'DJ Neon',
        curatorAvatar: 'https://i.pravatar.cc/150?u=c2',
        content: 'Side door is open tonight. Skip the main line, alley entrance is your move. Vibe is unreal right now 🔥',
        postedAt: DateTime.now().subtract(const Duration(minutes: 15)),
        likesCount: 142,
        commentsCount: 23,
        isLive: true,
      ),
      Shoutout(
        id: 's2',
        curatorId: 'c1',
        curatorName: 'Vika Ray',
        curatorAvatar: 'https://i.pravatar.cc/150?u=c1',
        content: 'Watergate is at capacity. If you don\'t have a verified reservation, don\'t bother. We are going until 8 AM.',
        postedAt: DateTime.now().subtract(const Duration(minutes: 45)),
        likesCount: 304,
        commentsCount: 12,
        isLive: true,
      ),
      Shoutout(
        id: 'a1',
        curatorId: 'sp1',
        curatorName: 'Onyx Club (SPONSORED)',
        curatorAvatar: 'https://i.pravatar.cc/150?u=sp1',
        content: 'Exclusive Clubber Perk: First 50 verified scans tonight get a complimentary Mezcal shot. Entry strictly enforced.',
        postedAt: DateTime.now().subtract(const Duration(hours: 1)),
        likesCount: 890,
        commentsCount: 55,
        isLive: false,
      ),
      Shoutout(
        id: 's3',
        curatorId: 'c3',
        curatorName: 'Kira Void',
        curatorAvatar: 'https://i.pravatar.cc/150?u=c3',
        content: 'Synth pop warmup set starting downstairs in 10 minutes.',
        postedAt: DateTime.now().subtract(const Duration(hours: 1, minutes: 20)),
        likesCount: 45,
        commentsCount: 2,
        isLive: true,
      ),
      Shoutout(
        id: 's4',
        curatorId: 'c2',
        curatorName: 'DJ Neon',
        curatorAvatar: 'https://i.pravatar.cc/150?u=c2',
        content: 'Saturday\'s Secret Garden is going to be special. RSVP list is already filling up fast.',
        postedAt: DateTime.now().subtract(const Duration(hours: 2)),
        likesCount: 89,
        commentsCount: 5,
        isLive: false,
      ),
      Shoutout(
        id: 'a2',
        curatorId: 'sp2',
        curatorName: 'The Side Door',
        curatorAvatar: 'https://i.pravatar.cc/150?u=sp2',
        content: 'We are hosting an underground photography exhibition tomorrow prior to the main event. Clubbers get priority queueing.',
        postedAt: DateTime.now().subtract(const Duration(hours: 4)),
        likesCount: 210,
        commentsCount: 8,
        isLive: false,
      ),
    ];
  }

  @override
  Future<List<SpaceProfile>> getLocalSpaces() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return const [
      SpaceProfile(
        id: 'sp1',
        userId: 'u_sp1',
        name: 'Onyx Club',
        address: 'Köpenicker Str. 76, Berlin',
        description: 'Underground Club - Techno',
        capacity: 500,
        currentEnergy: 5, // Pulse 5/5
      ),
      SpaceProfile(
        id: 'sp2',
        userId: 'u_sp2',
        name: 'The Side Door',
        address: 'Mitte Alley 4, Berlin',
        description: 'Secret Garden & Mezcal',
        capacity: 100,
        currentEnergy: 4,
      ),
    ];
  }
}
