import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About us"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Container(
          
          child: RaisedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LicensePage(
                    applicationName: "Turf Booking App",
                    applicationIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.account_circle),
                    ),
                    applicationVersion: "0.0.1",
                  )));
            },
            child: Text("License Page"),
          ),
        ),
      ),
    );
  }
}
