import 'package:dio/dio.dart';
import '../models/playlist_model.dart';

class YoutubeService {
  final Dio _dio = Dio();

  YoutubeService();

  Future<List<PlaylistModel>> getPlaylistsByMood(String mood) async {
    await Future.delayed(const Duration(milliseconds: 600));

    final data = [
      {
        "id": "1",
        "title": "$mood • Playlist 1",
        "thumbnail": "https://img.youtube.com/vi/5qap5aO4i9A/hqdefault.jpg"
      },
      {
        "id": "2",
        "title": "$mood • Playlist 2",
        "thumbnail": "https://img.youtube.com/vi/jfKfPfyJRdk/hqdefault.jpg"
      },
      {
        "id": "3",
        "title": "$mood • Playlist 3",
        "thumbnail": "https://img.youtube.com/vi/DWcJFNfaw9c/hqdefault.jpg"
      },
    ];

    return data.map((e) => PlaylistModel.fromMap(e)).toList();
  }
}
