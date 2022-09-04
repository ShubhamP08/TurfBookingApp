
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turf_booking_application/pages/book_page.dart';
import 'package:turf_booking_application/util/turfmodel.dart';
import 'package:velocity_x/velocity_x.dart';

class LocationDetails extends StatelessWidget {
  const LocationDetails({Key? key, required this.turf}) : super(key: key);
  final Data turf;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Details"),
      ),
      //backgroundColor: Colors.grey,
      
      bottomNavigationBar: Container(
        color: Colors.grey[300],
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
              child: Image.network(turf.image,),
            ).h32(context),
            Expanded(
              //   child: VxArc(
              // height: 30.0,
              // arcType: VxArcType.CONVEY,
              // edge: VxEdge.TOP,
              child: Container(
                color: Colors.green[100],
                width: context.screenWidth,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    turf.name.text.xl5.color(Colors.black).make().centered().paddingSymmetric(horizontal: 5),
                    SizedBox(height: 20,),
                    Text("Address", textAlign: TextAlign.left,style: TextStyle(
                      fontSize:22, fontWeight: FontWeight.bold,
                    ),).pSymmetric(h: 20),
                    turf.add.text.xl
                        .make().pSymmetric(h: 20),
                    SizedBox(height: 20,),
                    Text("Contact no.", textAlign: TextAlign.left,style: TextStyle(
                      fontSize:22, fontWeight: FontWeight.bold,
                    ),).pSymmetric(h: 20),
                    turf.num.text.xl.make().pSymmetric(h: 20),
                    SizedBox(height: 20,),
                    Text("More Details", textAlign: TextAlign.left,style: TextStyle(
                      fontSize:22, fontWeight: FontWeight.bold,
                    ),).pSymmetric(h: 20),
                    "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.".text.lg.make().pSymmetric(h: 20)
                  ],
                ).py(30),
              ),
            )
          ],
        ),
      ),
    );
  }
}
