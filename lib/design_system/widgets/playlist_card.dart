import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import '../theme/app_spacing.dart';

class PlaylistCard extends StatelessWidget {
  final String title;
  final String thumbnailUrl;
  final VoidCallback onTap;

  const PlaylistCard({
    super.key,
    required this.title,
    required this.thumbnailUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.glassEffect,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.glassBorder),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Imagem da playlist
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              child: AspectRatio(
                aspectRatio: 1, // quadrado igual ao seu protótipo
                child: Image.network(
                  thumbnailUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Título
            Padding(
              padding: const EdgeInsets.all(AppSpacing.sm),
              child: Text(
                title,
                style: AppTypography.componentTitle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
