import 'package:flutter/material.dart';
import 'package:mibilleii/shared/models/user_model.dart';

class SettingsService {
  late UserModel _user;

  SettingsService({required UserModel user}) {
    _user = user;
  }

  UserModel getUser() => _user;

  Future<void> saveUser(UserModel user) async {
    _user = user;
    await Future.delayed(const Duration(milliseconds: 300));
  }

  Future<void> logout(BuildContext context) async {
    Navigator.pushReplacementNamed(context, "/login");
  }
}
