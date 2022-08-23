import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:turf_booking_application/authcontroller.dart';
import 'package:turf_booking_application/loginpage.dart';
import 'package:turf_booking_application/profile.dart';
import 'package:turf_booking_application/signup_page.dart';
import 'package:turf_booking_application/homepage.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:turf_booking_application/splashscreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(AuthController()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = "User Profile";
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}
