import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:notes/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // initialRoute: '/',
      // getPages: [
      //   GetPage(name: '/', page: () => SplashScreen()),
      //   GetPage(name: '/home', page: () => HomeScreen()),
      // ],
      initialRoute: Routes.SPLASH, // Use the named route
      getPages: Routes.routes,
    );
  }
}

