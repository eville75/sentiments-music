import 'package:flutter/material.dart';
import '../../design_system/theme/app_typography.dart';
import '../../design_system/theme/app_spacing.dart';
import '../../design_system/theme/app_theme.dart';
import '../../design_system/widgets/mood_button.dart';
import 'mood_view_model.dart';
import '../home/home_factory.dart';
import '../settings/settings_factory.dart';

class MoodView extends StatelessWidget {
  final MoodViewModel viewModel;

  const MoodView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    final feelings = viewModel.allSentiments;

    return Container(
      decoration: AppTheme.backgroundGradient,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // -------- HEADER --------
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Como você se sente agora?", style: AppTypography.h1),
                    IconButton(
                      icon: const Icon(Icons.settings, color: Colors.white),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => SettingsFactory.create(
                              viewModel.user, // ✅ agora envia o usuário real
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),

                const SizedBox(height: AppSpacing.sm),
                Text(
                  "Toque em um sentimento para encontrar a playlist",
                  style: AppTypography.body,
                ),

                const SizedBox(height: AppSpacing.xl),

                Expanded(
                  child: ListView(
                    children: feelings.keys.map((category) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(category, style: AppTypography.h2),
                          const SizedBox(height: AppSpacing.sm),

                          Wrap(
                            spacing: 12,
                            runSpacing: 12,
                            children: feelings[category]!.map((sentiment) {
                              return MoodButton(
                                label: sentiment,
                                type: viewModel.resolveType(category),
                                onTap: () => _go(context, sentiment),
                              );
                            }).toList(),
                          ),

                          const SizedBox(height: AppSpacing.lg),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _go(BuildContext context, String mood) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => HomeFactory.create(mood)),
    );
  }
}
