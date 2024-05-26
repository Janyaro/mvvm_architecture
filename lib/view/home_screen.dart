import 'package:flutter/material.dart';
import 'package:nvvm/utis/Route/RoutesNames.dart';
import 'package:nvvm/utis/utis.dart';
import 'package:nvvm/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final userPrefrence = Provider.of<userView>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: InkWell(
                  onTap: () {
                    userPrefrence.remove().then((value) {
                      Navigator.pushNamed(context, RoutesName.login);
                    }).onError((error, stackTrace) {});
                  },
                  child: Text(
                    'Login Screen',
                    style: Theme.of(context).textTheme.titleMedium,
                  )))
        ],
      ),
    );
  }
}
