import 'package:flutter/material.dart';
import 'package:nvvm/utis/utis.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
              onTap: () {
                Utils.SnackBar('Internet Error', context);
                // Utils.flushBarErrorMessage('No internet connection', context);
                // Utils.toastMessage('click on me ');
              },
              child: Center(child: Text('HomeScreen')))
        ],
      ),
    );
  }
}
