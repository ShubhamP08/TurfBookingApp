import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turf_booking_application/pages/aboutus.dart';
import 'package:turf_booking_application/pages/homepage.dart';
import 'package:turf_booking_application/pages/locations.dart';
import 'package:turf_booking_application/pages/profile.dart';
import 'package:turf_booking_application/pages/signup_page.dart';

import '../trash_pages/authcontroller.dart';

class MyDrawer extends StatelessWidget {
  Widget listTile({IconData? icon, String? title}) {
    return ListTile(
      leading: Icon(
        icon,
        size: 32,
      ),
      title: Text(
        title!,
        style: TextStyle(color: Colors.black45),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Drawer(
      child: Container(
        width: 100,
        color: Colors.green[100],
        child: ListView(children: [
          DrawerHeader(
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white54,
                  radius: 43,
                  child: CircleAvatar(
                    backgroundColor: Colors.blueAccent[100],
                    backgroundImage: NetworkImage(user.photoURL!),
                    radius: 40,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Welcome, \n"+ user.displayName!,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                  ],
                )
              ],
            ),
          ),
          GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: listTile(icon: Icons.home_outlined, title: "Home")),
          GestureDetector(
            onTap: () {
              Get.to(ProfilePage());
            },
            child: listTile(
              icon: Icons.person,
              title: "My Profile",
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.to(AboutUs());
            },
            child: listTile(
              icon: Icons.info,
              title: "About Us",
            ),
          ),
          Container(
            height: 350,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("Contact Support"),
              SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Text("Call us: "),
                    SizedBox(
                      width: 10,
                    ),
                    Text("+91 1234567890")
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text("Mail us: "),
                  SizedBox(
                    width: 10,
                  ),
                  Text("abc@abc.com")
                ],
              ),
            ]),
          ),
        ]),
      ),
    );
  }
}
