import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medically/shared/cubit/app_cubit.dart';
import 'package:medically/shared/cubit/app_states.dart';
import 'package:medically/shared/style/themes/dark_theme.dart';
import 'package:medically/shared/style/themes/light_theme.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../utils/constants.dart';

import '../models/global_summary.dart';

class GlobalStatistics extends StatelessWidget {
  final GlobalSummaryModel summary;

  GlobalStatistics({@required this.summary});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, states) {},
      builder: (context, states) {
        return Column(
          children: <Widget>[
            buildCard("CONFIRMED", summary.totalConfirmed, summary.newConfirmed,
                context: context),
            buildCard(
                "ACTIVE",
                summary.totalConfirmed -
                    summary.totalRecovered -
                    summary.totalDeaths,
                summary.newConfirmed - summary.newRecovered - summary.newDeaths,
                context: context),
            buildCard("RECOVERED", summary.totalRecovered, summary.newRecovered,
                context: context),
            buildCard(
                "DEATH", summary.totalDeaths, summary.newDeaths,
                context: context),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 6),
              child: Text(
                "Statistics updated " + timeago.format(summary.date),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget buildCard(String title, int totalCount, int todayCount,
      {@required context}) {
    return Card(
      elevation: 1,
      color: AppCubit.get(context).isDark?darkTheme.cardTheme.color:lightTheme.primaryColorLight,
      child: Container(
        height: 100,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: <Widget>[
            Text(title,
                style: AppCubit.get(context).isDark
                    ? darkTheme.textTheme.caption
                    : lightTheme.textTheme.caption),
            Expanded(
              child: Container(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Total",
                      style: AppCubit.get(context).isDark
                          ? lightTheme.textTheme.subtitle1.copyWith(
                        color: Colors.white60
                      )
                          : lightTheme.textTheme.subtitle1
                    ),
                    Text(
                      totalCount.toString().replaceAllMapped(reg, mathFunc),
                      style: AppCubit.get(context).isDark
                          ? darkTheme.textTheme.headline1
                          : lightTheme.textTheme.headline1
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      "Today",
                      style: AppCubit.get(context).isDark
                          ? lightTheme.textTheme.subtitle1.copyWith(
                          color: Colors.white60
                      )
                          : lightTheme.textTheme.subtitle1
                      ),
                    Text(
                      todayCount.toString().replaceAllMapped(reg, mathFunc),
                      style: AppCubit.get(context).isDark
                          ? darkTheme.textTheme.headline1
                          : lightTheme.textTheme.headline1
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
