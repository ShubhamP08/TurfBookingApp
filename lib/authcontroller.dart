import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turf_booking_application/loginpage.dart';
import 'package:turf_booking_application/homepage.dart';

class AuthController extends GetxController {
  //AuthController..Instance
  static AuthController instance = Get.find();
  //email, password, name....
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

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
      print("Login Page");
      Get.offAll(() => LoginPage());
    } else {
      Get.offAll(() => HomePage(email:user.email!));
    }
  }

  void register(String email, password)async {
    try {
      await auth.createUserWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar(
        "About User",
        "User message",
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.BOTTOM,
        titleText: Text("Account creation failed",
        style: TextStyle(
          color: Colors.white,
        )
        ),
        messageText: Text(
          e.toString(),
          style: TextStyle(
            color: Colors.white
          ),
        )
      );
    }
  }

  void login(String email, password)async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar(
        "About Login",
        "Login message",
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.BOTTOM,
        titleText: Text("Login failed",
        style: TextStyle(
          color: Colors.white,
        )
        ),
        messageText: Text(
          e.toString(),
          style: TextStyle(
            color: Colors.white
          ),
        )
      );
    }
  }

  void logout()async{
    await auth.signOut();
  }
}
