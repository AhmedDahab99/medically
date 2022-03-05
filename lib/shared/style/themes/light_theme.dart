import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medically/shared/componnet/constants.dart';

ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.deepOrange,
    scaffoldBackgroundColor: Color(0xffFFFfff),
    appBarTheme: AppBarTheme(
      titleSpacing: 20.0,
      backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Color(0xffFFFfff),
        statusBarIconBrightness: Brightness.light,
      ),
      backgroundColor: Color(0xffFFFfff),
      elevation: 0,
      titleTextStyle: TextStyle(
        color: Color(0xff7868E6),
        fontSize: 30.0,
        fontFamily: "ElMessiri-Bold",
        fontWeight: FontWeight.bold,
      ),
    ),
    cardTheme: CardTheme(
      color: Color(0xffE4FBFF)
    ),
    textTheme: TextTheme(
      bodyText1: TextStyle(
          fontSize: 26.0,
          fontFamily: 'ElMessiri-Regular',
          fontWeight: FontWeight.w600,
          color: Color(0xff7868E6)),
      bodyText2: TextStyle(
          fontSize: 24.0,
          fontFamily: 'ElMessiri-Regular',
          fontWeight: FontWeight.w600,
          color: Color(0xff7868E6)),
      headline1: TextStyle(
          fontSize: 22.0,
          fontFamily: 'ElMessiri-Regular',
          fontWeight: FontWeight.w600,
          color: Color(0xff7868E6)),
      headline2: TextStyle(
          fontSize: 20.0,
          fontFamily: 'ElMessiri-Regular',
          fontWeight: FontWeight.w600,
          color: Color(0xff7868E6)),
      headline3: TextStyle(
          fontSize: 18.0,
          fontFamily: 'ElMessiri-Regular',
          fontWeight: FontWeight.w600,
          color: Color(0xff7868E6)),
      overline: TextStyle(
          fontSize: 16.0,
          fontFamily: 'ElMessiri-Regular',
          fontWeight: FontWeight.w600,
          color: Color(0xff7868E6)),
      caption: TextStyle(
          fontSize: 14.0, fontWeight: FontWeight.w600, color: Color(0xff7868E6)),
      subtitle1:TextStyle(
          fontSize: 12.0, fontWeight: FontWeight.w600, color: Color(0xff7868E6)),
      subtitle2:TextStyle(
          fontSize: 10.0, fontWeight: FontWeight.w600, color: Color(0xff7868E6)),
    ),
    primaryTextTheme: TextTheme(
      bodyText1: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
      ),
    ),
    primaryColorDark:Color(0xff7868E6),
    primaryColorLight: Color(0xffDEEDF0),
    fontFamily: 'ElMessiri-Regular');

