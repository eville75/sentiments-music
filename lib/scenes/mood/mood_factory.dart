import 'package:flutter/material.dart';
import 'mood_view.dart';
import 'mood_view_model.dart';
import '../../shared/models/user_model.dart';

class MoodFactory {
  static Widget create(UserModel user) {
    final viewModel = MoodViewModel(user: user);
    return MoodView(viewModel: viewModel);
  }
}
