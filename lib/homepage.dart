import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:turf_booking_application/authcontroller.dart';

class HomePage extends StatelessWidget {
  String email;
  HomePage({Key? key, required this.email}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Colors.green.shade100,
        body: Column(children: [
          Container(
              width: w,
              height: h * 0.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/Images/loginimg2.png"),
                    fit: BoxFit.cover),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: h * 0.16,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white70,
                    radius: 50,
                    backgroundImage: AssetImage("assets/Images/singupimg.png"),
                  )
                ],
              )),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            width: w,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                SizedBox(
                height: 15,
              ),
            ]),
          ),
          SizedBox(
            height: 60,
          ),
          Container(
            width: w,
            margin: const EdgeInsets.only(left:20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text("Welcome", style: TextStyle(
            fontSize: 36, 
            fontWeight: FontWeight.bold, 
            color: Colors.grey[800]),),
          Text(email, 
            style: TextStyle(fontSize: 18,),
            ),],)
              
          ),
          SizedBox(height: 200,),
          GestureDetector(
            onTap: (() => AuthController.instance.logout()),
            child: Container(
              width: w * 0.5,
              height: h * 0.08,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                    image: AssetImage("assets/Images/imagebtn1.jpg"),
                    fit: BoxFit.cover),
              ),
              child: Center(
                child: Text(
                  "Sign Out",
                  style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(height: w * 0.15),
        ]));
  }
}
