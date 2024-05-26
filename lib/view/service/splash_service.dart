import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nvvm/model/userModel.dart';
import 'package:nvvm/utis/Route/RoutesNames.dart';
import 'package:nvvm/view_model/user_view_model.dart';

class SplashService {
  Future<userModel> getUserData() => userView().getUser();

  void checkUser(BuildContext context) async {
    getUserData().then((value) async {
      print(value.token.toString());
      if (value.token == null || value.token == '') {
        await Future.delayed(Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.login);
      } else {
        await Future.delayed(Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.home);
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
