import 'package:flutter/material.dart';
import 'package:turf_booking_application/menu_item.dart';

class Items {
  static const List<MenuItems> First = [theme];
  static const List<MenuItems> Second = [logout];

  static const theme = MenuItems(text: "Theme", icon: Icons.light_mode);
  static const logout = MenuItems(text: "Logout", icon: Icons.logout);
}
