import 'package:flutter/cupertino.dart';
import 'package:mvvm/Data/Response/ApiResponse.dart';
import 'package:mvvm/Model/MoviesModel.dart';
import 'package:mvvm/Repository/homeRepository.dart';
import 'package:mvvm/Utils/utils.dart';

class HomeViewModel with ChangeNotifier {
  final _myRepo = HomeRepository();

  ApiResponse<MoviesModel> moviesList = ApiResponse.loading();

  setMoviesList(ApiResponse<MoviesModel> response) {
    moviesList = response;
    notifyListeners();
  }

  Future<void> fetchMoviesListApi() async {
    setMoviesList(ApiResponse.loading());
    _myRepo.fetchMoviesList().then((value) {
      setMoviesList(ApiResponse.completed(value));
      print(value.toString());
      Utils().toastMessage(ApiResponse.completed(value).toString());
    }).onError((error, stackTrace) {
      setMoviesList(ApiResponse.error(error.toString()));
      Utils().toastMessage(ApiResponse.error(error.toString()).toString());
    });
  }
}
