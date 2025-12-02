import 'package:flutter/material.dart';
import 'mood_service.dart';

class MoodViewModel extends ChangeNotifier {
  final MoodService service;

  MoodViewModel({required this.service});

  bool loading = false;

  Future<void> selectMood(String mood) async {
    loading = true;
    notifyListeners();

    await service.registerMood(mood);

    loading = false;
    notifyListeners();
  }
}
