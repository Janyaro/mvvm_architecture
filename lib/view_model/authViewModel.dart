import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nvvm/repository/auth_repository.dart';
import 'package:nvvm/utis/Route/RoutesNames.dart';
import 'package:nvvm/utis/utis.dart';

class AuthViewProvider with ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  void getLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  final _myrepo = Auth_repository();

  Future<void> loginScreen(dynamic data, BuildContext context) async {
    getLoading(true);
    _myrepo.loginApi(data).then((value) {
      getLoading(false);
      Utils.flushBarErrorMessage('Login Successfully', context);
      Navigator.pushNamed(context, RoutesName.home);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      getLoading(false);
      if (kDebugMode) {
        Utils.flushBarErrorMessage(error.toString(), context);
        print(error.toString());
      }
    });
  }
}
