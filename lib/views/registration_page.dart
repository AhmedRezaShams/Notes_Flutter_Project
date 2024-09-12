import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';


class RegisterScreen extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            SizedBox(height: 20),
            // Name Input Field
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            SizedBox(height: 20),

            // Password Input Field
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            SizedBox(height: 20),

            // Login Button
            ElevatedButton(
              onPressed: () {
                String email = emailController.text.trim();
                String password = passwordController.text.trim();
                if (email.isNotEmpty && password.isNotEmpty) {
                  authController.registerUser(email, password);
                } else {
                  Get.snackbar(
                    "Error",
                    "Please fill in all fields",
                    snackPosition: SnackPosition.BOTTOM,
                  );
                }
              },
              child: Text('Signin'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50), // Full width button
              ),
            ),
          ],
        ),
      ),


    );
  }
}
