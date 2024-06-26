import 'package:flutter/material.dart';
import 'package:nvvm/model/userModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class userView with ChangeNotifier {
  Future<bool> saveUser(userModel user) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token', user.token.toString());
    notifyListeners();
    return true;
  }

  Future<userModel> getUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString('token');
    return userModel(token: token);
  }

  Future<bool> remove() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('token');
    return true;
  }
}
