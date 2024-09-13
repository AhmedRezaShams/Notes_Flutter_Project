import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:notes/main.dart';
import 'package:notes/routes.dart';
import 'package:notes/views/home_page.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  // Register new user
  Future<void> registerUser(BuildContext context, String email, String password) async {
    try {

      final userCredential  = await FirebaseAuth.instance .createUserWithEmailAndPassword(
          email: email,
          password: password
      );
      context.push('/success_register');

      // Redirect to the home screen after registration
      Get.snackbar(
        "Success",
        "Registration successful!",
        snackPosition: SnackPosition.BOTTOM,
      );
    } on FirebaseAuthException catch (e) {
      String message = e.message ?? "An error occurred";
      Get.snackbar(
        "Error",
        message,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  // Login user
  Future<void> loginUser(BuildContext context, String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance .signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      context.push('/success_register');
    } on  FirebaseAuthException catch (e) {
      String errorMessage = e?.message.toString() ?? "An error occurred";
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 5), // Optional: Set duration for the snackbar
          ),
      );
    }
  }

  // Logout user
  Future<void> logout(BuildContext context) async {
    try {
      await auth.signOut();

      // After signing out, navigate to the login or welcome screen
      context.go('/home'); // Replace '/login' with your actual login route

      // Optionally show a snackbar to indicate successful logout
      Get.snackbar(
        "Logged Out",
        "You have been logged out successfully.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (e) {
      // Handle any errors during logout
      Get.snackbar(
        "Error",
        "Failed to log out. Please try again.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

}
