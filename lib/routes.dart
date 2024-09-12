// lib/routes.dart
import 'package:go_router/go_router.dart';
import 'package:notes/views/home_page.dart';
import 'package:notes/views/login_page.dart';
import 'package:notes/widgets/splash_screen.dart';
import 'package:notes/views/index.dart';
import 'package:notes/views/registration_page.dart';
import 'main.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => SplashScreen(), // splash page route
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => HomeScreen(), // home page route
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => LoginScreen(), // login page route
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => RegisterScreen(), // Register page route
    ),
    GoRoute(
      path: '/success_register',
      builder: (context, state) => HomePage(), // Register page route
    ),
  ],
);
// class Routes {
//   static const String SPLASH = '/';
//   static const String HOME = '/home';
//
//   static List<GetPage> routes = [
//     GetPage(name: SPLASH, page: () => SplashScreen()),
//     GetPage(name: HOME, page: () => HomeScreen()),
//   ];
// }
