import 'package:flutter/material.dart';
import 'home_view.dart';
import 'home_view_model.dart';
import '../../shared/services/youtube_service.dart';

class HomeFactory {
  static Widget create(String mood) {
    final service = YoutubeService();
    final viewModel = HomeViewModel(service: service);

    return HomeView(
      viewModel: viewModel,
      mood: mood,
    );
  }
}
