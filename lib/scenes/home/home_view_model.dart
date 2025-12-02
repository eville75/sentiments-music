import 'package:flutter/material.dart';
import '../../shared/models/playlist_model.dart';
import '../../shared/services/youtube_service.dart';

class HomeViewModel extends ChangeNotifier {
  final YoutubeService service;

  HomeViewModel({required this.service});

  bool isLoading = false;
  bool isLoadingMore = false;
  String? errorMessage;
  List<PlaylistModel> playlists = [];
  String? currentMood;

  Future<void> loadPlaylists(String mood) async {
    currentMood = mood;
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      playlists = await service.getPlaylistsByMood(mood);
    } catch (e) {
      errorMessage = "Erro ao carregar playlists.";
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadMore() async {
    if (isLoadingMore || currentMood == null) return;

    isLoadingMore = true;
    notifyListeners();

    try {
      final more = await service.getPlaylistsByMood(
        currentMood!,
        loadMore: true,
      );
      playlists.addAll(more);
    } catch (_) {} 

    isLoadingMore = false;
    notifyListeners();
  }
}
