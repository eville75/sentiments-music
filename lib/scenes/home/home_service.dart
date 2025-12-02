import 'package:dio/dio.dart';
import '../../shared/models/playlist_model.dart';

class HomeService {
  final Dio _dio = Dio();

  Future<List<PlaylistModel>> getPlaylistsByMood(String mood) async {
    final response = await _dio.get(
      "https://api.sampleapis.com/futurama/episodes",
    );

    final List data = response.data;

    return data.map((item) {
      return PlaylistModel.fromMap({
        "id": item["id"].toString(),
        "title": item["title"] ?? "Sem título",
        "thumbnail": item["writers"] ?? "",
      });
    }).toList();
  }
}
