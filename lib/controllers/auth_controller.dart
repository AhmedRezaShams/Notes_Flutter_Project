import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  // Register new user
  Future<void> registerUser(String email, String password) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.snackbar(
        "Success",
        "Account created successfully",
        snackPosition: SnackPosition.BOTTOM,
      );
      // Redirect to the home screen after registration
      Get.offAllNamed('/home');
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
  Future<void> loginUser(String email, String password) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.snackbar(
        "Success",
        "Logged in successfully",
        snackPosition: SnackPosition.BOTTOM,
      );
      Get.offAllNamed('/home');
    } on FirebaseAuthException catch (e) {
      String message = e.message ?? "An error occurred";
      Get.snackbar(
        "Error",
        message,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  // Logout user
  Future<void> logout() async {
    await auth.signOut();
    Get.offAllNamed('/login');  // Redirect to login after logout
  }
}
