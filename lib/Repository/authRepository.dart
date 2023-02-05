import 'package:mvvm/Data/Network/BaseApiService.dart';
import 'package:mvvm/Data/Network/NetworkApiServices.dart';
import 'package:mvvm/Resources/Endpoints/endpoints.dart';

class AuthRepository {
  BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(Endpoints.loginEndpoint, data);
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> registerApi(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(
          Endpoints.registerEndpoint, data);

      return response;
    } catch (e) {
      throw e;
    }
  }
}
