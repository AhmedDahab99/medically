import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medically/models/cateModel.dart';
import 'package:medically/shared/componnet/constants.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../shared/cubit/app_cubit.dart';
import '../../../shared/cubit/app_states.dart';
import '../../../shared/style/themes/dark_theme.dart';
import '../../../shared/style/themes/light_theme.dart';

class ProfileScreen extends StatelessWidget {
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

  const ProfileScreen({
    @required this.image,
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
  });
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, states) => {},
      builder: (context, states) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: AppCubit.get(context).isDark
                ? darkTheme.scaffoldBackgroundColor
                : lightTheme.scaffoldBackgroundColor,
            body: getBody(context),
          ),
        );
      },
    );
  }

  Widget getBody(context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: size.height * 0.28,
            decoration: BoxDecoration(
              image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                      Colors.blue.withOpacity(0.5), BlendMode.darken),
                  image: NetworkImage(
                      "https://st.depositphotos.com/1389715/3133/i/950/depositphotos_31330561-stock-photo-european-luxury-medical-clinic.jpg"),
                  fit: BoxFit.cover),
            ),
            child: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Card(
                          elevation: 15,
                          color: Colors.white38,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                          child: CircleAvatar(
                            radius: 25,
                            backgroundColor: AppCubit.get(context).isDark
                                ? darkTheme.primaryColorLight.withOpacity(0.6)
                                : lightTheme.buttonColor.withOpacity(.6),
                            child: Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: AppCubit.get(context).isDark
                                  ? darkTheme.primaryColorDark
                                  : lightTheme.primaryColorDark,
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: size.height * 0.24),
            width: double.infinity,
            decoration: BoxDecoration(
                color: AppCubit.get(context).isDark
                    ? darkTheme.scaffoldBackgroundColor
                    : lightTheme.scaffoldBackgroundColor,
                // color: Colors.white,
                borderRadius: BorderRadius.circular(50)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // clinic's info
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            // doctor name
                            Text(
                              name,
                              style: AppCubit.get(context).isDark
                                  ? darkTheme.textTheme.headline3
                                  : lightTheme.textTheme.headline3,
                              textScaleFactor: 1,
                              textDirection: TextDirection.rtl,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            // job
                            Text(
                              job,
                              textDirection: TextDirection.rtl,
                              maxLines: 2,
                              textScaleFactor: 1,
                              style: AppCubit.get(context).isDark
                                  ? darkTheme.textTheme.subtitle1
                                  : lightTheme.textTheme.subtitle1,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 8),
                              child: Column(
                                children: [
                                  // rating
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "التقيـــــــم",
                                            textDirection: TextDirection.rtl,
                                            style: AppCubit.get(context).isDark
                                                ? darkTheme.textTheme.caption
                                                : lightTheme.textTheme.caption,
                                          ),
                                          Text(
                                            rate,
                                            textDirection: TextDirection.rtl,
                                            style: AppCubit.get(context).isDark
                                                ? darkTheme.textTheme.overline
                                                .copyWith(color: Colors.white70)
                                                : lightTheme.textTheme.overline.copyWith(
                                                color: Colors.black45
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      IconButton(
                                        icon: Icon(
                                          FontAwesomeIcons.star,
                                          color: AppCubit.get(context).isDark
                                              ? darkTheme.primaryColorLight
                                              : lightTheme.primaryColorDark,
                                          size: 25,
                                        ),
                                        onPressed: () {},
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    color: AppCubit.get(context).isDark
                                        ? darkTheme.primaryColorLight
                                        : lightTheme.primaryColorDark,
                                  ),
                                  // number of patients
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "عدد المرضي",
                                            textDirection: TextDirection.rtl,
                                            style: AppCubit.get(context).isDark
                                                ? darkTheme.textTheme.caption
                                                : lightTheme.textTheme.caption,
                                          ),
                                          Text(
                                            numOfPatients.toString(),
                                            textDirection: TextDirection.rtl,
                                            style: AppCubit.get(context).isDark
                                                ? darkTheme.textTheme.overline
                                                .copyWith(color: Colors.white70)
                                                : lightTheme.textTheme.overline.copyWith(
                                                color: Colors.black45
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      IconButton(
                                        icon: Icon(
                                          FontAwesomeIcons.userAlt,
                                          color: AppCubit.get(context).isDark
                                              ? darkTheme.primaryColorLight
                                              : lightTheme.primaryColorDark,
                                          size: 25,
                                        ),
                                        onPressed: () {},
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    color: AppCubit.get(context).isDark
                                        ? darkTheme.primaryColorLight
                                        : lightTheme.primaryColorDark,
                                  ),
                                  // price
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "الكشف",
                                            textDirection: TextDirection.rtl,
                                            style: AppCubit.get(context).isDark
                                                ? darkTheme.textTheme.caption
                                                : lightTheme.textTheme.caption,
                                          ),
                                          Text(
                                            "${price.toString()}  جنيهاً",
                                            textDirection: TextDirection.rtl,
                                            style: AppCubit.get(context).isDark
                                                ? darkTheme.textTheme.overline
                                                .copyWith(color: Colors.white70)
                                                : lightTheme.textTheme.overline.copyWith(
                                                color: Colors.black45
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      IconButton(
                                        icon: Icon(
                                          FontAwesomeIcons.moneyBillWave,
                                          color: AppCubit.get(context).isDark
                                              ? darkTheme.primaryColorLight
                                              : lightTheme.primaryColorDark,
                                          size: 25,
                                        ),
                                        onPressed: () {},
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    color: AppCubit.get(context).isDark
                                        ? darkTheme.primaryColorLight
                                        : darkTheme.primaryColorDark,
                                  ),
                                  // phone
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "رقم العيادة",
                                            textDirection: TextDirection.rtl,
                                            style: AppCubit.get(context).isDark
                                                ? darkTheme.textTheme.caption
                                                : lightTheme.textTheme.caption,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              makingPhoneCall(context,
                                                  phoneNumber: phone);
                                              print(phone);
                                            },
                                            child: Text(
                                              phone.toString(),
                                              style: AppCubit.get(context).isDark
                                                  ? darkTheme.textTheme.overline
                                                  .copyWith(color: Colors.white70)
                                                  : lightTheme.textTheme.overline.copyWith(
                                                  color: Colors.black45
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      IconButton(
                                        icon: Icon(
                                          FontAwesomeIcons.phone,
                                          color: AppCubit.get(context).isDark
                                              ? darkTheme.primaryColorLight
                                              : lightTheme.primaryColorDark,
                                          size: 25,
                                        ),
                                        onPressed: () {
                                          makingPhoneCall(context,
                                              phoneNumber: phone);
                                          print(phone);
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: size.width / 18,
                      ),
                      // doctor's image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.blue[300],
                              borderRadius: BorderRadius.circular(12)),
                          width: size.width / 2.2,
                          height: size.height / 3,
                          child: Image(
                            image: NetworkImage(image),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        makeDivider(context),
                        // bio
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Text(
                                    "معلومات عن الدكتور",
                                    textDirection: TextDirection.rtl,
                                    style: AppCubit.get(context).isDark
                                        ? darkTheme.textTheme.headline1
                                        : lightTheme.textTheme.headline1,
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Icon(
                                  Icons.info,
                                  color: AppCubit.get(context).isDark
                                      ? darkTheme.primaryColorLight
                                      : lightTheme.primaryColorDark,
                                  size: 30,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 60),
                              child: Text(
                                info,
                                textDirection: TextDirection.rtl,
                                style: AppCubit.get(context).isDark
                                    ? darkTheme.textTheme.caption
                                        .copyWith(color: Colors.white70)
                                    : lightTheme.textTheme.caption.copyWith(
                                  color: Colors.black45
                                ),
                              ),
                            ),
                          ],
                        ),
                        makeDivider(context),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "العنوان",
                                  textDirection: TextDirection.rtl,
                                  style: AppCubit.get(context).isDark
                                      ? darkTheme.textTheme.headline1
                                      : lightTheme.textTheme.headline1,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  address,
                                  textDirection: TextDirection.rtl,
                                  textAlign: TextAlign.right,
                                  maxLines: 2,
                                  textScaleFactor: 1,
                                  style: AppCubit.get(context).isDark
                                      ? darkTheme.textTheme.overline
                                      .copyWith(color: Colors.white70)
                                      : lightTheme.textTheme.overline.copyWith(
                                      color: Colors.black45
                                  ),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  city,
                                  textDirection: TextDirection.rtl,
                                  textScaleFactor: 1,
                                  style:  AppCubit.get(context).isDark
                                      ? darkTheme.textTheme.overline
                                      .copyWith(color: Colors.white70)
                                      : lightTheme.textTheme.overline.copyWith(
                                      color: Colors.black45
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.location_on_rounded,
                                color: AppCubit.get(context).isDark
                                    ? darkTheme.primaryColorLight
                                    : lightTheme.primaryColorDark,
                                size: 50,
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                        makeDivider(context),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "المواعيد",
                                  textDirection: TextDirection.rtl,
                                  style: AppCubit.get(context).isDark
                                      ? darkTheme.textTheme.headline1
                                      : lightTheme.textTheme.headline1,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  day,
                                  textDirection: TextDirection.rtl,
                                  textAlign: TextAlign.right,
                                  maxLines: 2,
                                  textScaleFactor: 1,
                                  style:  AppCubit.get(context).isDark
                                      ? darkTheme.textTheme.overline
                                      .copyWith(color: Colors.white70)
                                      : lightTheme.textTheme.overline.copyWith(
                                      color: Colors.black45
                                  ),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  time,
                                  textDirection: TextDirection.rtl,
                                  textScaleFactor: 1,
                                  style: AppCubit.get(context).isDark
                                      ? darkTheme.textTheme.overline
                                      .copyWith(color: Colors.white70)
                                      : lightTheme.textTheme.overline.copyWith(
                                      color: Colors.black45
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Icon(
                              MaterialCommunityIcons.timetable,
                              color: AppCubit.get(context).isDark
                                  ? darkTheme.primaryColorLight
                                  : lightTheme.primaryColorDark,
                              size: 50,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        makeDivider(context),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image(
                            image: NetworkImage(
                                "https://media.wired.com/photos/59269cd37034dc5f91bec0f1/191:100/w_1280,c_limit/GoogleMapTA.jpg"),
                            fit: BoxFit.cover,
                            width: size.width,
                            height: size.height / 4.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  static void makingPhoneCall(BuildContext context,
      {@required int phoneNumber}) async {
    final url = 'tel:\+\2\0$phoneNumber';
    // 'tel:9876543210';
    try {
      if (await canLaunch(url)) {
        await launch(url);
      }
    } catch (e) {
      //CustomDialog.showAlertDialog(context, 'حدث خطأ');

      throw 'Could not launch $url';
    }
  }

  makeDivider(context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Divider(
            color: AppCubit.get(context).isDark
                ? darkTheme.primaryColorLight
                : lightTheme.primaryColorDark,
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
