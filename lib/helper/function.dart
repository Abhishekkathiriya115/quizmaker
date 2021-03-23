import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HelperFunction {
  static String UserLoggedInKey = "ISLOGGEDIN";

  static Future<bool> saveUserLoggedInDetail(
       {bool isUserLoggedIn}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setBool(
        UserLoggedInKey, isUserLoggedIn);
  }

  static Future<bool> getUerLoggedInDetail() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.get(UserLoggedInKey);
  }
}