import 'package:flutter/material.dart';
import '../../design_system/theme/app_theme.dart';
import '../../design_system/theme/app_typography.dart';
import '../../design_system/theme/app_spacing.dart';
import '../../design_system/theme/app_colors.dart';
import 'login_view_model.dart';
import 'login_service.dart';
import '../mood/mood_factory.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final LoginViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = LoginViewModel(service: LoginService());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: AppTheme.backgroundGradient,
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Center(
          child: AnimatedBuilder(
            animation: viewModel,
            builder: (_, __) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Mood Music", style: AppTypography.h1),
                  const SizedBox(height: 40),

                  _loginButton(
                    label: "Entrar com Google",
                    icon: Icons.g_mobiledata,
                    color: AppColors.primary,
                    onTap: () async {
                      final user = await viewModel.loginGoogle();
                      if (user != null && context.mounted) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => MoodFactory.create(),
                          ),
                        );
                      }
                    },
                  ),

                  const SizedBox(height: 16),

                  _loginButton(
                    label: "Entrar com Apple",
                    icon: Icons.apple,
                    color: Colors.white,
                    onTap: () async {
                      final user = await viewModel.loginApple();
                      if (user != null && context.mounted) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => MoodFactory.create(),
                          ),
                        );
                      }
                    },
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _loginButton({
    required String label,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: AppColors.glassEffect,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.glassBorder),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color),
            const SizedBox(width: 12),
            Text(
              label,
              style: AppTypography.body.copyWith(color: AppColors.text),
            ),
          ],
        ),
      ),
    );
  }
}
