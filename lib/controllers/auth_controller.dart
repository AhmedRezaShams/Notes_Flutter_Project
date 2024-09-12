import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:notes/routes.dart';
import 'package:notes/views/home_page.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  // Register new user
  Future<void> registerUser(BuildContext context, String email, String password) async {
    try {
      context.push('/success_register');
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );


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

      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      context.push('/success_register');
      Get.snackbar(
        "Success",
        "Logged in successfully",
        snackPosition: SnackPosition.BOTTOM,
      );
    } on FirebaseAuthException catch (e) {
      String message = e.message ?? "An error occurred";
     print(message);
    }
  }

  // Logout user
  Future<void> logout() async {
    await auth.signOut();
   // Get.offAllNamed('/');  // Redirect to login after logout
  }
}
