import 'dart:convert';
import 'dart:io';

import 'package:mvvm/Data/Exception/BadRequestException.dart';
import 'package:mvvm/Data/Exception/FetchDataException.dart';
import 'package:mvvm/Data/Exception/InternalServerException.dart';
import 'package:mvvm/Data/Exception/ServiceUnavailableException.dart';
import 'package:mvvm/Data/Exception/UnauthorizedException.dart';
import 'package:mvvm/Data/Network/BaseApiService.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {
  dynamic responseJson;

  @override
  Future getGetApiResponse(String url) async {
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    try {
      final response = await http
          .post(Uri.parse(url), body: data)
          .timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 503:
        throw ServiceUnavailableException(response.body.toString());
      case 500:
        throw InternalServerException(response.body.toString());
      case 404:
        throw UnauthorizedException(response.body.toString());
      default:
        throw FetchDataException(
            'Error Occured while communicating with server with status code ${response.statusCode}');
    }
  }
}
