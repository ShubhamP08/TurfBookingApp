import 'package:flutter/gestures.dart';
import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:turf_booking_application/trash_pages/authcontroller.dart';
import 'package:turf_booking_application/google_signin/google_sign_in.dart';

// var emailController = TextEditingController();
// var passwordController = TextEditingController();

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List images = [
      "g.png",
      "f.png",
    ];
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Colors.green.shade100,
        body: SingleChildScrollView(
            child: Column(children: [
          Container(
              width: w,
              height: h * 0.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/Images/0img.png"),
                    fit: BoxFit.cover),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: h * 0.19,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white70,
                    radius: 50,
                    backgroundImage: AssetImage("assets/Images/singupimg.png"),
                  )
                ],
              )),
          SizedBox(
            height: 50,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            width: w,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Hello",
                style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
              ),
              Text(
                "Sign into your account",
                style: TextStyle(fontSize: 20, color: Colors.grey.shade700),
              ),
              SizedBox(
                height: 300,
              ),
              ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.black,
                    minimumSize: Size(double.infinity, 50),
                  ),
                  icon: FaIcon(
                    FontAwesomeIcons.google,
                    color: Colors.red,
                  ),
                  label: Text("Sign Up with Google"),
                  onPressed: () {
                    final provider = Provider.of<GoogleSignInProvider>(context,
                        listen: false);
                    provider.googleLogin();
                  }).paddingSymmetric(horizontal: 20),
              // RichText(
              //     text: TextSpan(
              //         recognizer: TapGestureRecognizer()
              //           ..onTap = () => Get.back(),
              //         text: "Have an Account, Login !",
              //         style: TextStyle(fontSize: 20, color: Colors.grey[700]))),
              SizedBox(height: w * 0.2),
              Center(
                child: RichText(
                    text: TextSpan(
                      text: "Version 0.0.1",
                      style: TextStyle(color: Colors.grey[700], fontSize: 16),
                )),
              ),
              // Wrap(
              //   children: List<Widget>.generate(
              //       2,
              //       (index) => Padding(
              //             padding: const EdgeInsets.all(10.0),
              //             child: CircleAvatar(
              //               radius: 30,
              //               backgroundColor: Colors.grey[500],
              //               child: CircleAvatar(
              //                 radius: 25,
              //                 backgroundImage:
              //                     AssetImage("assets/Images/" + images[index]),
              //               ),
              //             ),
              //           )),
              // )
            ]),
          )
        ])));
  }
}
