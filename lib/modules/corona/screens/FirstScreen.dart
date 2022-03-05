import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medically/modules/corona/screens/tracker.dart';
import 'package:medically/shared/cubit/app_cubit.dart';
import 'package:medically/shared/cubit/app_states.dart';
import 'package:medically/shared/style/themes/dark_theme.dart';
import 'package:medically/shared/style/themes/light_theme.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, states) {},
      builder: (context, states) {
        AppCubit appCubit = AppCubit.get(context);
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  child: Row(
                    children: [
                      Image.asset('assets/images/own_test.png',
                          width: 100, height: 100, fit: BoxFit.fill),
                      SizedBox(
                        width: width * 0.06,
                      ),
                      Text("Covid-19",
                          style: appCubit.isDark
                              ? darkTheme.textTheme.bodyText1
                                  .copyWith(fontSize: 32)
                              : lightTheme.textTheme.bodyText1
                                  .copyWith(fontSize: 32)),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                      "The COVID-19 virus spreads primarily "
                      "through droplets of saliva or discharge from the nose when an "
                      "infected person coughs, sneezes,\n high fever or change in your smell or taste. ",
                      textAlign: TextAlign.center,
                      style: appCubit.isDark
                          ? darkTheme.textTheme.subtitle1
                          : lightTheme.textTheme.subtitle1),
                ),
                SizedBox(
                  height: height*0.01,
                ),
                Text(
                  "Symptoms",
                  style: appCubit.isDark
                      ? darkTheme.textTheme.bodyText1
                      : lightTheme.textTheme.bodyText1,
                ),
                SizedBox(
                  height:height*0.02
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      buildSymptomsCard(
                        image: AssetImage('assets/images/caugh.png'),
                        symptoms: Text("a new, continuous cough",
                          style:appCubit.isDark
                              ? darkTheme.textTheme.headline3
                              : lightTheme.textTheme.headline3,),
                        detail:Text("this means coughing a lot for more\n than an hour, or 3 or more coughing \nepisodes in 24 hours.",
                        style:appCubit.isDark
                            ? darkTheme.textTheme.subtitle1.copyWith(
                          color: Colors.white.withOpacity(0.6)
                        )
                            : lightTheme.textTheme.subtitle1.copyWith(
                            color: Color(0xff4C4C6D).withOpacity(0.6)
                        ),)
                      ),
                      buildSymptomsCard(
                          image: AssetImage('assets/images/fever.png'),
                          symptoms: Text("a high fever",
                            style:appCubit.isDark
                                ? darkTheme.textTheme.headline3
                                : lightTheme.textTheme.headline3,),
                          detail: Text("this means you feel hot to touch on\n your chest or back (you do not\n need to measure your temperature).",
                            style:appCubit.isDark
                                ? darkTheme.textTheme.subtitle1.copyWith(
                                color: Colors.white.withOpacity(0.6)
                            )
                                : lightTheme.textTheme.subtitle1.copyWith(
                                color: Color(0xff4C4C6D).withOpacity(0.6)
                            ),)
                      ),
                      buildSymptomsCard(
                          image: AssetImage('assets/images/headache.png'),
                          symptoms: Text("a loss to your smell or taste",
                            style:appCubit.isDark
                                ? darkTheme.textTheme.headline3
                                : lightTheme.textTheme.headline3,),
                          detail: Text("this means you've noticed you cannot\n smell or taste anything, or things\n smell or taste different to normal.",
                            style:appCubit.isDark
                                ? darkTheme.textTheme.subtitle1.copyWith(
                                color: Colors.white.withOpacity(0.6)
                            )
                                : lightTheme.textTheme.subtitle1.copyWith(
                                color: Color(0xff4C4C6D).withOpacity(0.6)
                            ),)
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top:5.0, left: 5.0, bottom: 5.0),
                  child: Text(
                    "To prevent infection",
                    style: appCubit.isDark
                        ? darkTheme.textTheme.bodyText1
                        : lightTheme.textTheme.bodyText1,
                  ),
                ),
                SizedBox(
                  height: height*0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child: Image.asset(
                        "assets/images/mask.png",
                        width: width*0.22,
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child: Image.asset(
                        "assets/images/wash_hands.png",
                        fit: BoxFit.cover,
                        width: width*0.22,
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child: Image.asset(
                        "assets/images/distance.png",
                        width: width*0.22,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height*0.02,
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => Tracker()));
                    },
                    child: Container(
                      height: height*0.085,
                      width: width*0.5,
                      decoration: BoxDecoration(
                          color: appCubit.isDark?darkTheme.primaryColorLight:lightTheme.primaryColorDark,
                          borderRadius: BorderRadius.circular(20.0)),
                      padding: EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Summary",
                            style: !appCubit.isDark?darkTheme.textTheme.bodyText1
                                :lightTheme.textTheme.bodyText1,
                          ),
                          //Spacer(),
                          IconButton(
                              color: !appCubit.isDark?darkTheme.primaryColorLight:lightTheme.primaryColorDark,
                              icon: Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 35.0,
                              ),
                              onPressed: () {}),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

   buildSymptomsCard({
  @required AssetImage image,@required Text symptoms,@required Text detail,context,
}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Image(image: image,
              width: 70, height: 70, fit: BoxFit.fill),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  symptoms,
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 6),
                    child: detail,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
