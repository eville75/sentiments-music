import 'package:flutter/material.dart';
import 'settings_view_model.dart';
import '../../design_system/theme/app_theme.dart';
import '../../design_system/theme/app_typography.dart';

class SettingsView extends StatelessWidget {
  final SettingsViewModel viewModel;

  const SettingsView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    final user = viewModel.user;

    return Container(
      decoration: AppTheme.backgroundGradient,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text("Configurações", style: AppTypography.h2),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(user.avatarUrl ?? ""),
              ),
              const SizedBox(height: 12),
              Text(user.name, style: AppTypography.h2),
              const SizedBox(height: 4),
              Text(user.email, style: AppTypography.body),
            ],
          ),
        ),
      ),
    );
  }
}
