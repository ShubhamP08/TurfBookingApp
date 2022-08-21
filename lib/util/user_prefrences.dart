
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:turf_booking_application/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static late SharedPreferences _preferences;
  static const _keyUser = 'user';
  

  static const myUser = Hello(
    imagePath:'https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_960_720.png',
    name:'Enter Your Name',
    email: 'Enter your Email',
    about:'Describe Yourself',
    );
    static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUser(Hello user) async {
    final json = jsonEncode(user.toJson());

    await _preferences.setString(_keyUser, json);
  }

  static Hello getUser() {
    final json = _preferences.getString(_keyUser);
    return json == null ? myUser : Hello.fromJson(jsonDecode(json));
    
  }
}
