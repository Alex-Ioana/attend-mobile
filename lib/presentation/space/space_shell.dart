import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/auth_providers.dart';
import '../../providers/event_providers.dart';
import '../../core/theme/app_colors.dart';
import '../../shared/widgets/shoutout_card.dart';
import 'package:go_router/go_router.dart';

class SpaceTabNotifier extends Notifier<int> {
  @override
  int build() => 0;
  void setTab(int index) => state = index;
}

final spaceTabProvider = NotifierProvider<SpaceTabNotifier, int>(() => SpaceTabNotifier());

class SpaceShell extends ConsumerWidget {
  const SpaceShell({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTab = ref.watch(spaceTabProvider);
    final shoutoutsAsync = ref.watch(liveShoutoutsProvider);

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, dynamic result) {
        if (didPop) return;
        if (currentTab != 0) {
          ref.read(spaceTabProvider.notifier).setTab(0);
        } else {
          context.go('/roles');
        }
      },
      child: Scaffold(
      backgroundColor: AppColors.darkBackground,
      body: currentTab == 0 ? _buildViewTab(context, ref, shoutoutsAsync) : _buildPlaceholderTab(currentTab),
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
          color: AppColors.darkSurfacePrimary.withOpacity(0.9),
          border: const Border(top: BorderSide(color: AppColors.darkSurfaceSecondary)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _SpaceNavIcon(icon: Icons.remove_red_eye, label: 'VIEW', isActive: currentTab == 0, onTap: () => ref.read(spaceTabProvider.notifier).setTab(0)),
            _SpaceNavIcon(icon: Icons.edit, label: 'EDIT', isActive: currentTab == 1, onTap: () => ref.read(spaceTabProvider.notifier).setTab(1)),
            _SpaceNavIcon(icon: Icons.bar_chart, label: 'STATS', isActive: currentTab == 2, onTap: () => ref.read(spaceTabProvider.notifier).setTab(2)),
            _SpaceNavIcon(icon: Icons.add_circle_outline, label: 'CONTENT', isActive: currentTab == 3, onTap: () => ref.read(spaceTabProvider.notifier).setTab(3)),
          ],
        ),
      ),
    ));
  }

  Widget _buildPlaceholderTab(int tab) {
    final titles = ['View', 'Edit Venue', 'Venue Analytics', 'Compose Content'];
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.transparent),
        body: Center(child: Text(titles[tab], style: const TextStyle(color: AppColors.darkTextPrimary)))
    );
  }

  Widget _buildViewTab(BuildContext context, WidgetRef ref, AsyncValue shoutoutsAsync) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 200.0,
          floating: false,
          pinned: true,
          backgroundColor: AppColors.darkSurfacePrimary,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, size: 20, color: Colors.white),
            onPressed: () => context.go('/roles'),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.more_horiz, color: Colors.white),
              onPressed: () {},
            )
          ],
          flexibleSpace: FlexibleSpaceBar(
            background: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(
                  'https://images.unsplash.com/photo-1566417713940-fe7c737a9ef2?auto=format&fit=crop&q=80',
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.4),
                        AppColors.darkBackground,
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.orangeAccent, width: 2),
                        ),
                        child: const CircleAvatar(
                          radius: 36,
                          backgroundColor: AppColors.darkSurfaceSecondary,
                          backgroundImage: NetworkImage('https://i.pravatar.cc/150?u=space_1'),
                        ),
                      ),
                      const SizedBox(height: 12),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const Text(
                  'ONYX CLUB',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.darkTextPrimary,
                    letterSpacing: 2,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.orangeAccent.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    'ALWAYS OPEN',
                    style: TextStyle(color: Colors.orangeAccent, fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 24),
                const _InfoRow(icon: Icons.location_on, text: 'Köpenicker Str. 76, Berlin'),
                const SizedBox(height: 8),
                const _InfoRow(icon: Icons.access_time, text: 'Thu-Mon - 23:00 - Open End'),
                const SizedBox(height: 8),
                const _InfoRow(icon: Icons.music_note, text: 'Underground Club - Techno'),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    _StatBlock('5.1K', 'FOLLOWERS'),
                    _StatBlock('1.2K', 'FANS'),
                    _StatBlock('8', 'CURATORS'),
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orangeAccent,
                          foregroundColor: Colors.black,
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
                          foregroundColor: Colors.orangeAccent,
                          side: const BorderSide(color: Colors.orangeAccent),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        onPressed: () {},
                        child: const Text('JOIN FANS', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  '— APPROVED CURATORS',
                  style: TextStyle(
                    color: Colors.orangeAccent,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                    fontSize: 12,
                  ),
                ),
                Text('8 active', style: TextStyle(color: AppColors.darkTextSecondary, fontSize: 12)),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 80,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 26,
                        backgroundColor: Colors.purpleAccent,
                        child: CircleAvatar(
                          radius: 24,
                          backgroundImage: NetworkImage('https://i.pravatar.cc/150?u=c\$index'),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text('DJ \$index', style: const TextStyle(color: AppColors.darkTextSecondary, fontSize: 10)),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.fromLTRB(24, 24, 24, 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '— CURATOR POSTS',
                  style: TextStyle(
                    color: Colors.orangeAccent,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                    fontSize: 12,
                  ),
                ),
                Text('See all', style: TextStyle(color: AppColors.darkTextSecondary, fontSize: 12)),
              ],
            ),
          ),
        ),
        shoutoutsAsync.when(
          data: (shoutouts) => SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: ShoutoutCard(shoutout: shoutouts[index]),
              ),
              childCount: shoutouts.length,
            ),
          ),
          loading: () => const SliverToBoxAdapter(child: Center(child: CircularProgressIndicator())),
          error: (e, st) => SliverToBoxAdapter(child: Center(child: Text('Error \$e'))),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 40)),
      ],
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const _InfoRow({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: Colors.orangeAccent, size: 14),
        const SizedBox(width: 8),
        Text(text, style: const TextStyle(color: AppColors.darkTextSecondary, fontSize: 12)),
      ],
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

class _SpaceNavIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _SpaceNavIcon({
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
          Icon(icon, color: isActive ? Colors.orangeAccent : AppColors.darkTextSecondary),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              color: isActive ? Colors.orangeAccent : AppColors.darkTextSecondary,
            ),
          )
        ],
      ),
    );
  }
}
