import '../../shared/models/user_model.dart';

class LoginService {
  // Usuário atual da sessão
  static UserModel? currentUser;

  Future<UserModel?> loginGoogle() async {
    await Future.delayed(const Duration(seconds: 1));

    final user = UserModel(
      id: "1",
      name: "Sapatinha",
      email: "sapatinha@gmail.com",
      avatarUrl: "https://ui-avatars.com/api/?name=S&background=5A86FF&color=fff",
    );

    currentUser = user; // <- ESSENCIAL
    return user;
  }

  Future<UserModel?> loginApple() async {
    await Future.delayed(const Duration(seconds: 1));

    final user = UserModel(
      id: "2",
      name: "Apple User",
      email: "appleuser@gmail.com",
      avatarUrl: "https://ui-avatars.com/api/?name=A&background=ffffff&color=000",
    );

    currentUser = user; // <- ESSENCIAL
    return user;
  }
}
