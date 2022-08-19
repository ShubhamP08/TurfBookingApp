import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turf_booking_application/aboutus.dart';
import 'package:turf_booking_application/authcontroller.dart';
import 'package:turf_booking_application/bookings.dart';
import 'package:turf_booking_application/drawer.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:turf_booking_application/locations.dart';
import 'package:turf_booking_application/profile.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required String email}) : super(key: key);

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
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            width: w,
            height: h * 0.3,
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
            height: 0,
          ),
          Container(
              height: h,
              width: 373,
              child: ListView(
                children: [
                  GestureDetector(
                    onTap: () { Get.to(()=>Locations());},
                    child: Container(
                      height: 100,
                      width: 150,
                      child: Center(child: Text(
                        "All Locations",
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),),
                      decoration: BoxDecoration(
                        color: Colors.white,
                    image: DecorationImage(
                        image: AssetImage("assets/Images/location.jpg"),
                      alignment: Alignment.centerLeft),
                                  )
                    ),
                  ),
                  SizedBox(height: 15,),
                  GestureDetector(
                    onTap: () { Get.to(()=>Bookings());},
                    child: Container(
                      height: 100,
                      width: 150,
                      child: Center(child: Text(
                        "All Bookings",
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),),
                      decoration: BoxDecoration(
                        color: Colors.white,
                    image: DecorationImage(
                        image: AssetImage("assets/Images/booking3.jpg"),
                        alignment: Alignment.centerLeft),
                                  )
                    ),
                  ),
                  SizedBox(height: 15,),
                  GestureDetector(
                    onTap: () { Get.to(()=>Profile());},
                    child: Container(
                      height: 100,
                      width: 150,
                      child: Center(child: Text(
                        "Profile",
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),),
                      decoration: BoxDecoration(
                        color: Colors.white,
                    image: DecorationImage(
                        image: AssetImage("assets/Images/profile2.png"),
                        alignment: Alignment.centerLeft),
                                  )
                    ),
                  ),
                  SizedBox(height: 15,),
                  GestureDetector(
                    onTap: () { Get.to(()=>AboutUs());},
                    child: Container(
                      height: 100,
                      width: 150,
                      child: Center(child: Text(
                        "About Us",
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),),
                      decoration: BoxDecoration(
                        color: Colors.white,
                    image: DecorationImage(
                        image: AssetImage("assets/Images/about.jpg"),
                        alignment: Alignment.centerLeft),
                                  )
                    ),
                  ),
                ],
              ),
              ),
        ],
      )),
    );
  }
}
