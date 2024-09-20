import 'dart:async';
import 'package:flutter/material.dart';
import '../login/login_screen.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = 'splashScreen';
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
    });
    return Scaffold(
      body: Image.asset(
        'assets/Splash Screen.png',
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
