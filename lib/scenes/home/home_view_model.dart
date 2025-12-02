import 'package:flutter/material.dart';
import '../../shared/models/playlist_model.dart';
import '../../shared/services/youtube_service.dart';
import '../../shared/errors/app_error.dart';

class HomeViewModel extends ChangeNotifier {
  final YoutubeService service;

  HomeViewModel({required this.service});

  bool isLoading = false;
  String? errorMessage;
  List<PlaylistModel> playlists = [];

  Future<void> loadPlaylists(String mood) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      playlists = await service.getPlaylistsByMood(mood);
    } on AppError catch (e) {
      errorMessage = e.message;
    } catch (e) {
      errorMessage = "Erro inesperado.";
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
