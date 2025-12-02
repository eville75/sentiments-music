import '../../shared/models/user_model.dart';
import 'login_service.dart';
import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  final LoginService service;

  LoginViewModel({required this.service});

  bool loading = false;

  Future<UserModel?> loginGoogle() async {
    loading = true;
    notifyListeners();

    final loggedUser = await service.loginGoogle();

    loading = false;
    notifyListeners();

    return loggedUser;
  }

  Future<UserModel?> loginApple() async {
    loading = true;
    notifyListeners();

    final loggedUser = await service.loginApple();

    loading = false;
    notifyListeners();

    return loggedUser;
  }
}
