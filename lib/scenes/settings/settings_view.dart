import 'package:flutter/material.dart';
import '../../design_system/theme/app_theme.dart';
import '../../design_system/theme/app_typography.dart';
import '../login/login_service.dart';
import 'settings_view_model.dart';

class SettingsView extends StatelessWidget {
  final SettingsViewModel viewModel;

  const SettingsView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    final user = LoginService.currentUser;

    return Container(
      decoration: AppTheme.backgroundGradient,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text("Configurações", style: AppTypography.h2),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                  user?.avatarUrl ??
                      "https://ui-avatars.com/api/?name=U&background=5A86FF&color=fff",
                ),
              ),
              const SizedBox(height: 16),
              Text(
                user?.name ?? "Usuário",
                style: AppTypography.h1,
              ),
              const SizedBox(height: 4),
              Text(
                user?.email ?? "",
                style: AppTypography.body,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
