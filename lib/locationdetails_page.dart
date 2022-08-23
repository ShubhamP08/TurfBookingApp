
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turf_booking_application/book_page.dart';
import 'package:turf_booking_application/util/turfmodel.dart';
import 'package:velocity_x/velocity_x.dart';

class LocationDetails extends StatelessWidget {
  const LocationDetails({Key? key, required this.turf}) : super(key: key);
  final Data turf;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      //backgroundColor: Colors.grey,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\u{20B9} ${turf.price}".text.bold.xl3.red800.make(),
            ElevatedButton(
                    onPressed: () {
                      Get.to(() => BookPage());
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Colors.green),
                        shape: MaterialStateProperty.all(StadiumBorder())),
                    child: "Book".text.white.xl.make())
                .wh(100, 50)
          ],
        ).p16(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(turf.id.toString()),
              child: Image.network(turf.image),
            ).h32(context),
            Expanded(
              //   child: VxArc(
              // height: 30.0,
              // arcType: VxArcType.CONVEY,
              // edge: VxEdge.TOP,
              child: Container(
                color: context.cardColor,
                width: context.screenWidth,
                child: Column(
                  children: [
                    turf.name.text.xl4.color(Colors.black).make(),
                    turf.add.text
                        .textStyle(context.captionStyle)
                        .lg
                        .make().pSymmetric(h: 5),
                    SizedBox(height: 10,),
                    turf.num.text.textStyle(context.captionStyle).lg.make(),
                  ],
                ).py64(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
