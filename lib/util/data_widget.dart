import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/src/foundation/key.dart';
import 'package:turf_booking_application/util/turfmodel.dart';

class DataWidget extends StatelessWidget {
  final Data data;
  const DataWidget({Key? key, required this.data})
      : assert(data != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: ListTile(
        onTap: () {
          
        },
        leading: Image.network(data.image),
        title: Text(data.name),
        subtitle: Text(data.loc),
        trailing: Text("\u{20B9}${data.price}",
        style: TextStyle(
          color: Colors.green,
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
        ),
      ),
    );
  }
}
