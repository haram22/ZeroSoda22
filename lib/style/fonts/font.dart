import 'package:flutter/material.dart';
//import 'package:flutter_screenutil/flutter_screenutil.dart';
//screenutil 사용해서 화면별 크기 통일

TextStyle titleStyle({bool responsible = false, double? height, Color? color}) {
  return TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      fontFamily: 'bold',
      color: color,
      height: height);
}

TextStyle subtitleStyle(
    {bool responsible = false, double? height, Color? color}) {
  return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      fontFamily: 'medium',
      color: color,
      height: height);
}

TextStyle buttonStyle(
    {bool responsible = false, double? height, Color? color}) {
  return TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      fontFamily: 'medium',
      color: color,
      height: height);
}

TextStyle bannerStyle(
    {bool responsible = false, double? height, Color? color}) {
  return TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      fontFamily: 'medium',
      color: color,
      height: height);
}

TextStyle smallTextStyle(
    {bool responsible = false, double? height, Color? color}) {
  return TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w700,
      fontFamily: 'bold',
      color: color,
      height: height);
}

TextStyle captionStyle(
    {bool responsible = false, double? height, Color? color}) {
  return TextStyle(
      fontSize: 9,
      fontWeight: FontWeight.w500,
      fontFamily: 'medium',
      color: color,
      height: height);
}

// TextStyle heading5style(
//     {bool responsible = false, double? height, Color? color}) {
//   return TextStyle(
//       fontSize: responsible ? 22.p : 22,
//       fontWeight: FontWeight.w600,
//       fontFamily: 'Main',
//       color: color,
//       height: height);
// }
