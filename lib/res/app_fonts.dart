/*

*Big Title
font-family: SF Pro Display;
font-size: 30px;
font-style: normal;
font-weight: 700;
line-height: 36px;
letter-spacing: 0px;
text-align: right;

*Subtitle
font-family: SF Pro Display;
font-size: 20px;
font-style: normal;
font-weight: 500;
line-height: 24px;
letter-spacing: 0px;
text-align: right;

*Header
font-family: SF Pro Text;
font-size: 16px;
font-style: normal;
font-weight: 500;
line-height: 20px;
letter-spacing: 0px;
text-align: right;

*Large body text;
font-family: SF Pro Text;
font-size: 16px;
font-style: normal;
font-weight: 400;
line-height: 20px;
letter-spacing: 0px;
text-align: right;

*Body text;
font-family: SF Pro Text;
font-size: 14px;
font-style: normal;
font-weight: 400;
line-height: 18px;
letter-spacing: 0px;
text-align: right;

*Button;
font-family: SF Pro Text;
font-size: 14px;
font-style: normal;
font-weight: 500;
line-height: 18px;
letter-spacing: 0px;
text-align: right;

*Caption;
font-family: SF Pro Text;
font-size: 12px;
font-style: normal;
font-weight: 400;
line-height: 16px;
letter-spacing: 0px;
text-align: right;

*Mini;
font-family: SF Pro Text;
font-size: 10px;
font-style: normal;
font-weight: 500;
line-height: 12px;
letter-spacing: 0px;
text-align: right;

 */

import 'package:flutter/material.dart';

class AppFonts {
  static TextStyle bigTitle({Color? textColor}) {
    return TextStyle(
        fontSize: 30,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w700,
        letterSpacing: 0,
        color: textColor);
  }

  static TextStyle subTitle({Color? textColor}) {
    return TextStyle(
        fontSize: 20,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        letterSpacing: 0,
        color: textColor);
  }

  static TextStyle header({Color? textColor}) {
    return TextStyle(
        fontSize: 16,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        letterSpacing: 0,
        color: textColor);
  }

  static TextStyle largeBodyText({Color? textColor}) {
    return TextStyle(
        fontSize: 16,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
        color: textColor);
  }

  static TextStyle bodyText({Color? textColor}) {
    return TextStyle(
        fontSize: 14,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
        color: textColor);
  }

  static TextStyle button({Color? textColor}) {
    return TextStyle(
        fontSize: 14,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        letterSpacing: 0,
        color: textColor);
  }

  static TextStyle caption({Color? textColor}) {
    return TextStyle(
        fontSize: 12,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
        color: textColor);
  }

  static TextStyle mini({Color? textColor}) {
    return TextStyle(
        fontSize: 10,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        letterSpacing: 0,
        color: textColor);
  }
}
