import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/auth_providers.dart';
import '../../providers/event_providers.dart';
import '../../core/theme/app_colors.dart';
import '../../shared/widgets/curator_card.dart';
import '../../shared/widgets/shoutout_card.dart';

class ClubberTabNotifier extends Notifier<int> {
  @override
  int build() => 0;
  void setTab(int index) => state = index;
}

final clubberTabProvider = NotifierProvider<ClubberTabNotifier, int>(() => ClubberTabNotifier());

class ClubberShell extends ConsumerWidget {
  const ClubberShell({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTab = ref.watch(clubberTabProvider);

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, dynamic result) {
        if (didPop) return;
        if (currentTab != 0) {
          ref.read(clubberTabProvider.notifier).setTab(0);
        } else {
          ref.read(authStateProvider.notifier).logout();
        }
      },
      child: Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, size: 20, color: AppColors.darkTextSecondary),
          onPressed: () {
            ref.read(authStateProvider.notifier).logout();
          },
        ),
        title: const Text(
          'ATTEND',
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 2),
        ),
        centerTitle: false,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.cyanAccent.withOpacity(0.1),
              border: Border.all(color: Colors.cyanAccent),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Row(
              children: [
                Icon(Icons.verified, color: Colors.cyanAccent, size: 12),
                SizedBox(width: 4),
                Text(
                  'CLUBBER',
                  style: TextStyle(
                    color: Colors.cyanAccent,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.settings, size: 24, color: AppColors.darkTextSecondary),
            onPressed: () {},
          ),
        ],
      ),
      body: _buildBody(context, ref, currentTab),
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
          color: AppColors.darkSurfacePrimary.withOpacity(0.9),
          border: const Border(top: BorderSide(color: AppColors.darkSurfaceSecondary)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _BottomNavIcon(
              icon: Icons.grid_view,
              label: 'GRID',
              isActive: currentTab == 0,
              onTap: () => ref.read(clubberTabProvider.notifier).setTab(0),
            ),
            _BottomNavIcon(
              icon: Icons.map_outlined,
              label: 'MAP',
              isActive: currentTab == 1,
              onTap: () => ref.read(clubberTabProvider.notifier).setTab(1),
            ),
            _BottomNavIcon(
              icon: Icons.qr_code_scanner,
              label: 'SCAN',
              isActive: currentTab == 2,
              isPrimary: true,
              onTap: () => ref.read(clubberTabProvider.notifier).setTab(2),
            ),
            _BottomNavIcon(
              icon: Icons.person_outline,
              label: 'PROFILE',
              isActive: currentTab == 3,
              onTap: () => ref.read(clubberTabProvider.notifier).setTab(3),
            ),
          ],
        ),
      ),
    ));
  }

  Widget _buildBody(BuildContext context, WidgetRef ref, int currentTab) {
    switch (currentTab) {
      case 0:
        return _buildGridTab(context, ref);
      case 1:
        return const Center(child: Text('Map View Mock', style: TextStyle(color: AppColors.darkTextPrimary)));
      case 2:
        return const Center(child: Text('QR Scanner Mock', style: TextStyle(color: AppColors.darkTextPrimary)));
      case 3:
        return const Center(child: Text('Clubber Profile Mock', style: TextStyle(color: AppColors.darkTextPrimary)));
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildGridTab(BuildContext context, WidgetRef ref) {
    final curatorsAsync = ref.watch(curatorsProvider);
    final shoutoutsAsync = ref.watch(liveShoutoutsProvider);

    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 12),
            child: Text(
              '— CURATORS',
              style: TextStyle(
                color: Colors.cyanAccent,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
                fontSize: 12,
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 180,
            child: curatorsAsync.when(
              data: (curators) => ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                itemCount: curators.length,
                itemBuilder: (context, index) => CuratorCard(profile: curators[index]),
              ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, st) => Center(child: Text('Error: \$e')),
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 24, 16, 12),
            child: Text(
              '— THE VIBE GRID',
              style: TextStyle(
                color: Colors.cyanAccent,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
                fontSize: 12,
              ),
            ),
          ),
        ),
        shoutoutsAsync.when(
          data: (shoutouts) => SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ShoutoutCard(shoutout: shoutouts[index]),
              ),
              childCount: shoutouts.length,
            ),
          ),
          loading: () => const SliverToBoxAdapter(child: Center(child: CircularProgressIndicator())),
          error: (e, st) => SliverToBoxAdapter(child: Center(child: Text('Error: \$e'))),
        ),
      ],
    );
  }
}

class _BottomNavIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final bool isPrimary;
  final VoidCallback onTap;

  const _BottomNavIcon({
    required this.icon,
    required this.label,
    required this.isActive,
    required this.onTap,
    this.isPrimary = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isPrimary) {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: const BoxDecoration(
            color: Colors.cyanAccent,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.black, size: 28),
        ),
      );
    }

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isActive ? Colors.cyanAccent : AppColors.darkTextSecondary,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              color: isActive ? Colors.cyanAccent : AppColors.darkTextSecondary,
            ),
          )
        ],
      ),
    );
  }
}
