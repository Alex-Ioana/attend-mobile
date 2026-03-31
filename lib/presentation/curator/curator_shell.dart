import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/auth_providers.dart';
import '../../providers/event_providers.dart';
import '../../core/theme/app_colors.dart';
import '../../shared/widgets/shoutout_card.dart';

class CuratorTabNotifier extends Notifier<int> {
  @override
  int build() => 0;
  void setTab(int index) => state = index;
}

final curatorTabProvider = NotifierProvider<CuratorTabNotifier, int>(() => CuratorTabNotifier());

class CuratorShell extends ConsumerWidget {
  const CuratorShell({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTab = ref.watch(curatorTabProvider);
    final shoutoutsAsync = ref.watch(liveShoutoutsProvider);

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, dynamic result) {
        if (didPop) return;
        if (currentTab != 0) {
          ref.read(curatorTabProvider.notifier).setTab(0);
        } else {
          ref.read(authStateProvider.notifier).logout();
        }
      },
      child: Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, size: 20, color: AppColors.darkTextSecondary),
          onPressed: () => ref.read(authStateProvider.notifier).logout(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: AppColors.darkTextSecondary),
            onPressed: () {},
          )
        ],
      ),
      body: currentTab == 0 ? _buildViewTab(context, shoutoutsAsync) : _buildPlaceholderTab(currentTab),
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
          color: AppColors.darkSurfacePrimary.withOpacity(0.9),
          border: const Border(top: BorderSide(color: AppColors.darkSurfaceSecondary)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _CuratorNavIcon(icon: Icons.remove_red_eye, label: 'VIEW', isActive: currentTab == 0, onTap: () => ref.read(curatorTabProvider.notifier).setTab(0)),
            _CuratorNavIcon(icon: Icons.edit, label: 'EDIT', isActive: currentTab == 1, onTap: () => ref.read(curatorTabProvider.notifier).setTab(1)),
            _CuratorNavIcon(icon: Icons.bar_chart, label: 'STATS', isActive: currentTab == 2, onTap: () => ref.read(curatorTabProvider.notifier).setTab(2)),
            _CuratorNavIcon(icon: Icons.add_circle_outline, label: 'CONTENT', isActive: currentTab == 3, onTap: () => ref.read(curatorTabProvider.notifier).setTab(3)),
          ],
        ),
      ),
    ));
  }

  Widget _buildPlaceholderTab(int tab) {
    final titles = ['View', 'Edit Profile', 'Analytics Stats', 'Compose Content'];
    return Center(child: Text(titles[tab], style: const TextStyle(color: AppColors.darkTextPrimary)));
  }

  Widget _buildViewTab(BuildContext context, AsyncValue shoutoutsAsync) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundColor: AppColors.darkAccentPurple,
                  child: CircleAvatar(
                    radius: 38,
                    backgroundImage: NetworkImage('https://i.pravatar.cc/150?u=curator_1'),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'DJ NEON',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.darkTextPrimary,
                    letterSpacing: 2,
                  ),
                ),
                const SizedBox(height: 8),
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
                const Text(
                  'Berlin-based house & techno curator. Resident at Berghain. 10 years shaping the underground scene.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: AppColors.darkTextSecondary, fontSize: 13, height: 1.5),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    _StatBlock('2.4K', 'FOLLOWERS'),
                    _StatBlock('890', 'FANS'),
                    _StatBlock('47', 'EVENTS'),
                  ],
                ),
                const SizedBox(height: 8),
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
                  '— MY POSTS',
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
            data: (shoutouts) => ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 24),
              itemCount: shoutouts.length,
              itemBuilder: (context, index) => ShoutoutCard(shoutout: shoutouts[index]),
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, st) => Text('Error \$e'),
          ),
          const SizedBox(height: 40),
        ],
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

class _CuratorNavIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _CuratorNavIcon({
    required this.icon,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: isActive ? AppColors.darkAccentPurple : AppColors.darkTextSecondary),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              color: isActive ? AppColors.darkAccentPurple : AppColors.darkTextSecondary,
            ),
          )
        ],
      ),
    );
  }
}
