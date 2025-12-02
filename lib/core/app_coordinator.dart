import 'package:flutter/material.dart';
import '../scenes/login/login_factory.dart';
import '../scenes/mood/mood_factory.dart';
import '../scenes/home/home_factory.dart';
import '../scenes/settings/settings_factory.dart';
import '../shared/models/user_model.dart';
import 'app_routes.dart';

class AppCoordinator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => LoginFactory.create());

      case AppRoutes.mood:
        return MaterialPageRoute(builder: (_) => MoodFactory.create());

      case AppRoutes.home:
        final mood = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => HomeFactory.create(mood));

      case AppRoutes.settings:
        final user = settings.arguments as UserModel;
        return MaterialPageRoute(builder: (_) => SettingsFactory.create(user));

      default:
        return MaterialPageRoute(builder: (_) => LoginFactory.create());
    }
  }
}
