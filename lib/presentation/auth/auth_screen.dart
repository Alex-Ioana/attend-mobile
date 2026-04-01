import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../domain/models/auth_models.dart';
import '../../providers/auth_providers.dart';
import '../../core/theme/app_colors.dart';
import '../../shared/widgets/glass_container.dart';

class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({super.key});

  @override
  ConsumerState<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen> {
  bool _isReviewerUnlocked = false;
  Timer? _longPressTimer;

  void _startTimer() {
    _longPressTimer = Timer(const Duration(seconds: 3), () {
      _showReviewerDialog();
    });
  }

  void _cancelTimer() {
    _longPressTimer?.cancel();
  }

  void _showReviewerDialog() {
    final TextEditingController codeController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.darkSurfacePrimary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: const Text('Reviewer Access', style: TextStyle(color: AppColors.darkTextPrimary)),
          content: TextField(
            controller: codeController,
            style: const TextStyle(color: AppColors.darkTextPrimary),
            decoration: const InputDecoration(
              hintText: 'Enter access code',
              hintStyle: TextStyle(color: AppColors.darkTextSecondary),
              enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.cyanAccent)),
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.cyanAccent)),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel', style: TextStyle(color: AppColors.darkTextSecondary)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.cyanAccent,
                foregroundColor: Colors.black,
              ),
              onPressed: () {
                if (codeController.text == 'REV573441') {
                  setState(() => _isReviewerUnlocked = true);
                  Navigator.pop(context);
                } else {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Invalid code'),
                      backgroundColor: Colors.redAccent,
                    ),
                  );
                }
              },
              child: const Text('Verify'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
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
                  onPressed: () {},
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
                          GestureDetector(
                            onTapDown: (_) => _startTimer(),
                            onTapUp: (_) => _cancelTimer(),
                            onTapCancel: () => _cancelTimer(),
                            child: const Text(
                              'ATTEND',
                              style: TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 4,
                                color: AppColors.darkTextPrimary,
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            _isReviewerUnlocked ? 'Reviewer Mode Unlocked' : 'Log in to continue',
                            style: TextStyle(
                              fontSize: 14,
                              color: _isReviewerUnlocked ? Colors.cyanAccent : AppColors.darkTextSecondary,
                              fontWeight: _isReviewerUnlocked ? FontWeight.bold : FontWeight.normal,
                            ),
                          ),
                          const SizedBox(height: 48),
                          if (authState is AsyncLoading)
                            const CircularProgressIndicator(color: AppColors.darkAccentElectric)
                          else if (_isReviewerUnlocked) ...[
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
                          ]
                          else ...[
                            // Mock regular login buttons
                            _SocialLoginButton(
                              title: 'Continue with Google',
                              icon: Icons.g_mobiledata,
                              onPressed: () {
                                context.go('/roles');
                              },
                            ),
                            const SizedBox(height: 16),
                            _SocialLoginButton(
                              title: 'Continue with Apple',
                              icon: Icons.apple,
                              onPressed: () {
                                context.go('/roles');
                              },
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

class _SocialLoginButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPressed;

  const _SocialLoginButton({
    required this.title,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        decoration: BoxDecoration(
          color: AppColors.darkSurfaceSecondary,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.darkSurfaceSecondary.withOpacity(0.5)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 28),
            const SizedBox(width: 12),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ],
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
