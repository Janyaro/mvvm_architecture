import 'dart:convert';
import 'dart:io';

import 'package:nvvm/data/app_exception.dart';
import 'package:nvvm/data/network/BaseApiResponse.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class NetWorkApiResponse extends BaseApiResponse {
  @override
  Future getGetApiResponse(String url) async {
    dynamic ResponseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
      ResponseJson = returnResponse(response);
    } on SocketException {
      throw Exception('Internet connection unavailable try again');
    }
    return ResponseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic ResponseJson;
    try {
      Response response =
          await post(Uri.parse(url), body: data).timeout(Duration(seconds: 10));
      ResponseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('Data does not found');
    }
    return ResponseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic ResponseJson = jsonDecode(response.body.toString());
        return ResponseJson;
        break;
      case 400:
        throw UnAuthorizedException('unauthorized people access the data ');
        break;
      case 404:
        throw BadRequestException('Api endpoint doesnot hit try again');
        break;
      default:
        throw FetchDataException('Api doesnot proper word');
        break;
    }
  }
}
