import 'package:provider/provider.dart';
import 'package:turf_booking_application/signup_page.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turf_booking_application/loginpage.dart';
import 'package:turf_booking_application/menu_item.dart';
import 'package:turf_booking_application/aboutus.dart';
import 'package:turf_booking_application/authcontroller.dart';
import 'package:turf_booking_application/bookings.dart';
import 'package:turf_booking_application/drawer.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:turf_booking_application/locations.dart';
import 'package:turf_booking_application/profile.dart';
import 'package:turf_booking_application/menu_item.dart';
import 'package:turf_booking_application/items.dart';

import 'google_sign_in.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List _list = [];
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Turf Arena"),
        centerTitle: true,
        actions: [
          PopupMenuButton<MenuItems>(
            onSelected: (item) => onSelected(context, item),
            itemBuilder: (context) => [
              ...Items.Second.map(buildItem).toList()
            ],
          ),
        ],
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            width: w,
            height: h * 0.24,
            child: SafeArea(
              child: Center(
                  child: ListView(
                padding: EdgeInsets.all(10),
                children: [
                  SizedBox(
                    height: 200.0,
                    width: double.infinity,
                    child: Carousel(
                        dotSize: 4.0,
                        dotSpacing: 30,
                        animationCurve: Curves.fastOutSlowIn,
                        dotBgColor: Colors.transparent.withOpacity(0),
                        autoplayDuration: Duration(milliseconds: 2000),
                        animationDuration: Duration(milliseconds: 1000),
                        images: [
                          Image.asset(
                            "assets/Images/0img.png",
                            fit: BoxFit.cover,
                          ),
                          Image.asset(
                            "assets/Images/1img.jpg",
                            fit: BoxFit.cover,
                          ),
                          Image.asset(
                            "assets/Images/2img.jpg",
                            fit: BoxFit.cover,
                          ),
                          Image.asset(
                            "assets/Images/3img.jpg",
                            fit: BoxFit.cover,
                          ),
                          Image.asset(
                            "assets/Images/4img.jpg",
                            fit: BoxFit.cover,
                          ),
                          Image.asset(
                            "assets/Images/5img.jpeg",
                            fit: BoxFit.cover,
                          ),
                        ]),
                  )
                ],
              )),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 38,
            width: 410,
            alignment: Alignment.bottomLeft,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Text(
                "DashBoard",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  //fontFamily: "Algerian",
                ),
              ).pOnly(left: 8)
            ]),
          ),
          SizedBox(
            height: 3,
          ),
          Container(
            height: h,
            width: 410,
            child: ListView(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(() => Locations());
                  },
                  child: Container(
                      height: 100,
                      width: 150,
                      child: Center(
                        child: Text(
                          "All Locations",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                            image: AssetImage("assets/Images/location.jpg"),
                            alignment: Alignment.centerLeft),
                      )),
                ),
                SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => Bookings());
                  },
                  child: Container(
                      height: 100,
                      width: 150,
                      child: Center(
                        child: Text(
                          "All Bookings",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                            image: AssetImage("assets/Images/booking3.jpg"),
                            alignment: Alignment.centerLeft),
                      )),
                ),
                SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => ProfilePage());
                  },
                  child: Container(
                      height: 100,
                      width: 150,
                      child: Center(
                        child: Text(
                          "Profile",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                            image: AssetImage("assets/Images/profile2.png"),
                            alignment: Alignment.centerLeft),
                      )),
                ),
                SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => AboutUs());
                  },
                  child: Container(
                      height: 100,
                      width: 150,
                      child: Center(
                        child: Text(
                          "About Us",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                            image: AssetImage("assets/Images/about.jpg"),
                            alignment: Alignment.centerLeft),
                      )),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }

  PopupMenuItem<MenuItems> buildItem(MenuItems item) =>
      PopupMenuItem<MenuItems>(
        value: item,
        child: Row(
          children: [
            Icon(item.icon, color: Colors.green, size: 20),
            const SizedBox(
              width: 12,
            ),
            Text(item.text)
          ],
        ),
      );

  void onSelected(BuildContext context, MenuItems item) {
    final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
    provider.logout();
    // switch (item) {
    //   case Items.logout:
    //     Navigator.of(context)
    //         .push(MaterialPageRoute(builder: (context) => SignupPage()));
    // }
  }
}
