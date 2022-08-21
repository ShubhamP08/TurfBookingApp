import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:turf_booking_application/authcontroller.dart';
import 'package:turf_booking_application/edit_profile_page.dart';
import 'package:turf_booking_application/loginpage.dart';
import 'package:turf_booking_application/profile.dart';
import 'package:turf_booking_application/signup_page.dart';
import 'package:turf_booking_application/splashscreen.dart';
import 'package:turf_booking_application/homepage.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:turf_booking_application/util/user_prefrences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(AuthController()));
  await UserPreferences.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = "User Profile";
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.getUser();
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
