import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../cubit/app_cubit.dart';
import '../style/themes/dark_theme.dart';
import '../style/themes/dark_theme.dart';
import '../style/themes/light_theme.dart';
import '../style/themes/light_theme.dart';
import 'constants.dart';

Widget defaultTextFormField({@required TextEditingController controller,
  InputDecoration inputDecoration,
  @required BuildContext context,
  @required String hintText,
  TextStyle hintStyle,
  IconData prefixIcon,
  Color prefixIconColor,
  Color suffixIconColor,
  OutlineInputBorder focusOutlineInputBorder,
  OutlineInputBorder enableOutlineInputBorder,
  TextStyle inputStyle,
  TextInputAction textInputAction,
  IconData suffixIcon,
  TextInputType keyboardType,
  Function validator,
  bool isPassword = false,
  Function suffixPressed,
  Function prefixPressed,
  Function onSubmitted,
  Function onChanged,
  Function onTap,
  bool isClickable = true}) =>
    Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        // validator: validator,
        textInputAction: textInputAction,
        controller: controller,
        textAlign: TextAlign.right,
        decoration: InputDecoration(
            alignLabelWithHint: true,
            hintTextDirection: TextDirection.rtl,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide(
                color: AppCubit.get(context).isDark?Colors.white54:darkTheme.primaryColorDark.withOpacity(0.6),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide(
                color: AppCubit.get(context).isDark?Colors.white54:darkTheme.primaryColorDark.withOpacity(0.6),
              ),
            ),
            hintText: hintText,
            hintStyle: AppCubit.get(context).isDark?darkTheme.textTheme.subtitle1:lightTheme.textTheme.subtitle1,
            prefixIcon: prefixIcon != null
                ? IconButton(
                onPressed: prefixPressed,
                icon: Icon(
                  prefixIcon,
                  color: AppCubit.get(context).isDark?Colors.white:darkTheme.primaryColorDark.withOpacity(0.8),
                ))
                : null,
            suffixIcon: suffixIcon != null
                ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(
                  suffixIcon,
                  color: AppCubit.get(context).isDark?Colors.white:darkTheme.primaryColorDark.withOpacity(0.8),
                ))
                : null,
            contentPadding: EdgeInsets.all(6.0)),
        style: AppCubit.get(context).isDark?darkTheme.textTheme.caption:lightTheme.textTheme.caption,
        obscureText: isPassword ? true : false,
        keyboardType: keyboardType,
        enabled: isClickable,
        onFieldSubmitted: onSubmitted,
        onChanged: onChanged,
        onTap: onTap,
      ),
    );

Widget defaultButton({double width = double.infinity,
  double height = 45,
  Color backgroundColor = Colors.white,
  Color labelColor = Colors.black,
  BorderRadius radius,
  @required Function onPressedFun,
  @required String labelText,
  TextStyle labelStyle,
  bool isUpperCase = true}) =>
    Container(
      width: width,
      height: height,
      child: CupertinoButton(
          color: backgroundColor,
          borderRadius: radius,
          pressedOpacity: 0.8,
          child: Text(
            isUpperCase ? labelText.toUpperCase() : labelText,
            style: labelStyle,
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          onPressed: onPressedFun),
    );

Widget defaultTextButton({
  context,
  @required Function onPressed,
  @required Text labelText,
}) =>
    TextButton(
      onPressed: onPressed,
      child: labelText,
    );

void navigateTo(context, widget) =>
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => widget,
      ),
    );

void navigateAndFinish(context, widget) =>
    Navigator.pushAndRemoveUntil(
        context,
        CupertinoPageRoute(builder: (context) => widget),
            (Route<dynamic> route) => false);

Widget defaultDivider() =>
    Divider(
      height: 1,
      thickness: 2,
      color: primaryColor,
      indent: 1.0,
      endIndent: 10.0,
    );

Widget defaultSocialIcon({@required IconData socialIcon,
  @required Color backgroundColor,
  @required Color iconColor,
  @required Function onPressed}) =>
    Container(
        decoration: BoxDecoration(
            color: backgroundColor, borderRadius: BorderRadius.circular(16.0)),
        width: 40,
        height: 40,
        child: IconButton(
            onPressed: onPressed,
            icon: Icon(
              socialIcon,
              color: iconColor,
            )));

void showToast(
    {@required String message, context}) =>
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 4,
      backgroundColor: Colors.white,
      textColor: Colors.black,
      fontSize: 18.0,
    );
Widget myDivider() =>
    Divider(
      color: blueBlackColor.withOpacity(0.6),
    );

