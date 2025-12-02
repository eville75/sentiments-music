import 'package:flutter/material.dart';
import '../../shared/models/user_model.dart';
import 'settings_view.dart';
import 'settings_view_model.dart';

class SettingsFactory {
  static Widget create(UserModel user) {
    final viewModel = SettingsViewModel(user: user);
    return SettingsView(viewModel: viewModel);
  }
}
