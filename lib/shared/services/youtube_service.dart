import 'package:dio/dio.dart';
import '../models/playlist_model.dart';

class YoutubeService {
  final Dio _dio = Dio();
  final String apiKey = "AIzaSyCHC1GIUlBhgalz3K1Zm_jPMW88oxU6I08";

  String? nextPageToken;

  Future<List<PlaylistModel>> getPlaylistsByMood(
    String mood, {
    bool loadMore = false,
  }) async {
    if (!loadMore) {
      nextPageToken = null;
    }

    final response = await _dio.get(
      "https://www.googleapis.com/youtube/v3/search",
      queryParameters: {
        "part": "snippet",
        "q": "$mood music playlist",
        "type": "playlist", // ⬅ AQUI AGORA SÓ PEGA PLAYLIST REAL
        "maxResults": 12,
        "key": apiKey,
        if (nextPageToken != null) "pageToken": nextPageToken,
      },
    );

    nextPageToken = response.data["nextPageToken"];

    final items = response.data["items"] as List;

    return items.map((item) {
      final snippet = item["snippet"];
      return PlaylistModel(
        id: item["id"]["playlistId"], // ⬅ pega playlist real
        title: snippet["title"],
        thumbnailUrl: snippet["thumbnails"]["high"]["url"],
      );
    }).toList();
  }
}
