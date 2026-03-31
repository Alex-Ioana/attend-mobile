import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../domain/models/auth_models.dart';

class CuratorCard extends StatelessWidget {
  final CuratorProfile profile;

  const CuratorCard({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/public-curator', extra: profile);
      },
      child: Container(
        width: 140,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          color: AppColors.darkSurfaceSecondary,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.darkAccentElectric.withOpacity(0.5)),
          image: DecorationImage(
            image: NetworkImage('https://i.pravatar.cc/300?u=\${profile.id}'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
            ),
          ),
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (profile.isVerified)
                const Icon(Icons.verified, color: AppColors.darkAccentElectric, size: 14),
              const SizedBox(height: 4),
              Text(
                profile.handle.toUpperCase(),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                profile.residentAt ?? '',
                style: const TextStyle(
                  color: AppColors.darkTextSecondary,
                  fontSize: 10,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
