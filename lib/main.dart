import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:notes/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      // initialRoute: '/',
      // getPages: [
      //   GetPage(name: '/', page: () => SplashScreen()),
      //   GetPage(name: '/home', page: () => HomeScreen()),
      // ],
      routerConfig: router,
      //routerDelegate: router.routerDelegate,
      //routeInformationParser: router.routeInformationParser,
      // initial: Routes.SPLASH, // Use the named route
      // getPages: Routes.routes,
    );
  }
}

