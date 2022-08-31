import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:turf_booking_application/util/turfmodel.dart';
import 'package:velocity_x/velocity_x.dart';

class Bookings extends StatelessWidget {
  const Bookings({Key? key}) : super(key: key);
  // final Data turf;
  @override
  Widget build(BuildContext context) {
    final Data turf;
    final Stream<QuerySnapshot> usersStream =
        FirebaseFirestore.instance.collection('users').snapshots();
    return Scaffold(
      appBar: AppBar(
        title: Text('Bookings'),
      ),
      backgroundColor: Colors.grey[300],
      body: StreamBuilder<QuerySnapshot>(
          stream: usersStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot documentSnapshot =
                      snapshot.data!.docs[index];
                  return Card(
                    margin: const EdgeInsets.all(10),
                    elevation: 5,
                    child: ListTile(
                      leading: ConstrainedBox(
                        constraints: BoxConstraints(
                        minWidth: 44,
                        minHeight: 44,
                        maxWidth: 100,
                        maxHeight: 100,
                      ),
                      child: Image.network("https://5.imimg.com/data5/UF/VO/WA/SELLER-2751211/fifa-certified-artificial-football-grass-500x500.jpg"),
                    ),
                      trailing: Text("PAID",style: TextStyle(color: Colors.green,fontSize: 20,fontWeight: FontWeight.bold),),
                      title: Text(documentSnapshot['name']),
                      subtitle: Text(documentSnapshot['number'].toString()),
                      tileColor: Colors.white,
                    ),
                  );
                },
              );
            }
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
            }).toList();
            return Container();
          }),
    );
  }
}
