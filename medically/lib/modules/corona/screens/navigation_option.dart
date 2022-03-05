import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medically/modules/corona/utils/constants.dart';
import 'package:medically/shared/cubit/app_cubit.dart';
import 'package:medically/shared/cubit/app_states.dart';
import 'package:medically/shared/style/themes/dark_theme.dart';
import 'package:medically/shared/style/themes/light_theme.dart';


class NavigationOption extends StatelessWidget {

  final String title;
  final bool selected;
  final Function() onSelected;

  NavigationOption({@required this.title, @required this.selected, @required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,states){},
      builder: (context,states){
        AppCubit appCubit = AppCubit.get(context);
        return GestureDetector(
          onTap: () {
            onSelected();
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Text(
                title,
                style: appCubit.isDark?darkTheme.textTheme.bodyText1.copyWith(
                  color: selected? darkTheme.primaryColorLight
                                     : lightTheme.primaryColorDark
                )
                    :lightTheme.textTheme.bodyText1.copyWith(
                  color: selected? darkTheme.primaryColorDark
                    : lightTheme.backgroundColor
                ),
              ),

              selected
                  ? Column(
                children: <Widget>[

                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.01,
                  ),

                  Container(
                    width: 24,
                    height: 8,
                    decoration: BoxDecoration(
                      color: appCubit.isDark?darkTheme.primaryColorLight:lightTheme.primaryColorDark,
                      borderRadius: BorderRadius.circular(30),
                      shape: BoxShape.rectangle,
                    ),
                  ),

                ],
              )
                  : Container(),


            ],
          ),
        );
      },
    );
  }
}