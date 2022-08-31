import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:turf_booking_application/pages/locationdetails_page.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';
import 'package:turf_booking_application/util/data_widget.dart';
import 'package:turf_booking_application/util/turfmodel.dart';

import 'book_page.dart';

class Locations extends StatefulWidget {
  const Locations({Key? key}) : super(key: key);

  @override
  State<Locations> createState() => _LocationsState();
}

class _LocationsState extends State<Locations> {
  @override
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text("Location"),
        backgroundColor: Colors.green,
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m24,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LocHeader(),
              if (TurfModel.data != null && TurfModel.data.isNotEmpty)
                TurfList().expand()
              else
                Center(
                  child: CircularProgressIndicator(),
                )
            ],
          ),
        ),
      ),
    );
  }
}

class LocHeader extends StatelessWidget {
  const LocHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "All Turfs".text.xl4.bold.color(Colors.green).make(),
      ],
    );
  }
}

class TurfList extends StatelessWidget {
  const TurfList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: TurfModel.data.length,
        itemBuilder: (context, index) {
          final turf = TurfModel.data[index];
          return InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (Context) => LocationDetails(
                turf: turf ,
              ),
            ),
          ),
          child: TurfItem(turf: turf,),
        );
        });
  }
}

class TurfItem extends StatelessWidget {
  final Data turf;

  const TurfItem({Key? key, required this.turf})
      : assert(turf != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(children: [
        Image.network(turf.image).box.make().p16().w40(context),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            turf.name.text.lg.bold.make(),
            turf.loc.text.textStyle(context.captionStyle).make(),
            SizedBox(height: 10,),
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.zero,
              children: [
                "\u{20B9} ${turf.price}".text.make(),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green),
                            shape: MaterialStateProperty.all(StadiumBorder())
                            ),
                    onPressed: () {Get.to(() => BookPage());},
                    child: "Book".text.make())
              ],
            ).pOnly(right: 8.0)
          ],
        ))
      ]),
    ).white.rounded.square(150).make().py16();
  }
}
