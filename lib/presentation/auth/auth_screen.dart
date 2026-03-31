import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../domain/models/auth_models.dart';
import '../../providers/auth_providers.dart';
import '../../core/theme/app_colors.dart';
import '../../shared/widgets/glass_container.dart';

class AuthScreen extends ConsumerWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);

    ref.listen<AsyncValue<User?>>(authStateProvider, (previous, next) {
      if (next is AsyncData && next.value != null) {
        final user = next.value!;
        if (user.role == UserRole.clubber) context.go('/clubber');
        if (user.role == UserRole.curator) context.go('/curator');
        if (user.role == UserRole.space) context.go('/space');
      }
    });

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.darkBackground,
              AppColors.darkSurfacePrimary,
            ],
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Positioned(
                top: 16,
                right: 16,
                child: IconButton(
                  icon: const Icon(Icons.settings, color: AppColors.darkTextSecondary),
                  onPressed: () {
                    // Settings handler
                  },
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: SingleChildScrollView(
                    child: GlassContainer(
                      padding: const EdgeInsets.all(32.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _CityStatsHeader(),
                          const SizedBox(height: 32),
                          const Text(
                            'ATTEND',
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 4,
                              color: AppColors.darkTextPrimary,
                            ),
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            'Choose your role',
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.darkTextSecondary,
                            ),
                          ),
                          const SizedBox(height: 48),
                          if (authState is AsyncLoading)
                            const CircularProgressIndicator(color: AppColors.darkAccentElectric)
                          else ...[
                            _RoleButton(
                              title: 'CLUBBER',
                              subtitle: 'Discover events, follow curators, unlock perks',
                              accentColor: Colors.cyanAccent,
                              onPressed: () => ref.read(authStateProvider.notifier).login(UserRole.clubber),
                            ),
                            const SizedBox(height: 16),
                            _RoleButton(
                              title: 'CURATOR',
                              subtitle: 'Lead the vibe, build your audience',
                              accentColor: Colors.purpleAccent,
                              onPressed: () => ref.read(authStateProvider.notifier).login(UserRole.curator),
                            ),
                            const SizedBox(height: 16),
                            _RoleButton(
                              title: 'SPACE',
                              subtitle: 'List your venue, manage events',
                              accentColor: Colors.orangeAccent,
                              onPressed: () => ref.read(authStateProvider.notifier).login(UserRole.space),
                            ),
                          ]
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CityStatsHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.location_on, color: Colors.cyanAccent, size: 14),
            const SizedBox(width: 4),
            const Text(
              'BERLIN',
              style: TextStyle(
                color: Colors.cyanAccent,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
                fontSize: 12,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
              '23',
              style: TextStyle(
                color: AppColors.darkTextPrimary,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.only(bottom: 6),
              child: const Text(
                'LIVE EVENTS',
                style: TextStyle(
                  color: AppColors.darkTextSecondary,
                  letterSpacing: 1,
                  fontSize: 10,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        // Mock Pulse Bar Chart
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(12, (index) {
            final height = [8, 14, 22, 16, 28, 36, 24, 18, 12, 16, 10, 6][index].toDouble();
            final isHigh = height > 20;
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 2),
              width: 4,
              height: height,
              decoration: BoxDecoration(
                color: isHigh ? AppColors.darkAccentElectric : AppColors.darkSurfaceSecondary,
                borderRadius: BorderRadius.circular(2),
              ),
            );
          }),
        ),
        const SizedBox(height: 12),
        const Text(
          'VIBE: ELECTRIC TONIGHT',
          style: TextStyle(
            color: AppColors.darkAccentElectric,
            fontWeight: FontWeight.w600,
            letterSpacing: 1,
            fontSize: 10,
          ),
        ),
      ],
    );
  }
}

class _RoleButton extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color accentColor;
  final VoidCallback onPressed;

  const _RoleButton({
    required this.title,
    required this.subtitle,
    required this.accentColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: accentColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: accentColor.withOpacity(0.5), width: 1.5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: accentColor,
                  ),
                ),
                Icon(Icons.chevron_right, color: accentColor),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.darkTextSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
