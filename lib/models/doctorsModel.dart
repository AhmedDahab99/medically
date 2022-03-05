import 'package:flutter/material.dart';

class DoctorsModel {
  final String image;
  final String name;
  final String job;
  final dynamic rate;
  final int numOfPatients;
  final dynamic price;
  final int phone;
  final String info;
  final String address;
  final String city;
  final String day;
  final String time;
  final String categoryName;

  DoctorsModel({@required this.image,
    @required this.name,
    @required this.job,
    @required this.rate,
    @required this.numOfPatients,
    @required this.price,
    @required this.phone,
    @required this.info,
    @required this.address,
    @required this.city,
    @required this.day,
    @required this.time,
    @required this.categoryName,});
}
