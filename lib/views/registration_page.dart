// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:notes/routes.dart';
//
// import '../controllers/auth_controller.dart';
//
//
// class RegisterScreen extends StatelessWidget {
//   final AuthController authController = Get.put(AuthController());
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextFormField(
//               decoration: InputDecoration(
//                 labelText: 'Name',
//                 border: OutlineInputBorder(),
//                 prefixIcon: Icon(Icons.person),
//               ),
//             ),
//             SizedBox(height: 20),
//             // Name Input Field
//             TextFormField(
//               controller: emailController,
//               decoration: InputDecoration(
//                 labelText: 'Email',
//                 border: OutlineInputBorder(),
//                 prefixIcon: Icon(Icons.person),
//               ),
//             ),
//             SizedBox(height: 20),
//
//             // Password Input Field
//             TextFormField(
//               controller: passwordController,
//               obscureText: true,
//               decoration: InputDecoration(
//                 labelText: 'Password',
//                 border: OutlineInputBorder(),
//                 prefixIcon: Icon(Icons.lock),
//               ),
//             ),
//             SizedBox(height: 20),
//
//             // Login Button
//             ElevatedButton(
//               onPressed: () {
//                 String email = emailController.text.trim();
//                 String password = passwordController.text.trim();
//                 if (email.isNotEmpty && password.isNotEmpty) {
//                   authController.registerUser(context, email, password);
//                 } else {
//                   Get.snackbar(
//                     "Error",
//                     "Please fill in all fields",
//                     snackPosition: SnackPosition.BOTTOM,
//                   );
//                 }
//               },
//               child: Text('Sign in'),
//               style: ElevatedButton.styleFrom(
//                 minimumSize: Size(double.infinity, 50), // Full width button
//               ),
//             ),
//           ],
//         ),
//       ),
//
//
//     );
//   }
//
// }



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/routes.dart';

import '../controllers/auth_controller.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final AuthController authController = Get.put(AuthController());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a valid Name';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
                validator: (value) {
                  if (value!.isEmpty || !value.contains('@')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),

              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
                validator: (value) {
                  if (value!.isEmpty || value!.length < 6) {
                    return 'Password must be at least 6 characters long';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),

              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Register'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      String email = emailController.text.trim();
      String password = passwordController.text.trim();
      authController.registerUser(context, email, password);
    } else {
      Get.snackbar(
        "Error",
        "Please fill in all fields correctly",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
