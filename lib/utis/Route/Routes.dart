import 'package:flutter/material.dart';
import 'package:nvvm/utis/Route/RoutesNames.dart';
import 'package:nvvm/view/home_screen.dart';
import 'package:nvvm/view/login_screen.dart';

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => HomeScreen());
      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => LoginScreen());
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Column(
              children: [Text('Page routes was not found')],
            ),
          );
        });
    }
  }
}
