import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:turf_booking_application/pages/homepage.dart';
import 'package:turf_booking_application/util/turfmodel.dart';
import 'package:velocity_x/velocity_x.dart';

class Bookings extends StatefulWidget {
  const Bookings({Key? key}) : super(key: key);

  @override
  State<Bookings> createState() => _BookingsState();
}

class _BookingsState extends State<Bookings> {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> deleteBook(id) {
    return users.doc(id).delete().then((value) => print('Booking Deleted'));
  }

  @override
  Widget build(BuildContext context) {
    final Data turf;
    final Stream<QuerySnapshot> usersStream =
        FirebaseFirestore.instance.collection('users').snapshots();
    return Scaffold(
        appBar: AppBar(
          title: Text('Bookings'),
          leading: new IconButton(
              onPressed: () {
                Get.to(HomePage());
              },
              icon: new Icon(Icons.arrow_back)),
        ),
        backgroundColor: Colors.grey[300],
        body: StreamBuilder<QuerySnapshot>(
            stream: usersStream,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                print('Something Went Wrong');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              final List storedocs = [];
              snapshot.data!.docs.map((DocumentSnapshot document) {
                Map a = document.data() as Map<String, dynamic>;
                storedocs.add(a);
                a['id'] = document.id;
              }).toList();
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot documentSnapshot =
                      snapshot.data!.docs[index];
                  return GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                                title: Text('Alert'),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Container(
                                      child: Text(
                                        "Do you want to Cancel this Turf Booking",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.red, fontSize: 18),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        FlatButton(
                                          onPressed: () {
                                            deleteBook(storedocs[index]['id']);
                                            Navigator.of(context).pop();
                                          },
                                          child: Text(
                                            "Yes",
                                            style: TextStyle(fontSize: 16),
                                          ),
                                        ),
                                        FlatButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text("No",
                                              style: TextStyle(fontSize: 16)),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ));
                    },
                    child: Card(
                      margin: const EdgeInsets.all(20),
                      
                      elevation: 5,
                      child: ListTile(
                        leading: ConstrainedBox(
                          constraints: BoxConstraints(
                            minWidth: 44,
                            minHeight: 44,
                            maxWidth: 100,
                            maxHeight: 100,
                          ),
                          child: Image.asset("assets/Images/booked.jpg"),
                        ),
                        trailing: Text(
                          "PAID",
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        title: Text(documentSnapshot['name']),
                        subtitle: Text(documentSnapshot['number'].toString()),
                        tileColor: Colors.white,
                      ),
                    ),
                  );
                },
              );
            }));
  }
}
