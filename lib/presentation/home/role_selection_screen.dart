import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/models/auth_models.dart';
import '../../providers/auth_providers.dart';
import '../../core/theme/app_colors.dart';
import '../../shared/widgets/glass_container.dart';
import 'package:go_router/go_router.dart';

class RoleSelectionScreen extends ConsumerWidget {
  const RoleSelectionScreen({super.key});

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
      backgroundColor: AppColors.darkBackground,
      appBar: AppBar(
        title: const Text('ATTEND HOME'),
        centerTitle: true,
        automaticallyImplyLeading: false, // Prevent going back to login via top bar
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: GlassContainer(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Select a View',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                      color: AppColors.darkTextPrimary,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Choose how you want to experience ATTEND during this test.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.darkTextSecondary,
                    ),
                  ),
                  const SizedBox(height: 48),
                  if (authState is AsyncLoading)
                    const CircularProgressIndicator(color: AppColors.darkAccentElectric)
                  else ...[
                    _RoleButton(
                      title: 'CLUBBER',
                      subtitle: 'Discover events, follow curators',
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
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
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
