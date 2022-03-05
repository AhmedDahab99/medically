import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medically/shared/cubit/app_cubit.dart';
import 'package:medically/shared/cubit/app_states.dart';
import 'package:medically/shared/style/themes/dark_theme.dart';
import 'package:medically/shared/style/themes/light_theme.dart';

import '../utils/constants.dart';
import '../screens/navigation_option.dart';
import '../screens/global.dart';
import '../screens/country.dart';

enum NavigationStatus {
  GLOBAL,
  COUNTRY,
}

class Tracker extends StatefulWidget {
  @override
  _TrackerState createState() => _TrackerState();
}

class _TrackerState extends State<Tracker> {
  NavigationStatus navigationStatus = NavigationStatus.GLOBAL;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,states){},
      builder: (context,states){
        AppCubit appCubit =AppCubit.get(context);
        return Scaffold(
          backgroundColor:appCubit.isDark?darkTheme.scaffoldBackgroundColor:lightTheme.scaffoldBackgroundColor,
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: appCubit.isDark?darkTheme.primaryColorDark:lightTheme.primaryColorDark,
            elevation: 0,
            title: Text(
                "COVID-19 Live Data",
              style: appCubit.isDark?darkTheme.textTheme.bodyText1
                  :darkTheme.textTheme.bodyText1,
            ),
            centerTitle: true,
            leading: IconButton(
                icon: Icon(Icons.arrow_back_ios_rounded,
                  color:appCubit.isDark?darkTheme.primaryColorLight:lightTheme.primaryColorLight,
                ),
                onPressed: (){
              Navigator.pop(context);
            }),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[

              Expanded(
                child: Container(
                  padding: EdgeInsets.all(32),
                  decoration: BoxDecoration(
                      color:appCubit.isDark?darkTheme.primaryColorDark:lightTheme.primaryColorDark,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(100),
                        bottomLeft: Radius.circular(100),
                      )
                  ),
                  child: AnimatedSwitcher(
                    duration: Duration(milliseconds: 250),
                    child: navigationStatus == NavigationStatus.GLOBAL ? Global() : Country(),
                  ),
                ),
              ),
              Container(
                height: size.height * 0.1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[

                    NavigationOption(
                      title: "Global",
                      selected: navigationStatus == NavigationStatus.GLOBAL,
                      onSelected: () {
                        setState(() {
                          navigationStatus = NavigationStatus.GLOBAL;

                        });
                      },
                    ),

                    NavigationOption(
                      title: "Country",
                      selected: navigationStatus == NavigationStatus.COUNTRY,
                      onSelected: () {
                        setState(() {
                          navigationStatus = NavigationStatus.COUNTRY;
                        });
                      },
                    )

                  ],
                ),
              ),

            ],
          ),
        );
      },
    );
  }
}