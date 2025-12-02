import 'package:dio/dio.dart';
import '../models/playlist_model.dart';

class YoutubeService {
  final Dio _dio = Dio();

  // SUA API KEY
  final String apiKey = "AIzaSyCHC1GIUlBhgalz3K1Zm_jPMW88oxU6I08";

  String? nextPageToken;

  Future<List<PlaylistModel>> getPlaylistsByMood(
    String mood, {
    bool loadMore = false,
  }) async {
    try {
      if (!loadMore) {
        nextPageToken = null;
      }

      final response = await _dio.get(
        "https://www.googleapis.com/youtube/v3/search",
        queryParameters: {
          "part": "snippet",
          "q": "$mood music playlist",
          "type": "video",
          "maxResults": 12,
          "key": apiKey,
          if (nextPageToken != null) "pageToken": nextPageToken,
        },
      );

      // Atualiza a próxima página
      nextPageToken = response.data["nextPageToken"];

      final items = response.data["items"] as List;

      // Converte e filtra somente vídeos válidos
      return items.map((item) {
        final snippet = item["snippet"];
        final videoId = item["id"]?["videoId"];

        if (videoId == null) return null;

        final thumbnails = snippet["thumbnails"];

        final thumb = thumbnails["high"]?["url"] ??
            thumbnails["medium"]?["url"] ??
            thumbnails["default"]?["url"] ??
            "";

        return PlaylistModel(
          id: videoId,
          title: snippet["title"] ?? "Sem título",
          thumbnailUrl: thumb,
        );
      })
      .where((e) => e != null)
      .cast<PlaylistModel>()
      .toList();
    } catch (e) {
      print("Erro YouTube API: $e");
      return [];
    }
  }
}
