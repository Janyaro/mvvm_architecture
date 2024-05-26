import 'package:nvvm/data/network/BaseApiResponse.dart';
import 'package:nvvm/data/network/NetworkApiResponse.dart';
import 'package:nvvm/res/app_url.dart';
import 'package:nvvm/utis/utis.dart';

class Auth_repository {
  BaseApiResponse _apiResponse = NetWorkApiResponse();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiResponse.getPostApiResponse(AppUrl.loginEndPoint, data);
      return response;
    } catch (e) {
      Utils.toastMessage(e.toString());
    }
  }

  Future<dynamic> RegistryApi(dynamic data) async {
    try {
      dynamic response =
          await _apiResponse.getPostApiResponse(AppUrl.RegisterEndPoint, data);
      return response;
    } catch (e) {
      Utils.toastMessage(e.toString());
    }
  }
}
