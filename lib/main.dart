import 'package:flutter/material.dart';
import 'package:nvvm/utis/Route/Routes.dart';
import 'package:nvvm/utis/Route/RoutesNames.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: RoutesName.home,
      onGenerateRoute: Routes.generateRoutes,
    );
  }
}
