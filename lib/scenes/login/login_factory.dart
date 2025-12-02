import 'package:flutter/material.dart';
import 'login_view.dart';

class LoginFactory {
  static Widget create() {
    return LoginView(); // ❌ remove o "const"
  }
}
