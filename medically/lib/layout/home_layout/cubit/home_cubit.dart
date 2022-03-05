import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medically/layout/home_layout/cubit/home_states.dart';
import 'package:medically/modules/corona/corona_screen.dart';
import 'package:medically/modules/corona/screens/FirstScreen.dart';
import 'package:medically/modules/doctors_categories/doctorsCategories.dart';
import 'package:medically/modules/home_screen/home_screen.dart';
import 'package:medically/modules/hospital_screen/hospital_screen.dart';
import 'package:medically/modules/user_profile_screen/user_profile_screen.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialStates());

  HomeCubit get(context) => BlocProvider.of(context);

  int currentIndex = 4;
  List<Widget> bottomScreens = [
    UserProfileScreen(),
    FirstScreen(),
    DoctorsCategoriesScreen(),
    HospitalScreen(
      hospitals: [],
    ),
    homeScreen(),
  ];
  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          FontAwesomeIcons.userAlt,
        ),
      ),
      label: 'صفحتك',
    ),
    BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          FontAwesomeIcons.virus,
        ),
      ),
      label: 'كورونا',
    ),
    BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          FontAwesomeIcons.userMd,
        ),
      ),
      label: 'اختر طبيب',
    ),
    BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          FontAwesomeIcons.hospital,
        ),
      ),
      label: 'مستشفي',
    ),
    BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          FontAwesomeIcons.home,
        ),
      ),
      label: 'الرئيسية',
    ),
  ];

  void changeBottomNav(value) {
    currentIndex = value;
    emit(HomeChangeBottomNavStates());
  }
}
