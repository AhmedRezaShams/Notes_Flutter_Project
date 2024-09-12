// import 'package:get/get.dart';
// import 'package:notes/routes.dart';
//
// class SplashController extends GetxController {
//   @override
//   void onInit() {
//     super.onInit();
//     _navigateToHome();
//   }
//
//   void _navigateToHome() {
//     Future.delayed(Duration(seconds: 2), () {
//       context.go('/home');
//     });
//   }
// }
import 'package:flutter/material.dart'; // Import for BuildContext
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class SplashController extends GetxController {
  void navigateToHome(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      context.go('/home');
    });
  }
}
