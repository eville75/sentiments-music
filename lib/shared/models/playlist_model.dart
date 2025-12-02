class PlaylistModel {
  final String id;
  final String title;
  final String thumbnailUrl;

  PlaylistModel({
    required this.id,
    required this.title,
    required this.thumbnailUrl,
  });

  factory PlaylistModel.fromMap(Map<String, dynamic> map) {
    return PlaylistModel(
      id: map["id"] ?? "",
      title: map["title"] ?? "",
      thumbnailUrl: map["thumbnail"] ?? "",
    );
  }
}
