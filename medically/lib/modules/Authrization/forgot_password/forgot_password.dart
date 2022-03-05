// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:medically/modules/Authrization/Login/login_register.dart';
// import 'package:medically/shared/componnet/component.dart';
//
// class ForgotPass extends StatefulWidget {
//   @override
//   _ForgotPassState createState() => _ForgotPassState();
// }
//
// class _ForgotPassState extends State<ForgotPass> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   TextEditingController emailController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   title: Text(
//       //     'corona',
//       //     style: TextStyle(
//       //       fontWeight: FontWeight.bold,
//       //       fontSize: 30,
//       //       letterSpacing: 5,
//       //       color: Colors.grey[350],
//       //     ),
//       //   ),
//       //   centerTitle: true,
//       //   backgroundColor: Colors.blue,
//       //   elevation: 10.0,
//       //   bottom: PreferredSize(
//       //     preferredSize: Size.fromHeight(40),
//       //     child: SizedBox(),
//       //   ),
//       //   shape: RoundedRectangleBorder(
//       //     borderRadius: BorderRadius.only(
//       //       bottomLeft: Radius.circular(50),
//       //       bottomRight: Radius.circular(50),
//       //     ),
//       //   ),
//       // ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(top: 70, right: 30, left: 30),
//               child: Form(
//                   key: _formKey,
//                   child: Column(
//                     children: [
//                       Text(
//                         'To reset your password enter your email',
//                         style: TextStyle(
//                             color: Colors.redAccent,
//                             fontSize: 30,
//                             fontWeight: FontWeight.bold),
//                         textAlign: TextAlign.center,
//                       ),
//                       SizedBox(
//                         height: 50,
//                       ),
//                       defaultTextFormField(
//                           context: context,
//                           controller: emailController,
//                           hintText: "البريد الالكتروني",
//                           suffixIconColor: Color(0xfffd556d),
//                           keyboardType: TextInputType.emailAddress,
//                           suffixIcon: Icons.alternate_email_rounded,
//                           validator: (String value) {
//                             if (value.isEmpty) {
//                               return "من فضلك ادخل البريد الالكتروني";
//                             }
//                           }),
//                       SizedBox(
//                         height: 250,
//                       ),
//                       Container(
//                         child: Column(
//                           children: [
//                             // defaultButton(
//                             //     onPressedFun:  () async {
//                             //       if (_formKey.currentState.validate()) {
//                             //         FirebaseAuth.instance
//                             //             .sendPasswordResetEmail(
//                             //             email: emailController.text)
//                             //             .then((value) => print('Check your mails'));
//                             //       }
//                             //     },
//                             //     labelText: 'Continue',
//                             //   labelColor: Colors.black
//                             // ),
//                             RaisedButton(
//                               onPressed: () async {
//                                 if (_formKey.currentState.validate()) {
//                                   FirebaseAuth.instance
//                                       .sendPasswordResetEmail(
//                                           email: emailController.text)
//                                       .then((value) => print("check emails"));
//                                 }
//                               },
//                               color: Colors.blue,
//                               elevation: 5,
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(100)),
//                               padding: EdgeInsets.symmetric(
//                                   vertical: 23, horizontal: 105),
//                               child: Text(
//                                 'Continue',
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold,
//                                   letterSpacing: 5,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         height: 30,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             'Do not have an account? ',
//                             style: TextStyle(
//                               color: Colors.blue,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 20,
//                             ),
//                           ),
//                           GestureDetector(
//                               onTap: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) => LoginRegisterScreen(),
//                                   ),
//                                 );
//                               },
//                               child: Text(
//                                 ' Sign Up',
//                                 style: TextStyle(
//                                   color: Colors.redAccent,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 20,
//                                 ),
//                               )),
//                         ],
//                       ),
//                     ],
//                   )),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medically/modules/Authrization/Login/login_register.dart';
import 'package:medically/shared/componnet/component.dart';
import 'package:medically/shared/cubit/app_cubit.dart';
import 'package:medically/shared/cubit/app_states.dart';
import 'package:medically/shared/style/themes/dark_theme.dart';
import 'package:medically/shared/style/themes/light_theme.dart';
import 'package:url_launcher/url_launcher.dart';



class ForgotPass extends StatefulWidget {
  @override
  _ForgotPassState createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl, child:  BlocConsumer<AppCubit,AppStates>(
      listener: (context,states){},
      builder: (context , states){
        AppCubit appCubit =AppCubit.get(context);
        return SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Form(
                      key: _formKey,
                      child: Padding(
                        padding:  EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width*0.09,
                            vertical: MediaQuery.of(context).size.height*0.25),
                        child: Column(
                          children: [
                            Text('ادخل البريد الالكتروني الخاص بك لتعيين كلمة مرور جديدة',
                              style:appCubit.isDark?darkTheme.textTheme.headline2:lightTheme.textTheme.headline2,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height:MediaQuery.of(context).size.height*0.05,),
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
                            SizedBox(height:MediaQuery.of(context).size.height*0.04,),
                            // button reset password
                            defaultButton(
                              onPressedFun: (){
                                if(_formKey.currentState.validate()){
                                  sendPasswordResetEmail(emailController.text)
                                      .then((value) => print('check mail')).onError((error, stackTrace) =>
                                      print('erorrrrrr'));
                                }
                                _buildAlertDialog();
                              },
                              labelText: "إرسال ",
                              labelStyle: !appCubit.isDark?darkTheme.textTheme.headline3:lightTheme.textTheme.headline3,
                              width: MediaQuery.of(context).size.width*0.8,
                              radius: BorderRadius.circular(100),
                              backgroundColor: AppCubit.get(context).isDark
                                  ? darkTheme.scaffoldBackgroundColor
                                  : lightTheme.primaryColorDark,
                            ),
                            SizedBox(height:MediaQuery.of(context).size.height*0.35,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('هل ليس لديك حساب ؟',
                                  style: appCubit.isDark?darkTheme.textTheme.headline3.copyWith(
                                      color: Colors.white.withOpacity(0.6)
                                  )
                                      :lightTheme.textTheme.headline3.copyWith(
                                      color:Color(0xff4C4C6D).withOpacity(0.6)
                                  ),
                                ),
                                SizedBox(width: 8),
                                GestureDetector(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginRegisterScreen(),),);
                                    },
                                    child: Text('انشاء حساب جديد',
                                      style: appCubit.isDark?darkTheme.textTheme.headline3
                                          :lightTheme.textTheme.headline3
                                    )
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ));
  }
  Future<void> sendPasswordResetEmail(String email) async{
    return FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }
  Future<void> _buildAlertDialog() async {
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
                    Text('تعيين كلمة مرور جديدة'),
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
                child: GestureDetector(
                  onTap: (){
                    launch("https://mail.google.com/mail/");
                  },
                  child: Text(
                    "افتح الجيميل الخاص بك",
                    textDirection: TextDirection.rtl,

                    style: AppCubit.get(context).isDark
                        ? darkTheme.textTheme.overline
                        : lightTheme.textTheme.overline,
                  ),
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
                  navigateTo(context, LoginRegisterScreen());
                },
              ),
            ],
          );
        });
  }
}
