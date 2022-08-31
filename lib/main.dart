import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:turf_booking_application/authcontroller.dart';
import 'package:turf_booking_application/google_sign_in.dart';
import 'package:turf_booking_application/logged_in_page.dart';
import 'package:turf_booking_application/loginpage.dart';
import 'package:turf_booking_application/profile.dart';
import 'package:turf_booking_application/signup_page.dart';
import 'package:turf_booking_application/homepage.dart';
import 'package:get/get.dart';
import 'package:turf_booking_application/splashscreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  static final String title = "User Profile";

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print("Something Went Wrong");
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return ChangeNotifierProvider(
              create: (context) => GoogleSignInProvider(),
              child: GetMaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Flutter',
                theme: ThemeData(
                  primarySwatch: Colors.green,
                ),
                home: LoggedHome(),
              ),
            );
            // return CircularProgressIndicator();
          }
          SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
          
          return CircularProgressIndicator();
        });
  }
}
