import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:nvvm/repository/auth_repository.dart';
import 'package:nvvm/utis/Route/RoutesNames.dart';
import 'package:nvvm/utis/utis.dart';

class AuthViewProvider with ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  bool _signUpLoading = false;
  bool get signUpLoading => _signUpLoading;

  void setSignUpLoading(bool value) {
    _signUpLoading = value;
    notifyListeners();
  }

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

  Future<void> SignUpApi(dynamic data, BuildContext context) async {
    setSignUpLoading(true);
    _myrepo.RegistryApi(data).then((value) {
      setSignUpLoading(false);
      Utils.flushBarErrorMessage('SignUp successfull', context);

      print(value.toString());
    }).onError((error, stackTrace) {
      setSignUpLoading(false);
      if (kDebugMode) {
        Utils.SnackBar(error.toString(), context);
        print(error.toString());
      }
    });
  }
}
