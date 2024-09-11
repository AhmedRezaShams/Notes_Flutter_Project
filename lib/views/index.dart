import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/controllers/splash_controller.dart';
import 'package:notes/routes.dart';
import 'package:notes/widgets/button.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Title Header
            Text(
              "Welcome to Notes",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10), // Spacing between header and subtitle

            // Subtitle Header (H5-like)
            Text(
              "Write and customize any types of notes easily",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40), // Spacing before buttons

            // Row for custom buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: CustomButton(text: 'Login', onPressed:(){

                  }),
                ),
                SizedBox(width: 20), // Spacing between the two buttons

                // Second Custom Button Area
                // Replace this Container with your custom button
                Container(
                  child: CustomButton(text: 'Register', onPressed:(){

                  }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
