import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:turf_booking_application/util/profile_widget.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Profile Page"),
      ),
      
      body: Container(
        alignment: Alignment.center,
        
        child: Column(
          
          children: [
            Container(
            padding: Vx.m24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "User Details"
                          .text
                          .xl5
                          .bold
                          .color(Colors.green)
                          .make(),
                    ],
                  ),
                )
              ],
            ),
          ),
            SizedBox(height: 100,),
            CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(user.photoURL!),
          ),
          SizedBox(height: 10,),
          Text(
            'Name: ' + user.displayName!,
            style:TextStyle(color: Colors.black,fontSize: 20) ,
          ),
          SizedBox(height:10 ,),
          Text(
            'Email: ' + user.email!,
            style:TextStyle(color: Colors.black,fontSize: 20) ,
          ),
          ] 
        ),
      ),
      // body: ListView(
      //   physics: BouncingScrollPhysics(),
      //   children: [
      //     SizedBox(
      //       height: 45,
      //     ),
      //     ProfileWidget(),
      //     const SizedBox(height: 24),
      //     buildName(),
      //     const SizedBox(height: 24),
      //   ],
      // ),
    );
  }
}

// Widget buildName() => Column(
//       children: [
//         Text(
//           "Bill Gates",
//           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
//         ),
//         const SizedBox(height: 4),
//         Text(
//           "billgates123@gmail.com",
//           style: TextStyle(color: Colors.grey),
//         )
//       ],
//     );
