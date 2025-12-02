import 'package:flutter/material.dart';
import 'mood_view.dart';
import 'mood_view_model.dart';
import 'mood_service.dart';

class MoodFactory {
  static Widget create() {
    final service = MoodService();
    final viewModel = MoodViewModel(service: service);

    return MoodView(viewModel: viewModel);
  }
}
