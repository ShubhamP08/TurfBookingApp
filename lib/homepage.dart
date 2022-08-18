import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turf_booking_application/authcontroller.dart';
import 'package:turf_booking_application/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required String email}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Turf Booking Application"),
      ),
      drawer: MyDrawer(),
    );
  }
}
