import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm/Model/UserModel.dart';
import 'package:mvvm/Repository/authRepository.dart';
import 'package:mvvm/Utils/routeNames.dart';
import 'package:mvvm/Utils/utils.dart';
import 'package:mvvm/ViewModel/userViewModel.dart';
import 'package:provider/provider.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.loginApi(data).then((value) {
      setLoading(false);
      final userPreference = Provider.of<UserViewModel>(context, listen: false);
      userPreference.saveUser(
        UserModel(token: value['token'].toString())
      );
      Navigator.pushNamed(context, RouteNames.homeRoute);
      if (kDebugMode) {
        Utils().snakebar('Welcome Here', context);
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        Utils().flushbarErrorMessage(error.toString(), context);
      }
    });
  }

  Future<void> signupApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.registerApi(data).then((value) {
      setLoading(false);
      Navigator.pushNamed(context, RouteNames.loginRoute);
      if (kDebugMode) {
        Utils().snakebar(value.toString(), context);
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        Utils().flushbarErrorMessage(error.toString(), context);
      }
    });
  }
}
