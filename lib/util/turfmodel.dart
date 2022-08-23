import 'package:turf_booking_application/locations.dart';

class TurfModel {
  static List<Data> data = [];
}

class Data {
  final int id;
  final String name;
  final String price;
  final String add;
  final String loc;
  final String color;
  final int num;
  final String image;

  Data(
      {required this.id,
      required this.name,
      required this.price,
      required this.add,
      required this.loc,
      required this.color,
      required this.num,
      required this.image});

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
        id: map["id"],
        name: map["name"],
        loc: map["loc"],
        add: map["add"],
        price: map["price"],
        color: map["color"],
        num: map["num"],
        image: map["image"]);
  }
  toMap() => {
        "id": id,
        "name": name,
        "loc": loc,
        "add": add,
        "price": price,
        "color": color,
        "num":num,
        "image": image,
      };
}
