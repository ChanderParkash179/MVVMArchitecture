import 'package:flutter/material.dart';
import 'package:mvvm/Utils/routeNames.dart';
import 'package:mvvm/Utils/routes.dart';
import 'package:mvvm/ViewModel/authViewModel.dart';
import 'package:mvvm/ViewModel/userViewModel.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => UserViewModel()),
        // ChangeNotifierProvider(create: (_) => HomeViewModel())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          fontFamily: GoogleFonts.lato().fontFamily,
        ),
        initialRoute: RouteNames.homeRoute,
        onGenerateRoute: Routes().generateRoute,
      ),
    );
  }
}
