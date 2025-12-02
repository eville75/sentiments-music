enum MoodType {
  positive,
  negative,
  neutral,
}

class MoodModel {
  final String label;
  final MoodType type;

  MoodModel({
    required this.label,
    required this.type,
  });
}
