import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/src/foundation/key.dart';
import 'package:get/get.dart';
import 'package:turf_booking_application/util/turfmodel.dart';
import 'package:velocity_x/velocity_x.dart';

TextEditingController _name = TextEditingController();
TextEditingController _times = TextEditingController();
TextEditingController _timee = TextEditingController();
TextEditingController _price = TextEditingController();

class BookPage extends StatefulWidget {
  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    var turfJson = await rootBundle.loadString("assets/Images/turf_data.json");
    var decodeData = jsonDecode(turfJson);
    var turfData = decodeData["TurfData"];
    TurfModel.data =
        List.from(turfData).map<Data>((item) => Data.fromMap(item)).toList();

    setState(() {});
  }

  TextEditingController _name = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
          SizedBox(
            height: 15,
          ),
          nameTextField(),
          SizedBox(
            height: 30,
          ),
          timesField(),
          SizedBox(
            height: 15,
          ),
          timeeField(),
          SizedBox(
            height: 15,
          ),
          priceField(),
          SizedBox(
            height: 25,
          ),
          ElevatedButton(
            style: ButtonStyle(
              
              backgroundColor: MaterialStateProperty.all(Colors.green),
            ),
                onPressed: () {},
                child: 
                  Text(
                  "Book",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ),
          
        ],
      ),
    );
  }
}

Widget nameTextField() {
  return TextFormField(
    controller: _name,
    validator: (value) {
      if (value!.isEmpty) return "Name can't be empty";

      return null;
    },
    decoration: InputDecoration(
      border: OutlineInputBorder(
          borderSide: BorderSide(
        color: Colors.teal,
      )),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
        color: Colors.orange,
        width: 2,
      )),
      prefixIcon: Icon(
        Icons.person,
        color: Colors.green,
      ),
      labelText: "Name",
      hintText: "Sundar pichai",
    ),
  );
}

Widget timesField() {
  return TextFormField(
    controller: _times,
    validator: (value) {
      if (value!.isEmpty) return "Time cannot be Empty";

      return null;
    },
    decoration: InputDecoration(
      border: OutlineInputBorder(
          borderSide: BorderSide(
        color: Colors.teal,
      )),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
        color: Colors.orange,
        width: 2,
      )),
      prefixIcon: Icon(
        Icons.timer,
        color: Colors.green,
      ),
      labelText: "Start Time",
      helperText: "Enter Start Time",
      hintText: "00:00",
    ),
  );
}

Widget timeeField() {
  return TextFormField(
    controller: _timee,
    validator: (value) {
      if (value!.isEmpty) return "Time cannot be Empty";

      return null;
    },
    decoration: InputDecoration(
      border: OutlineInputBorder(
          borderSide: BorderSide(
        color: Colors.teal,
      )),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
        color: Colors.orange,
        width: 2,
      )),
      prefixIcon: Icon(
        Icons.timer,
        color: Colors.green,
      ),
      labelText: "End Time",
      helperText: "Enter End Time",
      hintText: "00:00",
    ),
  );
}

Widget priceField() {
  return TextField(
    enabled: false,
    controller: _price,
    decoration: InputDecoration(
      border: OutlineInputBorder(
          borderSide: BorderSide(
        color: Colors.teal,
      )),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
        color: Colors.orange,
        width: 2,
      )),
      prefixIcon: Icon(
        Icons.attach_money_outlined,
        color: Colors.green,
      ),
    ),
  );
}
