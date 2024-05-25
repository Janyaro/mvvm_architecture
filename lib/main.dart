import 'package:flutter/material.dart';
import 'package:nvvm/utis/Route/Routes.dart';
import 'package:nvvm/utis/Route/RoutesNames.dart';
import 'package:nvvm/view_model/authViewModel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => AuthViewProvider())],
        child: MaterialApp(
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          initialRoute: RoutesName.login,
          onGenerateRoute: Routes.generateRoutes,
        ));
  }
}
