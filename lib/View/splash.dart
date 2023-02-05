import 'package:flutter/material.dart';
import 'package:mvvm/ViewModel/Services/splashService.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashService _splashService = SplashService();

  @override
  void initState() {
    super.initState();
    _splashService.checkAuthentication(context);
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Scaffold(
        body: Center(
          child: Text(
            'Splash Screen',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }
}
