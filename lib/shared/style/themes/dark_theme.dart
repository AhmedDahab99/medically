import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medically/shared/componnet/constants.dart';

ThemeData darkTheme = ThemeData(
    dividerTheme: DividerThemeData(

    ),
    primarySwatch: Colors.deepOrange,
    scaffoldBackgroundColor: Color(0xff010038),
    appBarTheme: AppBarTheme(
      titleSpacing: 20.0,
      backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Color(0xff010038),
        statusBarIconBrightness: Brightness.dark,
      ),
      backgroundColor: Color(0xff010038),
      elevation: 0,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 30.0,
        fontFamily: "ElMessiri-Bold",
        fontWeight: FontWeight.bold,
      ),
    ),
    cardTheme: CardTheme(
      color: Color(0xff537EC5),
      elevation: 2,
    ),
    textTheme: TextTheme(
      bodyText1: TextStyle(
          fontSize: 26.0,
          fontFamily: 'ElMessiri-Regular',
          fontWeight: FontWeight.w600,
          color: Colors.white),
      bodyText2: TextStyle(
          fontSize: 24.0,
          fontFamily: 'ElMessiri-Regular',
          fontWeight: FontWeight.w600,
          color: Colors.white),
      headline1: TextStyle(
          fontSize: 22.0,
          fontFamily: 'ElMessiri-Regular',
          fontWeight: FontWeight.w600,
          color: Colors.white),
      headline2: TextStyle(
          fontSize: 20.0,
          fontFamily: 'ElMessiri-Regular',
          fontWeight: FontWeight.w600,
          color: Colors.white),
      headline3: TextStyle(
          fontSize: 18.0,
          fontFamily: 'ElMessiri-Regular',
          fontWeight: FontWeight.w600,
          color: Colors.white),
      overline: TextStyle(
          fontSize: 16.0,
          fontFamily: 'ElMessiri-Regular',
          fontWeight: FontWeight.w600,
          color: Colors.white),
      caption: TextStyle(
          fontSize: 14.0, fontWeight: FontWeight.w600, color: Colors.white),
      subtitle1:TextStyle(
        fontSize: 12.0, fontWeight: FontWeight.w600, color: Colors.white70),
      subtitle2:TextStyle(
          fontSize: 10.0, fontWeight: FontWeight.w600, color: Colors.white70),
    ),
    primaryTextTheme: TextTheme(
      bodyText1: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
      ),
    ),
    primaryColorDark:Color(0xff293A80),
    primaryColorLight: Colors.white,
    fontFamily: 'ElMessiri-SemiBold');