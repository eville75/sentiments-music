import 'package:flutter/material.dart';
import '../../shared/models/user_model.dart';
import 'settings_service.dart';
import 'settings_view.dart';
import 'settings_view_model.dart';

class SettingsFactory {
  static Widget create(UserModel user) {
    final service = SettingsService();
    final viewModel = SettingsViewModel(service: service, user: user);

    return SettingsView(viewModel: viewModel);
  }
}
