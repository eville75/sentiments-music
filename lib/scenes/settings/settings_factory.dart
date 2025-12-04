import 'package:flutter/material.dart';
import 'settings_view.dart';
import 'settings_view_model.dart';
import 'settings_service.dart';
import '../../shared/models/user_model.dart';

class SettingsFactory {
  static Widget create(UserModel user) {
    final service = SettingsService(user: user);
    final viewModel = SettingsViewModel(service: service);
    return SettingsView(viewModel: viewModel);
  }
}
