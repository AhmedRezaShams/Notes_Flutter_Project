import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/controllers/splash_controller.dart';
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

// class SplashScreen extends StatelessWidget {
//   final SplashController _splashController = Get.put(SplashController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue,
//       body: Center(
//         child: Text(
//           'Welcome To Note',
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 30,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     );
//   }
// }




class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Text(
          'Welcome to Home!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
