import 'package:flutter/material.dart';
import '../../domain/models/content_models.dart';
import '../../core/theme/app_colors.dart';

class ShoutoutCard extends StatelessWidget {
  final Shoutout shoutout;

  const ShoutoutCard({super.key, required this.shoutout});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.darkSurfaceSecondary,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: shoutout.isLive 
            ? AppColors.darkAccentElectric.withOpacity(0.5) 
            : AppColors.darkAccentPurple.withOpacity(0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: shoutout.isLive 
                    ? AppColors.darkAccentElectric.withOpacity(0.2)
                    : AppColors.darkAccentPurple.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(
                      shoutout.isLive ? Icons.circle : Icons.event,
                      size: 10,
                      color: shoutout.isLive ? AppColors.darkAccentElectric : AppColors.darkAccentPurple,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      shoutout.isLive ? 'LIVE NOW' : 'EVENT',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: shoutout.isLive ? AppColors.darkAccentElectric : AppColors.darkAccentPurple,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Text(
                _timeAgo(shoutout.postedAt),
                style: const TextStyle(color: AppColors.darkTextSecondary, fontSize: 12),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            shoutout.content,
            style: const TextStyle(
              color: AppColors.darkTextPrimary,
              fontSize: 14,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              CircleAvatar(
                radius: 12,
                backgroundImage: NetworkImage(shoutout.curatorAvatar),
              ),
              const SizedBox(width: 8),
              Text(
                shoutout.curatorName,
                style: const TextStyle(
                  color: AppColors.darkTextPrimary,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
              const Spacer(),
              Icon(Icons.favorite_border, size: 16, color: AppColors.darkTextSecondary),
              const SizedBox(width: 4),
              Text('\${shoutout.likesCount}', style: const TextStyle(color: AppColors.darkTextSecondary, fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }

  String _timeAgo(DateTime time) {
    final diff = DateTime.now().difference(time);
    if (diff.inMinutes < 60) return '\${diff.inMinutes} mins ago';
    if (diff.inHours < 24) return '\${diff.inHours} hours ago';
    return '\${diff.inDays} days ago';
  }
}
