import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:notes/controllers/splash_controller.dart';
import 'package:notes/main.dart';
import 'package:notes/widgets/button.dart';

class SplashScreen extends StatelessWidget {
  final SplashController _splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    _splashController.navigateToHome(context);
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome To Notes',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
               Image.asset('assets/icons/icons-notes.png',
               height: 250,
               width: 250,),
              ],
            )
          ],
        ),
      ),
    );
  }
}

