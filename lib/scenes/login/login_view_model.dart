import 'package:flutter/material.dart';
import '../../shared/models/user_model.dart';
import 'login_service.dart';

class LoginViewModel extends ChangeNotifier {
  final LoginService service;

  LoginViewModel({required this.service});

  Future<UserModel?> login(String email, String password) async {
    return await service.login(email, password);
  }

  Future<UserModel?> register(String name, String email, String password) async {
    return await service.register(name, email, password);
  }
}
