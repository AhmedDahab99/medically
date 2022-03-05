import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medically/shared/cubit/app_cubit.dart';
import 'package:medically/shared/cubit/app_states.dart';
import 'package:medically/shared/style/themes/dark_theme.dart';
import 'package:medically/shared/style/themes/light_theme.dart';

class UserProfileScreen extends StatefulWidget {
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  // File _image;
  String _uploadedFileURL;

  @override
  Widget build(BuildContext context) {
    String user = FirebaseAuth.instance.currentUser.uid;
    String documentId = user;
    CollectionReference profileInfo =
        FirebaseFirestore.instance.collection('profileInfo');
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, states) {},
      builder: (context, states) {
        AppCubit _appCubit = AppCubit.get(context);
        return Directionality(
          textDirection: TextDirection.rtl,
          child: FutureBuilder<DocumentSnapshot>(
            future: profileInfo.doc(documentId).get(),
            builder: (BuildContext context,
                AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text("Something went wrong");
              }
              // !snapshot.data!.exists
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasData) {
                if (snapshot.connectionState == ConnectionState.done) {
                  // Map<String, dynamic> data = snapshot.data.data() as Map<String, dynamic>;
                  // return Center(child: Text('Name: ${snapshot.data['name']}'));
                  return Scaffold(
                    body: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              height: MediaQuery.of(context).size.height * 0.23,
                              decoration: BoxDecoration(
                                color: _appCubit.isDark
                                    ? darkTheme.primaryColorLight
                                    : lightTheme.primaryColorDark,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image(
                                  height:
                                      MediaQuery.of(context).size.height * 0.18,
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  image: NetworkImage(
                                      '${snapshot.data['imageUrl']}'),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Center(
                                child: Column(
                              children: [
                                Text(
                                  '${snapshot.data['name']}',
                                  style: _appCubit.isDark
                                      ? darkTheme.textTheme.bodyText1
                                      : lightTheme.textTheme.bodyText1,
                                ),
                                Text(
                                  '${snapshot.data['job']}',
                                  style: _appCubit.isDark
                                      ? darkTheme.textTheme.overline.copyWith(
                                          color: Colors.white.withOpacity(0.7))
                                      : lightTheme.textTheme.overline.copyWith(
                                          color: Color(0xff4C4C6D)
                                              .withOpacity(0.7)),
                                ),
                              ],
                            )),
                            buildDivider(_appCubit),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      'رقم الهاتف',
                                      style: _appCubit.isDark
                                          ? darkTheme.textTheme.overline
                                              .copyWith(
                                                  color: Colors.white
                                                      .withOpacity(0.7))
                                          : lightTheme.textTheme.overline
                                              .copyWith(
                                                  color: Color(0xff4C4C6D)
                                                      .withOpacity(0.7)),
                                    ),
                                    Text('${snapshot.data['phone']}'),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'العنوان',
                                      style: _appCubit.isDark
                                          ? darkTheme.textTheme.overline
                                              .copyWith(
                                                  color: Colors.white
                                                      .withOpacity(0.7))
                                          : lightTheme.textTheme.overline
                                              .copyWith(
                                                  color: Color(0xff4C4C6D)
                                                      .withOpacity(0.7)),
                                    ),
                                    Text('${snapshot.data['address']}'),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'العمر',
                                      style: _appCubit.isDark
                                          ? darkTheme.textTheme.overline
                                              .copyWith(
                                                  color: Colors.white
                                                      .withOpacity(0.7))
                                          : lightTheme.textTheme.overline
                                              .copyWith(
                                                  color: Color(0xff4C4C6D)
                                                      .withOpacity(0.7)),
                                    ),
                                    Text('${snapshot.data['age']}'),
                                  ],
                                ),
                              ],
                            ),
                            buildDivider(_appCubit),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),

                            // email
                            Text(
                              'البريد الالكتروني',
                              style: _appCubit.isDark
                                  ? darkTheme.textTheme.overline.copyWith(
                                      color: Colors.white.withOpacity(0.7))
                                  : lightTheme.textTheme.overline.copyWith(
                                      color:
                                          Color(0xff4C4C6D).withOpacity(0.7)),
                            ),
                            Text('${snapshot.data['email']}'),

                            // button
                            buildDivider(_appCubit),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.15,
                            ),
                            // MaterialButton(
                            //   onPressed: () {
                            //     // navigateTo(context, UpdateUserData());
                            //   },
                            //   shape: RoundedRectangleBorder(
                            //       borderRadius: BorderRadius.circular(50)),
                            //   child: Text(
                            //     'تعديل بيانات حسابك',
                            //     style: !_appCubit.isDark
                            //         ? darkTheme.textTheme.headline1
                            //         : lightTheme.textTheme.headline1,
                            //   ),
                            //   color: _appCubit.isDark
                            //       ? darkTheme.primaryColorLight
                            //       : lightTheme.primaryColorDark,
                            // )
                          ],
                        ),
                      ),
                    ),
                  );
                }
              }

              return Center(child: CircularProgressIndicator());
            },
          ),
        );
      },
    );
  }

  Divider buildDivider(AppCubit _appCubit) {
    return Divider(
      color: _appCubit.isDark
          ? darkTheme.primaryColorLight
          : lightTheme.primaryColorDark,
      height: 2,
      indent: 15.0,
      endIndent: 15.0,
    );
  }
}
