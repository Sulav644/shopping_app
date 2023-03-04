import 'package:flutter/material.dart';

Color cWhite = Colors.white;
Color cBlue = Colors.blue;
TextStyle textStyle({Color? color}) => TextStyle(color: color ?? cWhite);
DefaultTextStyle defaultTextStyle(
        {required Widget child, Color? color, double? fontSize}) =>
    DefaultTextStyle(
        style:
            TextStyle(color: color ?? Colors.black, fontSize: fontSize ?? 20),
        child: child);
SizedBox verticalSpacer(double height) => SizedBox(
      height: height,
    );
SizedBox horizontalSpacer(double width) => SizedBox(
      width: width,
    );
double getHeightRatio(BuildContext context, double num) =>
    MediaQuery.of(context).size.height * num;
double getWidth(BuildContext context) => MediaQuery.of(context).size.width;
double getWidthRatio(BuildContext context, double ratio) =>
    getWidth(context) * ratio;
TextStyle style({double? fontSize, FontWeight? fontWeight, Color? color}) =>
    TextStyle(
        fontSize: fontSize ?? 20,
        fontWeight: fontWeight ?? FontWeight.normal,
        color: color ?? Colors.black);
