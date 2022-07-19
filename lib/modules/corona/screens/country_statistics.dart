import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medically/shared/cubit/app_cubit.dart';
import 'package:medically/shared/cubit/app_states.dart';
import 'package:medically/shared/style/themes/dark_theme.dart';
import 'package:medically/shared/style/themes/light_theme.dart';

import 'chart.dart';

import '../utils/constants.dart';

import '../models/country_summary.dart';
import '../models/time_series_cases.dart';

class CountryStatistics extends StatelessWidget {
  final List<CountrySummaryModel> summaryList;

  CountryStatistics({@required this.summaryList});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, states) {},
        builder: (context, states) {
          AppCubit appCubit = AppCubit.get(context);
          return Column(
            children: <Widget>[
              buildCard(
                "CONFIRMED",
                summaryList[summaryList.length - 1].confirmed,
                appCubit.isDark
                    ? darkTheme.primaryColorLight
                    : lightTheme.primaryColorDark,
                "ACTIVE",
                summaryList[summaryList.length - 1].active,
                appCubit.isDark
                    ? darkTheme.primaryColorLight
                    : lightTheme.primaryColorDark,
                context: context,
              ),
              buildCard(
                "RECOVERED",
                summaryList[summaryList.length - 1].recovered,
                appCubit.isDark ? Colors.white : lightTheme.primaryColorDark,
                "DEATH",
                summaryList[summaryList.length - 1].death,
                appCubit.isDark
                    ? darkTheme.primaryColorLight
                    : lightTheme.primaryColorDark,
                context: context,
              ),
              buildCardChart(summaryList, context: context),
            ],
          );
        });
  }

  Widget buildCard(String leftTitle, int leftValue, Color leftColor,
      String rightTitle, int rightValue, Color rightColor,
      {@required context}) {
    return Card(
      color: AppCubit.get(context).isDark
          ? darkTheme.cardTheme.color
          : lightTheme.primaryColorLight,
      elevation: 1,
      child: Container(
        height: 100,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  leftTitle,
                  style: AppCubit.get(context).isDark
                      ? darkTheme.textTheme.subtitle1
                      : lightTheme.textTheme.subtitle1,
                ),
                Expanded(
                  child: Container(),
                ),
                Text("Total",
                    style: AppCubit.get(context).isDark
                        ? lightTheme.textTheme.subtitle1
                            .copyWith(color: Colors.white60)
                        : lightTheme.textTheme.subtitle1),
                Text(leftValue.toString().replaceAllMapped(reg, mathFunc),
                    style: AppCubit.get(context).isDark
                        ? darkTheme.textTheme.headline1
                        : lightTheme.textTheme.headline1),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  rightTitle,
                  style: AppCubit.get(context).isDark
                      ? darkTheme.textTheme.subtitle1
                      : lightTheme.textTheme.subtitle1,
                ),
                Expanded(
                  child: Container(),
                ),
                Text("Total",
                    style: AppCubit.get(context).isDark
                        ? lightTheme.textTheme.subtitle1
                            .copyWith(color: Colors.white60)
                        : lightTheme.textTheme.subtitle1),
                Text(rightValue.toString().replaceAllMapped(reg, mathFunc),
                    style: AppCubit.get(context).isDark
                        ? darkTheme.textTheme.headline1
                        : lightTheme.textTheme.headline1),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCardChart(List<CountrySummaryModel> summaryList,
      {@required context}) {
    return Card(
      elevation: 1,
      child: Container(
        decoration: BoxDecoration(
            color: AppCubit.get(context).isDark
                ? darkTheme.primaryColorLight
                : lightTheme.primaryColorLight,
            borderRadius: BorderRadius.circular(10)),
        height: 190,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Chart(
          _createData(summaryList),
          animate: false,
        ),
      ),
    );
  }

  static List<charts.Series<TimeSeriesCases, DateTime>> _createData(
      List<CountrySummaryModel> summaryList) {
    List<TimeSeriesCases> confirmedData = [];
    List<TimeSeriesCases> activeData = [];
    List<TimeSeriesCases> recoveredData = [];
    List<TimeSeriesCases> deathData = [];

    for (var item in summaryList) {
      confirmedData.add(TimeSeriesCases(item.date, item.confirmed));
      activeData.add(TimeSeriesCases(item.date, item.active));
      recoveredData.add(TimeSeriesCases(item.date, item.recovered));
      deathData.add(TimeSeriesCases(item.date, item.death));
    }

    return [
      new charts.Series<TimeSeriesCases, DateTime>(
        id: 'Confirmed',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(kConfirmedColor),
        domainFn: (TimeSeriesCases cases, _) => cases.time,
        measureFn: (TimeSeriesCases cases, _) => cases.cases,
        data: confirmedData,
      ),
      new charts.Series<TimeSeriesCases, DateTime>(
        id: 'Active',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(kActiveColor),
        domainFn: (TimeSeriesCases cases, _) => cases.time,
        measureFn: (TimeSeriesCases cases, _) => cases.cases,
        data: activeData,
      ),
      new charts.Series<TimeSeriesCases, DateTime>(
        id: 'Recovered',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(kRecoveredColor),
        domainFn: (TimeSeriesCases cases, _) => cases.time,
        measureFn: (TimeSeriesCases cases, _) => cases.cases,
        data: recoveredData,
      ),
      new charts.Series<TimeSeriesCases, DateTime>(
        id: 'Death',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(kDeathColor),
        domainFn: (TimeSeriesCases cases, _) => cases.time,
        measureFn: (TimeSeriesCases cases, _) => cases.cases,
        data: deathData,
      ),
    ];
  }
}
