import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:medically/layout/home_layout/home_layout.dart';
import 'package:medically/modules/Authrization/firebase_services/firebase_auth.dart';
import 'package:medically/modules/Authrization/forgot_password/forgot_password.dart';
import 'package:medically/shared/componnet/component.dart';
import 'package:medically/shared/componnet/constants.dart';
import 'package:medically/shared/network/local/cached_helper.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../shared/cubit/app_cubit.dart';
import '../../../shared/cubit/app_states.dart';
import '../../../shared/style/themes/dark_theme.dart';
import '../../../shared/style/themes/light_theme.dart';

class LoginRegisterScreen extends StatefulWidget {
  const LoginRegisterScreen({Key key}) : super(key: key);

  @override
  _LoginRegisterScreenState createState() => _LoginRegisterScreenState();
}

class _LoginRegisterScreenState extends State<LoginRegisterScreen> {
  final AuthenticationService _auth = AuthenticationService();

  bool isMale = true;
  bool isSignUp = false;
  bool isRememberMe = false;
  FocusNode _passwordFocusNode;
  FocusNode _emailFocusNode;
  FocusNode _phoneFocusNode;
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var emailRegisteredController = TextEditingController();
  var passwordRegisteredController = TextEditingController();
  // login
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  void initState() {
    _passwordFocusNode = FocusNode();
    _emailFocusNode = FocusNode();
    _phoneFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height= MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return ResponsiveBuilder(
        builder: (context, sizingInformation) {
      // Check the sizing information here and return your UI
      if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
        return BlocConsumer<AppCubit, AppStates>(
                listener: (context, states) => {},
                builder: (context, states) {
                  var appCubit = AppCubit.get(context);
                  return SafeArea(
                    child: Scaffold(
                      backgroundColor: AppCubit.get(context).isDark
                          ? darkTheme.scaffoldBackgroundColor
                          : lightTheme.scaffoldBackgroundColor,
                      body: Stack(
                        children: [
                          // background image
                          Positioned(
                              top: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                height: 300,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage("assets/images/background.jpg"),
                                        fit: BoxFit.fill)),
                                child: Container(
                                  padding: EdgeInsets.only(top: 70, right: 30),
                                  color: AppCubit.get(context).isDark
                                      ? darkTheme.primaryColorDark.withOpacity(0.7)
                                      : lightTheme.primaryColorDark.withOpacity(0.7),
                                  // color: Color(0xff3b5999).withOpacity(0.7),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                            text: "مرحباً بك في ",
                                            style: appCubit.isDark?darkTheme.textTheme.overline
                                                :lightTheme.textTheme.overline,
                                            children: [
                                              TextSpan(
                                                text: "عالجني",
                                                style: appCubit.isDark?darkTheme.textTheme.bodyText1.copyWith(
                                                    fontSize: 40
                                                )
                                                    :lightTheme.textTheme.bodyText1.copyWith(
                                                    fontSize: 40
                                                ),
                                              )
                                            ]),
                                      ),
                                      SizedBox(
                                        height: 14,
                                      ),
                                      Text(
                                        "يرجي تسجيل الدخول حتي تتمكن من التصفح",
                                        style: appCubit.isDark?darkTheme.textTheme.overline
                                            :lightTheme.textTheme.overline.copyWith(
                                            color: Color(0xff4C4C6D).withOpacity(0.7)
                                        ),)
                                    ],
                                  ),
                                ),
                              )),
                          // add the shadow to submit button
                          buildBottomHalfContainer(showShadow: true),
                          // form to sign in or sign up
                          AnimatedPositioned(
                              duration: Duration(milliseconds: 750),
                              curve: Curves.easeInCubic,
                              top: isSignUp ? 200 : 250,
                              child: AnimatedContainer(
                                height: isSignUp ? 360 : 300,
                                width: MediaQuery.of(context).size.width - 40,
                                margin: EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(
                                    color: appCubit.isDark
                                        ? darkTheme.primaryColorDark.withOpacity(1)
                                        : lightTheme.primaryColorLight,
                                    borderRadius: BorderRadius.circular(30),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black12,
                                          spreadRadius: 5,
                                          offset: Offset(1, 4),
                                          blurRadius: 20)
                                    ]),
                                duration: Duration(milliseconds: 750),
                                curve: Curves.easeInCubic,
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 16),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  isSignUp = true;
                                                });
                                              },
                                              child: Column(
                                                children: [
                                                  Text(" إنشاء حساب جديد",
                                                      style: appCubit.isDark
                                                          ? darkTheme.textTheme.overline
                                                          : lightTheme.textTheme.overline),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  if (isSignUp)
                                                    Container(
                                                      height: 4,
                                                      width: 50,
                                                      decoration: BoxDecoration(
                                                          color: appCubit.isDark
                                                              ? darkTheme.primaryColorLight
                                                              : lightTheme.primaryColorDark,
                                                          borderRadius:
                                                          BorderRadius.circular(30)),
                                                    )
                                                ],
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  isSignUp = false;
                                                });
                                              },
                                              child: Column(
                                                children: [
                                                  Text("تسجيل الدخول",
                                                      style: appCubit.isDark
                                                          ? darkTheme.textTheme.overline
                                                          : lightTheme.textTheme.overline),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  if (!isSignUp)
                                                    Container(
                                                      height: 4,
                                                      width: 50,
                                                      decoration: BoxDecoration(
                                                          color: appCubit.isDark
                                                              ? darkTheme.primaryColorLight
                                                              : lightTheme.primaryColorDark,
                                                          borderRadius:
                                                          BorderRadius.circular(30)),
                                                    )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      if (!isSignUp) buildSignInSection(context),
                                      if (isSignUp) buildSignUpSection(context),
                                    ],
                                  ),
                                ),
                              )),
                          // add the submit button
                          if (isSignUp)
                            buildBottomHalfContainer(
                                showShadow: false,
                                onPressed: () async {
                                  if (formKey.currentState.validate()) {
                                    registerForm();
                                  }
                                },
                                icon: Icons.login_rounded)
                          else
                            buildBottomHalfContainer(
                                showShadow: false,
                                icon: Icons.login_rounded,
                                onPressed: () async {
                                  if (formKey.currentState.validate()) {
                                    var result = loginForm();
                                    print(result);
                                  }
                                }),
                          // login with social
                          AnimatedPositioned(
                              duration: Duration(milliseconds: 750),
                              curve: Curves.easeInCubic,
                              top: isSignUp
                                  ? MediaQuery.of(context).size.height - 200
                                  : MediaQuery.of(context).size.height - 200,
                              left: 0,
                              right: 0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "عالجني هو ابليكشن يساعدك للوصول لاقرب مستشفي او طبيب",
                                    style: AppCubit.get(context).isDark
                                        ? darkTheme.textTheme.subtitle1
                                        : lightTheme.textTheme.subtitle1,
                                  ),
                                  SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                                  Text(
                                    isSignUp ? "أو التسجيل بواسطة" : "أو الدخول بواسطة",
                                    style: TextStyle(
                                        color: AppCubit.get(context).isDark
                                            ? darkTheme.primaryColorLight
                                            : lightTheme.primaryColorDark,
                                        fontSize: 18,
                                        letterSpacing: 2,
                                        fontFamily: "ElMessiri-Regular"),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 30, right: 30, top: 10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        buildTextButton(MaterialCommunityIcons.facebook,
                                            "Facebook", Palette.facebookColor),
                                        buildTextButton(MaterialCommunityIcons.google_plus,
                                            "Google", Palette.googleColor),
                                      ],
                                    ),
                                  ),
                                ],
                              ))
                        ],
                      ),
                    ),
                  );
                },
              );
      }

      if (sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
        return BlocConsumer<AppCubit, AppStates>(
          listener: (context, states) => {},
          builder: (context, states) {
            var appCubit = AppCubit.get(context);
            return SafeArea(
              child: Scaffold(
                backgroundColor: AppCubit.get(context).isDark
                    ? darkTheme.scaffoldBackgroundColor
                    : lightTheme.scaffoldBackgroundColor,
                body: Stack(
                  children: [
                    // background image
                    Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 300,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/images/background.jpg"),
                                  fit: BoxFit.fill)),
                          child: Container(
                            padding: EdgeInsets.only(top: 70, right: 30),
                            color: AppCubit.get(context).isDark
                                ? darkTheme.primaryColorDark.withOpacity(0.7)
                                : lightTheme.primaryColorLight.withOpacity(0.7),
                            // color: Color(0xff3b5999).withOpacity(0.7),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                RichText(
                                  text: TextSpan(
                                      text: "مرحباً بك في ",
                                      style: appCubit.isDark?darkTheme.textTheme.overline
                                          :lightTheme.textTheme.overline,
                                      children: [
                                        TextSpan(
                                          text: "عالجني",
                                          style: appCubit.isDark?darkTheme.textTheme.bodyText1.copyWith(
                                              fontSize: 40
                                          )
                                              :lightTheme.textTheme.bodyText1.copyWith(
                                              fontSize: 40
                                          ),
                                        )
                                      ]),
                                ),
                                SizedBox(
                                  height: 14,
                                ),
                                Text(
                                  "يرجي تسجيل الدخول حتي تتمكن من التصفح",
                                  style: appCubit.isDark?darkTheme.textTheme.overline
                                      :lightTheme.textTheme.overline.copyWith(
                                      color: Color(0xff4C4C6D).withOpacity(0.7)
                                  ),)
                              ],
                            ),
                          ),
                        )),
                    // add the shadow to submit button
                    buildBottomHalfContainer(showShadow: true),
                    // form to sign in or sign up
                    AnimatedPositioned(
                        duration: Duration(milliseconds: 750),
                        curve: Curves.easeInCubic,
                        top: isSignUp ? 200 : 250,
                        child: AnimatedContainer(
                          height: isSignUp ? 360 : 300,
                          width: MediaQuery.of(context).size.width - 40,
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                              color: appCubit.isDark
                                  ? darkTheme.primaryColorDark.withOpacity(1)
                                  : lightTheme.primaryColorLight,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black12,
                                    spreadRadius: 5,
                                    offset: Offset(1, 4),
                                    blurRadius: 20)
                              ]),
                          duration: Duration(milliseconds: 750),
                          curve: Curves.easeInCubic,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 16),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            isSignUp = true;
                                          });
                                        },
                                        child: Column(
                                          children: [
                                            Text(" إنشاء حساب جديد",
                                                style: appCubit.isDark
                                                    ? darkTheme.textTheme.overline
                                                    : lightTheme.textTheme.overline),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            if (isSignUp)
                                              Container(
                                                height: 4,
                                                width: 50,
                                                decoration: BoxDecoration(
                                                    color: appCubit.isDark
                                                        ? darkTheme.primaryColorLight
                                                        : lightTheme.primaryColorDark,
                                                    borderRadius:
                                                    BorderRadius.circular(30)),
                                              )
                                          ],
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            isSignUp = false;
                                          });
                                        },
                                        child: Column(
                                          children: [
                                            Text("تسجيل الدخول",
                                                style: appCubit.isDark
                                                    ? darkTheme.textTheme.overline
                                                    : lightTheme.textTheme.overline),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            if (!isSignUp)
                                              Container(
                                                height: 4,
                                                width: 50,
                                                decoration: BoxDecoration(
                                                    color: appCubit.isDark
                                                        ? darkTheme.primaryColorLight
                                                        : lightTheme.primaryColorDark,
                                                    borderRadius:
                                                    BorderRadius.circular(30)),
                                              )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                if (!isSignUp) buildSignInSection(context),
                                if (isSignUp) buildSignUpSection(context),
                              ],
                            ),
                          ),
                        )),
                    // add the submit button
                    if (isSignUp)
                      buildBottomHalfContainer(
                          showShadow: false,
                          onPressed: () async {
                            if (formKey.currentState.validate()) {
                              registerForm();
                            }
                          },
                          icon: Icons.login_rounded)
                    else
                      buildBottomHalfContainer(
                          showShadow: false,
                          icon: Icons.login_rounded,
                          onPressed: () async {
                            if (formKey.currentState.validate()) {
                              var result = loginForm();
                              print(result);
                            }
                          }),
                    // login with social
                    AnimatedPositioned(
                        duration: Duration(milliseconds: 750),
                        curve: Curves.easeInCubic,
                        top: isSignUp
                            ? MediaQuery.of(context).size.height - 200
                            : MediaQuery.of(context).size.height - 200,
                        left: 0,
                        right: 0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "عالجني هو ابليكشن يساعدك للوصول لاقرب مستشفي او طبيب",
                              style: AppCubit.get(context).isDark
                                  ? darkTheme.textTheme.subtitle1
                                  : lightTheme.textTheme.subtitle1,
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                            Text(
                              isSignUp ? "أو التسجيل بواسطة" : "أو الدخول بواسطة",
                              style: TextStyle(
                                  color: AppCubit.get(context).isDark
                                      ? darkTheme.primaryColorLight
                                      : lightTheme.primaryColorDark,
                                  fontSize: 18,
                                  letterSpacing: 2,
                                  fontFamily: "ElMessiri-Regular"),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 30, right: 30, top: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  buildTextButton(MaterialCommunityIcons.facebook,
                                      "Facebook", Palette.facebookColor),
                                  buildTextButton(MaterialCommunityIcons.google_plus,
                                      "Google", Palette.googleColor),
                                ],
                              ),
                            ),
                          ],
                        ))
                  ],
                ),
              ),
            );
          },
        );
      }

      if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
        return BlocConsumer<AppCubit, AppStates>(
          listener: (context, states) => {},
          builder: (context, states) {
            var appCubit = AppCubit.get(context);
            return SafeArea(
              child: Scaffold(
                backgroundColor: AppCubit.get(context).isDark
                    ? darkTheme.scaffoldBackgroundColor
                    : lightTheme.scaffoldBackgroundColor,
                body: Stack(
                  children: [
                    // background image
                    Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: height*0.4,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/images/background.jpg"),
                                  fit: BoxFit.fill)),
                          child: Container(
                            padding: EdgeInsets.only(top: height*0.07, right: width*0.09),
                            color: AppCubit.get(context).isDark
                                ? darkTheme.primaryColorDark.withOpacity(0.7)
                                : lightTheme.primaryColorLight.withOpacity(0.7),
                            // color: Color(0xff3b5999).withOpacity(0.7),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                RichText(
                                  text: TextSpan(
                                      text: "مرحباً بك في ",
                                      style: appCubit.isDark?darkTheme.textTheme.overline
                                          :lightTheme.textTheme.overline,
                                      children: [
                                        TextSpan(
                                          text: "عالجني",
                                          style: appCubit.isDark?darkTheme.textTheme.bodyText1.copyWith(
                                              fontSize: 40
                                          )
                                              :lightTheme.textTheme.bodyText1.copyWith(
                                              fontSize: 40
                                          ),
                                        )
                                      ]),
                                ),
                                SizedBox(
                                  height: 14,
                                ),
                                Text(
                                  "يرجي تسجيل الدخول حتي تتمكن من التصفح",
                                  style: appCubit.isDark?darkTheme.textTheme.overline
                                      :lightTheme.textTheme.overline.copyWith(
                                      color: Color(0xff4C4C6D).withOpacity(0.7)
                                  ),)
                              ],
                            ),
                          ),
                        )),
                    // add the shadow to submit button
                    buildBottomHalfContainer(showShadow: true),
                    // form to sign in or sign up
                    AnimatedPositioned(
                        duration: Duration(milliseconds: 750),
                        curve: Curves.easeInCubic,
                        top: isSignUp ? height*0.24 : height*0.3,
                        child: AnimatedContainer(
                          height: isSignUp ? height*0.42 : height*0.32,
                          width: width - 40,
                          margin: EdgeInsets.symmetric(horizontal: width*0.056),
                          decoration: BoxDecoration(
                              color: appCubit.isDark
                                  ? darkTheme.primaryColorDark.withOpacity(1)
                                  : lightTheme.primaryColorLight,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black12,
                                    spreadRadius: 5,
                                    offset: Offset(1, 4),
                                    blurRadius: 20)
                              ]),
                          duration: Duration(milliseconds: 750),
                          curve: Curves.easeInCubic,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 16),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            isSignUp = true;
                                          });
                                        },
                                        child: Column(
                                          children: [
                                            Text(" إنشاء حساب جديد",
                                                style: appCubit.isDark
                                                    ? darkTheme.textTheme.overline
                                                    : lightTheme.textTheme.overline),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            if (isSignUp)
                                              Container(
                                                height: 4,
                                                width: 50,
                                                decoration: BoxDecoration(
                                                    color: appCubit.isDark
                                                        ? darkTheme.primaryColorLight
                                                        : lightTheme.primaryColorDark,
                                                    borderRadius:
                                                    BorderRadius.circular(30)),
                                              )
                                          ],
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            isSignUp = false;
                                          });
                                        },
                                        child: Column(
                                          children: [
                                            Text("تسجيل الدخول",
                                                style: appCubit.isDark
                                                    ? darkTheme.textTheme.overline
                                                    : lightTheme.textTheme.overline),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            if (!isSignUp)
                                              Container(
                                                height: 4,
                                                width: 50,
                                                decoration: BoxDecoration(
                                                    color: appCubit.isDark
                                                        ? darkTheme.primaryColorLight
                                                        : lightTheme.primaryColorDark,
                                                    borderRadius:
                                                    BorderRadius.circular(30)),
                                              )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                if (!isSignUp) buildSignInSection(context),
                                if (isSignUp) buildSignUpSection(context),
                              ],
                            ),
                          ),
                        )),
                    // add the submit button
                    if (isSignUp)
                      buildBottomHalfContainer(
                          showShadow: false,
                          onPressed: () async {
                            if (formKey.currentState.validate()) {
                              registerForm();
                            }
                          },
                          icon: Icons.login_rounded)
                    else
                      buildBottomHalfContainer(
                          showShadow: false,
                          icon: Icons.login_rounded,
                          onPressed: () async {
                            if (formKey.currentState.validate()) {
                              var result = loginForm();
                              CashedHelper.saveData(key: 'email', value: '${emailController.text}');
                              print(result);
                            }
                          }),
                    // login with social
                    AnimatedPositioned(
                        duration: Duration(milliseconds: 750),
                        curve: Curves.easeInCubic,
                        top: isSignUp
                            ? height - 200
                            : height - 200,
                        left: 0,
                        right: 0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "عالجني هو ابليكشن يساعدك للوصول لاقرب مستشفي او طبيب",
                              style: AppCubit.get(context).isDark
                                  ? darkTheme.textTheme.subtitle1
                                  : lightTheme.textTheme.subtitle1,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                            Text(
                              isSignUp ? "أو التسجيل بواسطة" : "أو الدخول بواسطة",
                              style: AppCubit.get(context).isDark
                                  ? darkTheme.textTheme.headline3
                                  : lightTheme.textTheme.headline3,
                              textAlign: TextAlign.center,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: width*0.002, right: width*0.002, top: height*.02),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  buildTextButton(MaterialCommunityIcons.facebook,
                                      "Facebook", Palette.facebookColor),
                                  buildTextButton(MaterialCommunityIcons.google_plus,
                                      "Google", Palette.googleColor),
                                ],
                              ),
                            ),
                          ],
                        ))
                  ],
                ),
              ),
            );
          },
        );
      }

      return BlocConsumer<AppCubit, AppStates>(
        listener: (context, states) => {},
        builder: (context, states) {
          var appCubit = AppCubit.get(context);
          return SafeArea(
            child: Scaffold(
              backgroundColor: AppCubit.get(context).isDark
                  ? darkTheme.scaffoldBackgroundColor
                  : lightTheme.scaffoldBackgroundColor,
              body: Stack(
                children: [
                  // background image
                  Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 300,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/images/background.jpg"),
                                fit: BoxFit.fill)),
                        child: Container(
                          padding: EdgeInsets.only(top: 70, right: 30),
                          color: AppCubit.get(context).isDark
                              ? darkTheme.primaryColorDark.withOpacity(0.7)
                              : lightTheme.primaryColorLight.withOpacity(0.7),
                          // color: Color(0xff3b5999).withOpacity(0.7),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              RichText(
                                text: TextSpan(
                                    text: "مرحباً بك في ",
                                    style: appCubit.isDark?darkTheme.textTheme.overline
                                        :lightTheme.textTheme.overline,
                                    children: [
                                      TextSpan(
                                        text: "عالجني",
                                        style: appCubit.isDark?darkTheme.textTheme.bodyText1.copyWith(
                                            fontSize: 40
                                        )
                                            :lightTheme.textTheme.bodyText1.copyWith(
                                            fontSize: 40
                                        ),
                                      )
                                    ]),
                              ),
                              SizedBox(
                                height: 14,
                              ),
                              Text(
                                "يرجي تسجيل الدخول حتي تتمكن من التصفح",
                                style: appCubit.isDark?darkTheme.textTheme.overline
                                    :lightTheme.textTheme.overline.copyWith(
                                    color: Color(0xff4C4C6D).withOpacity(0.7)
                                ),)
                            ],
                          ),
                        ),
                      )),
                  // add the shadow to submit button
                  buildBottomHalfContainer(showShadow: true),
                  // form to sign in or sign up
                  AnimatedPositioned(
                      duration: Duration(milliseconds: 750),
                      curve: Curves.easeInCubic,
                      top: isSignUp ? 200 : 250,
                      child: AnimatedContainer(
                        height: isSignUp ? 360 : 300,
                        width: MediaQuery.of(context).size.width - 40,
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                            color: appCubit.isDark
                                ? darkTheme.primaryColorDark.withOpacity(1)
                                : lightTheme.primaryColorLight,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  spreadRadius: 5,
                                  offset: Offset(1, 4),
                                  blurRadius: 20)
                            ]),
                        duration: Duration(milliseconds: 750),
                        curve: Curves.easeInCubic,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 16),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isSignUp = true;
                                        });
                                      },
                                      child: Column(
                                        children: [
                                          Text(" إنشاء حساب جديد",
                                              style: appCubit.isDark
                                                  ? darkTheme.textTheme.overline
                                                  : lightTheme.textTheme.overline),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          if (isSignUp)
                                            Container(
                                              height: 4,
                                              width: 50,
                                              decoration: BoxDecoration(
                                                  color: appCubit.isDark
                                                      ? darkTheme.primaryColorLight
                                                      : lightTheme.primaryColorDark,
                                                  borderRadius:
                                                  BorderRadius.circular(30)),
                                            )
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isSignUp = false;
                                        });
                                      },
                                      child: Column(
                                        children: [
                                          Text("تسجيل الدخول",
                                              style: appCubit.isDark
                                                  ? darkTheme.textTheme.overline
                                                  : lightTheme.textTheme.overline),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          if (!isSignUp)
                                            Container(
                                              height: 4,
                                              width: 50,
                                              decoration: BoxDecoration(
                                                  color: appCubit.isDark
                                                      ? darkTheme.primaryColorLight
                                                      : lightTheme.primaryColorDark,
                                                  borderRadius:
                                                  BorderRadius.circular(30)),
                                            )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              if (!isSignUp) buildSignInSection(context),
                              if (isSignUp) buildSignUpSection(context),
                            ],
                          ),
                        ),
                      )),
                  // add the submit button
                  if (isSignUp)
                    buildBottomHalfContainer(
                        showShadow: false,
                        onPressed: () async {
                          if (formKey.currentState.validate()) {
                            registerForm();
                          }
                        },
                        icon: Icons.login_rounded)
                  else
                    buildBottomHalfContainer(
                        showShadow: false,
                        icon: Icons.login_rounded,
                        onPressed: () async {
                          if (formKey.currentState.validate()) {
                            var result = loginForm();
                            print(result);
                          }
                        }),
                  // login with social
                  AnimatedPositioned(
                      duration: Duration(milliseconds: 750),
                      curve: Curves.easeInCubic,
                      top: isSignUp
                          ? MediaQuery.of(context).size.height - 200
                          : MediaQuery.of(context).size.height - 200,
                      left: 0,
                      right: 0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "عالجني هو ابليكشن يساعدك للوصول لاقرب مستشفي او طبيب",
                            style: AppCubit.get(context).isDark
                                ? darkTheme.textTheme.subtitle1
                                : lightTheme.textTheme.subtitle1,
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                          Text(
                            isSignUp ? "أو التسجيل بواسطة" : "أو الدخول بواسطة",
                            style: TextStyle(
                                color: AppCubit.get(context).isDark
                                    ? darkTheme.primaryColorLight
                                    : lightTheme.primaryColorDark,
                                fontSize: 18,
                                letterSpacing: 2,
                                fontFamily: "ElMessiri-Regular"),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 30, right: 30, top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                buildTextButton(MaterialCommunityIcons.facebook,
                                    "Facebook", Palette.facebookColor),
                                buildTextButton(MaterialCommunityIcons.google_plus,
                                    "Google", Palette.googleColor),
                              ],
                            ),
                          ),
                        ],
                      ))
                ],
              ),
            ),
          );
        },
      );
    },
  );
  }

  Container buildSignUpSection(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16, left: 30, right: 30, bottom: 40),
      child: Form(
        key: formKey,
        child: Column(
          children: [
// name
            defaultTextFormField(
                context: context,
                controller: nameController,
                hintText: "الاسم",
                suffixIconColor: Color(0xfffd556d),
                keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,

              suffixIcon: Icons.person,
                // validator: Validator.validateName
            ),
// phone
            defaultTextFormField(
                context: context,
                controller: phoneController,
                hintText: "رقم الهاتف",
                suffixIconColor: Color(0xfffd556d),
                keyboardType: TextInputType.phone,
                suffixIcon: Icons.phone_enabled,
              textInputAction: TextInputAction.next,

              onSubmitted: (value){
                _phoneFocusNode.requestFocus();
              },
                // validator:Validator.validatePhoneNumber
            ),
// email
            defaultTextFormField(
                context: context,
                controller: emailRegisteredController,
                hintText: "البريد الالكتروني",
                suffixIconColor: Color(0xfffd556d),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                suffixIcon: Icons.alternate_email_rounded,
              onSubmitted: (value){
                _emailFocusNode.requestFocus();
              },
                // validator: Validator.validateEmail
            ),
// password
            defaultTextFormField(
                onSubmitted: (value){
                    _passwordFocusNode.requestFocus();
                },
                context: context,
                isPassword: isPassword,
                controller: passwordRegisteredController,
                hintText: "كلمة المرور",
                keyboardType: TextInputType.visiblePassword,
                prefixIcon: icon,
                prefixPressed: changePasswordVisibility,
              textInputAction: TextInputAction.done,
              suffixIcon: Icons.lock,
                suffixIconColor: Color(0xfffd556d),
                // validator: Validator.validatePassword
            ),
          ],
        ),
      ),
    );
  }

  Container buildSignInSection(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16, left: 30, right: 30, bottom: 30),
      child: Form(
        key: formKey,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
// email
            defaultTextFormField(
                context: context,
                controller: emailController,
                hintText: "البريد الالكتروني",
                suffixIconColor: AppCubit.get(context).isDark
                    ? darkTheme.scaffoldBackgroundColor
                    : lightTheme.primaryColorDark,
                keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,

              suffixIcon: Icons.alternate_email_rounded,
                // validator: Validator.validateEmail
            ),
// password
            defaultTextFormField(
                context: context,
                isPassword: isPassword,
                controller: passwordController,
                hintText: "كلمة المرور",
                keyboardType: TextInputType.visiblePassword,
                prefixIcon: icon,
                prefixPressed: changePasswordVisibility,
                suffixIcon: Icons.lock,
                suffixIconColor: Color(0xfffd556d),
              textInputAction: TextInputAction.done,

              onSubmitted: (value){
                  _passwordFocusNode.requestFocus();
                },
                // validator:Validator.validatePassword
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    navigateTo(context, ForgotPass());
                  },
                  child: Text(
                    "هل نسيت كلمة المرور؟",
                    style:  AppCubit.get(context).isDark
                        ? darkTheme.textTheme.subtitle1
                        : lightTheme.textTheme.subtitle1,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "تذكرني",
                      style: AppCubit.get(context).isDark
                          ? darkTheme.textTheme.subtitle1
                          : lightTheme.textTheme.subtitle1,
                    ),
                    Checkbox(
                        value: isRememberMe,
                        activeColor: AppCubit.get(context).isDark
                            ? Colors.white70
                            : Color(0xfffd556d),
                        checkColor: AppCubit.get(context).isDark
                            ? darkTheme.primaryColorDark
                            : lightTheme.primaryColorLight,
                        onChanged: (value) {
                          setState(() async{
                            isRememberMe = !isRememberMe;
                            SharedPreferences prefs = await SharedPreferences.getInstance();
                            prefs.setString('email', '${emailController.text}');
                            prefs.setBool('isRememberMe', true);
                          });
                        }),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildBottomHalfContainer(
      {@required bool showShadow, Function onPressed, IconData icon}) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 750),
      curve: Curves.easeInCubic,
      top: isSignUp ? MediaQuery.of(context).size.height*0.6 : MediaQuery.of(context).size.height*0.57,
      right: 0,
      left: 0,
      child: GestureDetector(
        onTap: onPressed,
        child: Center(
          child: Container(
            height: 90,
            width: 90,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: AppCubit.get(context).isDark
                    ? darkTheme.primaryColorDark
                    : lightTheme.primaryColorLight,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  if (showShadow)
                    BoxShadow(
                      color: Colors.black.withOpacity(.2),
                      spreadRadius: 1,
                      blurRadius: 6,
                    )
                ]),
            child: !showShadow
                ? Container(
                    decoration: BoxDecoration(
                        color: !AppCubit.get(context).isDark
                            ? darkTheme.primaryColorDark
                            : lightTheme.primaryColorLight,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(.3),
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset: Offset(0, 1))
                        ]),
                    child: Icon(
                      icon,
                      size: 30,
                      color: AppCubit.get(context).isDark
                          ? darkTheme.primaryColorDark
                          : lightTheme.primaryColorLight,
                    ),
                  )
                : Center(),
          ),
        ),
      ),
    );
  }

  TextButton buildTextButton(
      IconData icon, String title, Color backgroundColor) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
          minimumSize: Size(130, 40),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          primary: Colors.white,
          backgroundColor: backgroundColor),
      child: Row(
        children: [
          Icon(
            icon,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 16, fontFamily: "ElMessiri"),
          )
        ],
      ),
    );
  }
  // visible password
  IconData icon = Icons.visibility_rounded;
  bool isPassword = true;
  void changePasswordVisibility() {
    isPassword = !isPassword;
    icon = isPassword ? Icons.visibility_rounded : Icons.visibility_off_rounded;
  }

  // login
  bool loginFormLoading = false;
  Future<void> _buildAlertDialog(String error) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            elevation: 5,
            backgroundColor: AppCubit.get(context).isDark
                ? darkTheme.primaryColorDark
                : lightTheme.primaryColorLight,
            title: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('فشل تسجيل الدخول'),
                Container(
                  height: 2,
                  width: 60,
                  color: Colors.black,
                )
              ],
            )),
            titleTextStyle: AppCubit.get(context).isDark
                ? darkTheme.textTheme.caption
                : lightTheme.textTheme.caption,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            contentPadding: EdgeInsets.all(30.0),
            content: Container(
                child: Text(
              error,
                  textDirection: TextDirection.rtl,

                  style: AppCubit.get(context).isDark
                  ? darkTheme.textTheme.overline
                  : lightTheme.textTheme.overline,
            )),
            actionsPadding: EdgeInsets.symmetric(horizontal: 30),
            actions: [
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.only(
                        topStart: Radius.circular(30),
                        bottomEnd: Radius.circular(30))),
                color: !AppCubit.get(context).isDark
                    ? darkTheme.primaryColorDark
                    : lightTheme.primaryColorLight,
                elevation: 4,
                height: 20,
                minWidth: 6,
                padding: EdgeInsets.symmetric(horizontal: 26, vertical: 10),
                child: Text(
                  'غلق',
                  style: !AppCubit.get(context).isDark
                      ? darkTheme.textTheme.headline4
                          .copyWith(color: Colors.white)
                      : lightTheme.textTheme.headline4
                          .copyWith(color: Colors.black),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }
  loginForm() async {
    setState(() {
      loginFormLoading = true;
    });
    String createAccountFeedback =
        await _auth.loginUser(emailController.text, passwordController.text);
    if (createAccountFeedback != null) {
      _buildAlertDialog(createAccountFeedback);
      setState(() {
        loginFormLoading = false;
      });
    } else {
      showToast(message: "تم تسجيل الدخول بنجاح");
      // login successfully, head to homepage
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeLayout()));
    }
  }

  // register
  bool registerFormLoading = false;
  void registerForm() async {
    // set the form Loading state
    setState(() {
      registerFormLoading = true;
    });
    // create new account method runs
    String createAccountFeedback = await _auth.createNewUser(
        nameController.text,
        phoneController.text,
        emailRegisteredController.text,
        passwordRegisteredController.text,

    );
    // if the email and password not null, head to Error while creating account
    if (createAccountFeedback != null) {
      _alertdialogRegister(createAccountFeedback);
      // set the form regular state [submitted]
      setState(() {
        registerFormLoading = false;
      });
    } else {
      // the String was null, user is logged in, head back to login page
      nameController.clear();
      phoneController.clear();
      emailRegisteredController.clear();
      passwordRegisteredController.clear();
      showToast(message: "تم انشاء الحساب بنجاح");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeLayout()));
    }
  }
  Future<void> _alertdialogRegister(String error) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            elevation: 5,
            backgroundColor: AppCubit.get(context).isDark
                ? darkTheme.primaryColorDark
                : lightTheme.primaryColorLight,
            title: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('فشل انشاء الحساب'),
                Container(
                  height: 2,
                  width: 60,
                  color: Colors.black,
                )
              ],
            )),
            titleTextStyle: AppCubit.get(context).isDark
                ? darkTheme.textTheme.caption
                : lightTheme.textTheme.caption,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            content: Container(
                child: Text(
              error,
              textDirection: TextDirection.rtl,
              style: AppCubit.get(context).isDark
                  ? darkTheme.textTheme.overline
                  : lightTheme.textTheme.overline,
            )),
            actionsPadding: EdgeInsets.symmetric(horizontal: 30),
            actions: [
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.only(
                        topStart: Radius.circular(30),
                        bottomEnd: Radius.circular(30))),
                color: !AppCubit.get(context).isDark
                    ? darkTheme.primaryColorDark
                    : lightTheme.primaryColorLight,
                elevation: 4,
                height: 20,
                minWidth: 6,
                padding: EdgeInsets.symmetric(horizontal: 26, vertical: 10),
                child: Text(
                  'غلق',
                  style: !AppCubit.get(context).isDark
                      ? darkTheme.textTheme.headline4
                          .copyWith(color: Colors.white)
                      : lightTheme.textTheme.headline4
                          .copyWith(color: Colors.black),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }
}
