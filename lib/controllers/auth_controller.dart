import 'package:dimora_duomo/constants.dart';
import 'package:dimora_duomo/views/screens/screens.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;
  bool staffValue = false;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    //our user would be notified
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);
  }

  _initialScreen(User? user) {
    if (user == null) {
      debugPrint('login page');
      Get.offAll(() => const LoginPage());
    } else {
      if (staffValue) {
        Get.offAll(() => StaffPage());
      } else {
        Get.offAll(() => SelectRoomPage());
        // Get.offAll(() => StaffPage());
      }
    }
  }

  void register(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      Get.snackbar('About User', 'User message',
          colorText: kBackgroundColor,
          backgroundColor: kButtonSecondaryColor,
          titleText: const Text('Account creation failed',
              style: TextStyle(fontWeight: FontWeight.bold)),
          messageText: Text(e.message.toString()));
    }
  }

  void login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      Get.snackbar('About login', 'Login message',
          colorText: kBackgroundColor,
          backgroundColor: kButtonSecondaryColor,
          titleText: const Text('Login failed',
              style: TextStyle(fontWeight: FontWeight.bold)),
          messageText: Text(e.message.toString()));
    }
  }

  void resetPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      Get.snackbar('About reset', 'Reset message',
          colorText: kBackgroundColor,
          backgroundColor: kButtonSecondaryColor,
          titleText: const Text('Reset successfully password',
              style: TextStyle(fontWeight: FontWeight.bold)),
          messageText: const Text('Check in your spam folder'));
      Get.to(() => LoginEmailPage());
    } on FirebaseAuthException catch (e) {
      Get.snackbar('About reset', 'Reset message',
          colorText: kBackgroundColor,
          backgroundColor: kButtonSecondaryColor,
          titleText: const Text('Reset password failed',
              style: TextStyle(fontWeight: FontWeight.bold)),
          messageText: Text(e.message.toString()));
    }
  }

  void logOut() async {
    await auth.signOut();
  }
}
