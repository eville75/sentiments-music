import 'package:flutter/material.dart';
import '../../shared/models/playlist_model.dart';
import '../../shared/services/youtube_service.dart';

class HomeViewModel extends ChangeNotifier {
  final YoutubeService service;

  HomeViewModel({required this.service});

  bool isLoading = false;
  String? errorMessage;
  List<PlaylistModel> playlists = [];

  Future<void> loadPlaylists(
    String mood, {
    bool loadMore = false,
  }) async {
    if (loadMore && isLoading) return;

    isLoading = true;
    notifyListeners();

    try {
      final newPlaylists = await service.getPlaylistsByMood(
        mood,
        loadMore: loadMore,
      );

      if (loadMore) {
        playlists.addAll(newPlaylists);
      } else {
        playlists = newPlaylists;
      }
    } catch (e) {
      errorMessage = "Erro ao carregar playlists.";
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
