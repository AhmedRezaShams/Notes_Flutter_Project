// lib/routes.dart

import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:notes/views/index.dart';
import 'package:notes/widgets/splash_screen.dart';
import 'package:notes/main.dart';

class Routes {
  static const SPLASH = 'notes/widgets/splash_screen.dart';
  static const LOGIN = '/';
  static const SIGNUP = '1/signup';
  static const HOME = 'lib/views/index.dart';
  static const ADD_NOTE = '/add-note';

  static final routes = [
    GetPage(
      name: SPLASH,
      page: () => SplashScreen(),
      transition: Transition.fade,
    ),
    // GetPage(
    //   name: LOGIN,
    //   page: () => LoginScreen(),
    //   transition: Transition.circularReveal,
    // ),
    // GetPage(
    //   name: SIGNUP,
    //   page: () => SignUpScreen(),
    //   transition: Transition.circularReveal,
    // ),
    GetPage(
      name: HOME,
      page: () => HomeScreen(),
      transition: Transition.circularReveal,
    ),
    // GetPage(
    //   name: ADD_NOTE,
    //   page: () => AddNoteScreen(),
    //   transition: Transition.circularReveal,
    // ),
  ];
}
