import 'package:mvvm/Data/Network/BaseApiService.dart';
import 'package:mvvm/Data/Network/NetworkApiServices.dart';
import 'package:mvvm/Model/MoviesModel.dart';
import 'package:mvvm/Resources/Endpoints/endpoints.dart';

class HomeRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<MoviesModel> fetchMoviesList() async {
    try {
      dynamic response =
          await _apiServices.getGetApiResponse(Endpoints.moviesEndpoint);
      return response = MoviesModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}
