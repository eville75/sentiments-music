import 'package:flutter/material.dart';
import '../../design_system/theme/app_typography.dart';
import '../../design_system/theme/app_spacing.dart';
import '../../design_system/theme/app_theme.dart';
import '../../design_system/widgets/mood_button.dart';
import 'mood_view_model.dart';
import '../home/home_factory.dart';

class MoodView extends StatelessWidget {
  final MoodViewModel viewModel;

  const MoodView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
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
                Text("Como você se sente agora?", style: AppTypography.h1),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  "Toque em um sentimento para encontrar a playlist",
                  style: AppTypography.body,
                ),

                const SizedBox(height: AppSpacing.xl),

                // Sentimentos Positivos
                Text("Sentimentos Positivos", style: AppTypography.h2),
                const SizedBox(height: AppSpacing.sm),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    MoodButton(
                      label: "Feliz",
                      type: MoodType.positive,
                      onTap: () => _goToHome(context, "Feliz"),
                    ),
                    MoodButton(
                      label: "Motivado",
                      type: MoodType.positive,
                      onTap: () => _goToHome(context, "Motivado"),
                    ),
                    MoodButton(
                      label: "Alegre",
                      type: MoodType.positive,
                      onTap: () => _goToHome(context, "Alegre"),
                    ),
                  ],
                ),

                const SizedBox(height: AppSpacing.lg),

                // Sentimentos Negativos
                Text("Sentimentos Negativos", style: AppTypography.h2),
                const SizedBox(height: AppSpacing.sm),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    MoodButton(
                      label: "Triste",
                      type: MoodType.negative,
                      onTap: () => _goToHome(context, "Triste"),
                    ),
                    MoodButton(
                      label: "Ansioso",
                      type: MoodType.negative,
                      onTap: () => _goToHome(context, "Ansioso"),
                    ),
                    MoodButton(
                      label: "Cansado",
                      type: MoodType.negative,
                      onTap: () => _goToHome(context, "Cansado"),
                    ),
                  ],
                ),

                const SizedBox(height: AppSpacing.lg),

                // Sentimentos Neutros
                Text("Sentimentos Neutros", style: AppTypography.h2),
                const SizedBox(height: AppSpacing.sm),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    MoodButton(
                      label: "Calmo",
                      type: MoodType.neutral,
                      onTap: () => _goToHome(context, "Calmo"),
                    ),
                    MoodButton(
                      label: "Sereno",
                      type: MoodType.neutral,
                      onTap: () => _goToHome(context, "Sereno"),
                    ),
                    MoodButton(
                      label: "Neutro",
                      type: MoodType.neutral,
                      onTap: () => _goToHome(context, "Neutro"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _goToHome(BuildContext context, String mood) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => HomeFactory.create(mood),
      ),
    );
  }
}
