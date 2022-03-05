import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medically/modules/on_boarding_screen/on_boardin_screen.dart';
import 'package:medically/shared/cubit/app_cubit.dart';
import 'package:medically/shared/cubit/app_states.dart';
import 'package:medically/shared/network/local/cached_helper.dart';
import 'package:medically/shared/network/remote/dio_helper.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'layout/home_layout/cubit/home_cubit.dart';
import 'layout/home_layout/home_layout.dart';
import 'modules/Authrization/Login/login_register.dart';
import 'shared/bloc_observer/bloc_observer.dart';
import 'shared/componnet/constants.dart';
import 'shared/style/themes/dark_theme.dart';
import 'shared/style/themes/light_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  ResponsiveSizingConfig.instance.setCustomBreakpoints(
    ScreenBreakpoints(desktop: 800, tablet: 550, watch: 200),
  );
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CashedHelper.init();

  bool isDark = CashedHelper.getData(key: 'isDark');
  Widget widget;
  bool onBoarding = CashedHelper.getData(key: 'onBoarding');
  token = CashedHelper.getData(key: 'token');
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var saveEmail = preferences.getString('email');

  print(token);
  if (onBoarding != null) {
    if (token != null) {
      widget = HomeLayout();
    } else
      widget = LoginRegisterScreen();
  } else
    widget = OnBoardingScreen();
  print(onBoarding);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp(
      isDark: isDark,
      startWidget: widget,
      email:saveEmail,
    ));
  });
}

class MyApp extends StatelessWidget {
  final bool isDark;
  final Widget startWidget;
  final email;

  MyApp({this.isDark, this.startWidget, this.email});
  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl, child: MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => AppCubit()..changeAppMode(fromShared: isDark)),
        BlocProvider(create: (context) => HomeCubit()),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: AppCubit.get(context).isDark
                  ? ThemeMode.dark
                  : ThemeMode.light,
              home: email == null ?LoginRegisterScreen() : HomeLayout());
        },
      ),
    ),);
  }
}
