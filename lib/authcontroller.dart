import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:turf_booking_application/loginpage.dart';
import 'package:turf_booking_application/welcomepage.dart';

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
  }

  _initialScreen(User? user) {
    if (user == null) {
      print("Login Page");
      Get.offAll(() => LoginPage());
    } else {
      Get.offAll(() => WelcomePage());
    }
  }
}
