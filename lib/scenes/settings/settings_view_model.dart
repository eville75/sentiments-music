import 'package:flutter/material.dart';
import '../../shared/models/user_model.dart';
import 'settings_service.dart';

class SettingsViewModel extends ChangeNotifier {
  final SettingsService service;
  final UserModel user;

  bool loading = false;

  SettingsViewModel({
    required this.service,
    required this.user,
  });

  Future<void> logout() async {
    loading = true;
    notifyListeners();

    await service.logout();

    loading = false;
    notifyListeners();
  }
}
