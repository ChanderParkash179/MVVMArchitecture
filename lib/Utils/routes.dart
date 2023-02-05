import 'package:flutter/material.dart';
import 'package:mvvm/Utils/routeNames.dart';
import 'package:mvvm/View/home.dart';
import 'package:mvvm/View/login.dart';
import 'package:mvvm/View/signup.dart';
import 'package:mvvm/View/splash.dart';

class Routes {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splashRoute:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashScreen());
      case RouteNames.homeRoute:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen());
      case RouteNames.loginRoute:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginScreen());
      case RouteNames.signupRoute:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SignupScreen());

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('NO ROUTE DEFINED'),
            ),
          );
        });
    }
  }
}
