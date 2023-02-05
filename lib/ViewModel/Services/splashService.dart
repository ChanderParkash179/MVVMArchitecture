import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm/Model/UserModel.dart';
import 'package:mvvm/Utils/routeNames.dart';
import 'package:mvvm/Utils/utils.dart';
import 'package:mvvm/ViewModel/userViewModel.dart';

class SplashService {
  Future<UserModel> getUserData() => UserViewModel().getUser();

  void checkAuthentication(BuildContext context) async {
    getUserData().then((value) async {
      if (value.token == 'null' || value.token == '') {
        await Future.delayed(const Duration(seconds: 5));
        Navigator.pushNamed(context, RouteNames.loginRoute);
      } else {
        await Future.delayed(const Duration(seconds: 5));
        Navigator.pushNamed(context, RouteNames.homeRoute);
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        Utils().flushbarErrorMessage(error.toString(), context);
      }
    });
  }
}
