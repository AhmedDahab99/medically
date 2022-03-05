import 'package:flutter/material.dart';
import 'package:medically/shared/componnet/component.dart';
import 'package:medically/shared/network/local/cached_helper.dart';
import 'package:flutter/painting.dart';


Color primaryColor = Color(0xffb4a5a5);
Color blueBlackColor = Color(0xff150e56);
Color redColor = Color(0xffce1212);
Color lightBlueColor = Color(0xff1dd0dd);
Color backgroundColor = Color(0xff151515);
TextStyle darkLabelStyle = TextStyle(
  fontSize: 16,
  letterSpacing: 1.0,
  fontWeight: FontWeight.w500,
  color: Colors.black,
);
TextStyle lightLabelStyle = TextStyle(
  fontSize: 16,
  letterSpacing: 1.0,
  fontWeight: FontWeight.w500,
  color: primaryColor,
);

void signOut(context) {
  CashedHelper.removeData(key: 'token').then((value) {
    if (value) {
      navigateAndFinish(context, Widget);
    }
  });
}

String token = '';


class Palette {
  static const Color iconColor = Color(0xFFB6C7D1);
  static const Color activeColor = Color(0xFF09126C);
  static const Color textColor1 = Color(0XFFA7BCC7);
  static const Color textColor2 = Color(0XFF9BB3C0);
  static const Color facebookColor = Color(0xFF3B5999);
  static const Color googleColor = Color(0xFFDE4B39);
  static const Color backgroundColor = Color(0xFFECF3F9);
}