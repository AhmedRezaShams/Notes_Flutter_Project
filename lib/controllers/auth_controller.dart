// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';
// import 'package:notes/models/auth_model.dart';
//
// class AuthController extends GetxController {
//   FirebaseAuth _auth = FirebaseAuth.instance;
//   Rxn<UserModel> user = Rxn<UserModel>();
//
//   @override
//   void onInit() {
//     super.onInit();
//     user.bindStream(_auth.authStateChanges().map((User? firebaseUser) {
//       return firebaseUser != null ? UserModel(uid: firebaseUser.uid, email: firebaseUser.email!) : null;
//     }));
//   }
//
//   Future<void> register(String email, String password) async {
//     try {
//       await _auth.createUserWithEmailAndPassword(email: email, password: password);
//     } catch (e) {
//       Get.snackbar("Registration Error", e.toString());
//     }
//   }
//
//   Future<void> login(String email, String password) async {
//     try {
//       await _auth.signInWithEmailAndPassword(email: email, password: password);
//     } catch (e) {
//       Get.snackbar("Login Error", e.toString());
//     }
//   }
//
//   void logout() async {
//     await _auth.signOut();
//   }
// }
