import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medically/layout/home_layout/cubit/home_cubit.dart';
import 'package:medically/layout/home_layout/cubit/home_states.dart';
import 'package:medically/modules/Authrization/Login/login_register.dart';
import 'package:medically/modules/Authrization/firebase_services/firebase_auth.dart';
import 'package:medically/shared/componnet/component.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../shared/componnet/component.dart';
import '../../shared/cubit/app_cubit.dart';
import '../../shared/style/themes/dark_theme.dart';
import '../../shared/style/themes/light_theme.dart';

// ignore: must_be_immutable
class HomeLayout extends StatefulWidget {
  @override
  _HomeLayoutState createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {

  @override
  Widget build(BuildContext context) {
    final AuthenticationService _auth = AuthenticationService();
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {

        var cubit = HomeCubit().get(context);
        var appCubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: appCubit.isDark
                ? darkTheme.appBarTheme.backgroundColor
                : lightTheme.appBarTheme.backgroundColor,
            // automaticallyImplyLeading: false,
            title: Text(
              "عالجنــــــــــــــــي ",
              style: appCubit.isDark
                  ? darkTheme.appBarTheme.titleTextStyle
                  : lightTheme.appBarTheme.titleTextStyle,
            ),
            centerTitle: true,
            iconTheme: appCubit.isDark
                ? darkTheme.iconTheme
                    .copyWith(color: Color(0xffffffff), size: 30)
                : lightTheme.iconTheme
                    .copyWith(color: Color(0xfffd556d), size: 50),
            leading: IconButton(
              onPressed: () async {
                _auth.signOut();
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.remove('email');
                print("signOut");
                navigateAndFinish(context, LoginRegisterScreen());
              },
              icon: Icon(FontAwesomeIcons.signOutAlt),
              iconSize: 30,
              color: appCubit.isDark
                  ? darkTheme.primaryColorLight
                  : lightTheme.primaryColorDark,
            ),
            actions: [
              IconButton(
                onPressed: () {
                  AppCubit.get(context).changeAppMode();
                },
                icon: appCubit.isDark
                    ? Icon(FontAwesomeIcons.solidLightbulb)
                    : Icon(FontAwesomeIcons.lightbulb),
                iconSize: 30,
                color: appCubit.isDark
                    ? darkTheme.primaryColorLight
                    : lightTheme.primaryColorDark,
              ),
            ],
          ),
          body: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOutSine,
                child: cubit.bottomScreens[cubit.currentIndex]),
          bottomNavigationBar: SnakeNavigationBar.color(
              backgroundColor:
                  appCubit.isDark ? Color(0xff010038) : Color(0xffFFFfff),
              showSelectedLabels: true,
              selectedItemColor:
                  appCubit.isDark ? Color(0xff4C4C6D) : Color(0xffFFFfff),
              unselectedItemColor:
                  appCubit.isDark ? Color(0xffffffff) : Color(0xff7868E6),
              snakeViewColor:
                  appCubit.isDark ? Color(0xffffffff) : Color(0xff7868E6),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              selectedLabelStyle:
                  TextStyle(fontSize: 14, fontFamily: "ElMessiri-Regular"),
              showUnselectedLabels: true,
              unselectedLabelStyle:
                  TextStyle(fontSize: 8, fontFamily: "ElMessiri-Regular"),
              height: MediaQuery.of(context).size.height * 0.09,
              behaviour: SnakeBarBehaviour.pinned,
              snakeShape: SnakeShape.rectangle,
              currentIndex: cubit.currentIndex,
              onTap: (index) => cubit.changeBottomNav(index),
              items: cubit.items),
        );
      },
    );
  }
}
