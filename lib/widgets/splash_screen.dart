// lib/widgets/splash_screen.dart

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/routes.dart';
import 'package:notes/views/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isFirstLaunch = true;

  Future<void> checkFirstLaunch() async {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );

    final prefs = await SharedPreferences.getInstance();
    isFirstLaunch = prefs.getBool('is_first_launch') ?? true;
    if (isFirstLaunch) {
      await prefs.setBool('is_first_launch', false);
    }

  }

  @override
  void initState() {
    super.initState();

    // checkFirstLaunch();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to Notes App',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            CircularProgressIndicator(),

          ],
        ),
      ),
    );
  }
}
