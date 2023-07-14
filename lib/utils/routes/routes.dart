import 'routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm/view/home_view.dart';
import 'package:flutter_mvvm/view/login_view.dart';
import 'package:flutter_mvvm/utils/values/values.dart';

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginView());
      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeView());
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
                child: Text(
              'No Route Defined',
              style: AppTextStyles.normalText,
            )),
          );
        });
    }
  }
}
