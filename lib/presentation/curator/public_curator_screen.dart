import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../domain/models/auth_models.dart';
import '../../providers/event_providers.dart';
import '../../core/theme/app_colors.dart';
import '../../shared/widgets/shoutout_card.dart';

class PublicCuratorScreen extends ConsumerWidget {
  final CuratorProfile profile;

  const PublicCuratorScreen({super.key, required this.profile});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shoutoutsAsync = ref.watch(liveShoutoutsProvider);

    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, size: 20, color: AppColors.darkTextSecondary),
          onPressed: () => context.pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_horiz, color: AppColors.darkTextSecondary),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: AppColors.darkAccentPurple,
                    child: CircleAvatar(
                      radius: 38,
                      backgroundImage: NetworkImage('https://i.pravatar.cc/150?u=\${profile.id}'),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    profile.handle.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.darkTextPrimary,
                      letterSpacing: 2,
                    ),
                  ),
                  const SizedBox(height: 8),
                  if (profile.isVerified)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.verified, color: AppColors.darkAccentPurple, size: 14),
                        SizedBox(width: 4),
                        Text(
                          'Verified Curator',
                          style: TextStyle(color: AppColors.darkTextSecondary, fontSize: 12),
                        ),
                      ],
                    ),
                  const SizedBox(height: 16),
                  Text(
                    profile.bio ?? 'Resident at \${profile.residentAt}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: AppColors.darkTextSecondary, fontSize: 13, height: 1.5),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _StatBlock('\${(profile.followersCount / 1000).toStringAsFixed(1)}K', 'FOLLOWERS'),
                      _StatBlock('\${profile.fansCount}', 'FANS'),
                      _StatBlock('\${profile.eventsCount}', 'EVENTS'),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.darkAccentPurple,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                          onPressed: () {},
                          child: const Text('FOLLOW', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1)),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            foregroundColor: AppColors.darkAccentPurple,
                            side: const BorderSide(color: AppColors.darkAccentPurple),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                          onPressed: () {},
                          child: const Text('JOIN FANS', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    '— LATEST POSTS',
                    style: TextStyle(
                      color: AppColors.darkAccentPurple,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                      fontSize: 12,
                    ),
                  ),
                  Text('See all', style: TextStyle(color: AppColors.darkTextSecondary, fontSize: 12)),
                ],
              ),
            ),
            const SizedBox(height: 16),
            shoutoutsAsync.when(
              data: (shoutouts) {
                // Filter by this curator ID
                final curatorShoutouts = shoutouts.where((s) => s.curatorId == profile.id).toList();
                if (curatorShoutouts.isEmpty) {
                  return const Padding(
                    padding: EdgeInsets.all(24.0),
                    child: Text('No recent posts.', style: TextStyle(color: AppColors.darkTextSecondary)),
                  );
                }
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  itemCount: curatorShoutouts.length,
                  itemBuilder: (context, index) => ShoutoutCard(shoutout: curatorShoutouts[index]),
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, st) => Text('Error \$e'),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

class _StatBlock extends StatelessWidget {
  final String value;
  final String label;

  const _StatBlock(this.value, this.label);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.darkTextPrimary)),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 10, color: AppColors.darkTextSecondary, letterSpacing: 1)),
      ],
    );
  }
}
