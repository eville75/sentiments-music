class UserModel {
  final String id;
  final String name;
  final String email;
  final String? avatarUrl;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.avatarUrl,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map["id"] ?? "",
      name: map["name"] ?? "",
      email: map["email"] ?? "",
      avatarUrl: map["avatarUrl"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "avatarUrl": avatarUrl,
    };
  }
}
