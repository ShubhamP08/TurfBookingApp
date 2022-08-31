import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:turf_booking_application/pages/bookings.dart';
import 'package:turf_booking_application/util/turfmodel.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

TextEditingController _name = TextEditingController();
TextEditingController _times = TextEditingController();
TextEditingController _timee = TextEditingController();
TextEditingController _price = TextEditingController();

class BookPage extends StatefulWidget {
  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  Data? turf;
  final _formKey = GlobalKey<FormState>();
  var name = "";
  var email = "";
  var number = "";
  var time;
  var date;
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final numberController = TextEditingController();
  final timeController = TextEditingController();
  final datecontroller = TextEditingController();

  @override
  // void dispose() {
  //   Clean up the controller when the widget is disposed.
  //   nameController.dispose();
  //   emailController.dispose();
  //   numberController.dispose();
  //   timeController.dispose();
  //   super.dispose();
  // }

  // clearText() {
  //   nameController.clear();
  //   emailController.clear();
  //   numberController.clear();
  //   timeController.clear();
  // }

  // Adding Student
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> addUser() {
    return users
        .add({
          'name': name,
          'email': email,
          'number': number,
          'time': time,
          'date': date
        })
        .then((value) => print('User Added'))
        .catchError((error) => print('Failed to Add user: $error'));
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Book Your Turf"),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                      "Booking Details"
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
          Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: ListView(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      child: TextFormField(
                        autofocus: false,
                        decoration: InputDecoration(
                          icon: Icon(Icons.supervised_user_circle),
                          labelText: 'Name',
                          labelStyle: TextStyle(fontSize: 20.0),
                          border: OutlineInputBorder(),
                          errorStyle:
                              TextStyle(color: Colors.redAccent, fontSize: 15),
                        ),
                        controller: nameController,
                        validator: (value) {
                          if (value!.isEmpty ||
                              !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                            return 'Please Enter Name Correctly';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      child: TextFormField(
                        autofocus: false,
                        decoration: InputDecoration(
                          icon: Icon(Icons.email),
                          labelText: 'Email',
                          labelStyle: TextStyle(fontSize: 20.0),
                          border: OutlineInputBorder(),
                          errorStyle:
                              TextStyle(color: Colors.redAccent, fontSize: 15),
                        ),
                        controller: emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Email';
                          } else if (!value.contains('@')) {
                            return 'Please Enter Valid Email';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      child: TextFormField(
                        autofocus: false,
                        decoration: InputDecoration(
                          icon: Icon(Icons.numbers_sharp),
                          labelText: 'Phone no',
                          labelStyle: TextStyle(fontSize: 20.0),
                          border: OutlineInputBorder(),
                          errorStyle:
                              TextStyle(color: Colors.redAccent, fontSize: 15),
                        ),
                        controller: numberController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Phone no';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      child: TextFormField(
                        autofocus: false,
                        decoration: InputDecoration(
                          icon: Icon(Icons.access_time),
                          labelText: 'Time',
                          labelStyle: TextStyle(fontSize: 20.0),
                          border: OutlineInputBorder(),
                          errorStyle:
                              TextStyle(color: Colors.redAccent, fontSize: 15),
                        ),
                        controller: timeController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Time';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      child: TextField(
                        decoration: InputDecoration(
                          icon: Icon(Icons.calendar_today_rounded),
                          labelText: 'Select Date',
                          labelStyle: TextStyle(fontSize: 20.0),
                          border: OutlineInputBorder(),
                          errorStyle:
                              TextStyle(color: Colors.redAccent, fontSize: 15),
                        ),
                        controller: datecontroller,
                        onTap: () async {
                          DateTime? pickeddate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2022),
                              lastDate: DateTime(2024));
                          if (pickeddate != null) {
                            setState(() {
                              datecontroller.text =
                                  DateFormat.yMd().format(pickeddate);
                            });
                          }
                        },
                      ),
                    )
                  ]),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.green),
            ),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                name = nameController.text;
                email = emailController.text;
                number = numberController.text;
                time = timeController.text;
                date = datecontroller.text;
                addUser();
                showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                          title: Text('Your Turf is Booked'),
                          actions: [
                            OutlinedButton(
                                onPressed: () {
                                  Get.to(Bookings());
                                },
                                child: Text("Okay"))
                          ],
                        ));
              }
            },
            child: Text(
              "Book",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ).pSymmetric(h: 10),
        ],
      ),
    );
  }
}
