// lib/routes.dart

import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:notes/widgets/splash_screen.dart';
import 'package:notes/main.dart';
import 'package:notes/controllers/splash_controller.dart';


class Routes {
  static const String SPLASH = '/';
  //static const LOGIN = '/';
  static const SIGNUP = '1/signup';
  static const String HOME = '/home';
  static const ADD_NOTE = '/add-note';

  static List<GetPage> routes = [
    GetPage(name: SPLASH, page: () => SplashScreen()),
    GetPage(name: HOME, page: () => HomeScreen()),
  ];
}
