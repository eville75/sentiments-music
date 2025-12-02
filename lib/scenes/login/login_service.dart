import '../../shared/models/user_model.dart';

class LoginService {
  Future<UserModel?> login(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 500));

    // Simulação apenas
    if (email == "teste@gmail.com" && password == "123456") {
      return UserModel(
        id: "001",
        name: "Sapatinha",
        email: email,
        avatarUrl:
            "https://ui-avatars.com/api/?name=S&background=5A86FF&color=fff",
      );
    }
    return null;
  }

  Future<UserModel> register(String name, String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 500));

    return UserModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      email: email,
      avatarUrl:
          "https://ui-avatars.com/api/?name=${name[0]}&background=5A86FF&color=fff",
    );
  }
}
