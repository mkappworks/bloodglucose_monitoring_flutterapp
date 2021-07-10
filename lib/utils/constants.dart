import 'package:flutter/material.dart';

//App colour constants
const kPrimaryColor = Color(0xFF3A7EBF);
const kAccentColor = Color(0xFF3ABFBE);

const kPrimaryTextColor = Color(0xFF000000);
const kSecondaryTextColor = Colors.white;
const kPrimarySubtitleTextColor = Color(0xFF50505D);
const kSecondarySubtitleTextColor = Color(0xFF6A727D);

const kBackgroundColor = Color(0xFFF8F8FF);
const kDatePickerColor = Color(0xFF8eaed6);

//App themes
const TextTheme kTextThemeDefault = TextTheme(
  headline1: TextStyle(
      color: kPrimaryTextColor, fontWeight: FontWeight.bold, fontSize: 30),
  headline2: TextStyle(
      color: kPrimaryTextColor, fontWeight: FontWeight.bold, fontSize: 20),
  headline3: TextStyle(
      color: kPrimaryTextColor, fontWeight: FontWeight.w700, fontSize: 18),
  headline4: TextStyle(
      color: kPrimaryTextColor, fontWeight: FontWeight.bold, fontSize: 16),
  headline5: TextStyle(
      color: kPrimaryTextColor, fontWeight: FontWeight.w700, fontSize: 14),
  headline6: TextStyle(
      color: kPrimaryTextColor, fontWeight: FontWeight.w700, fontSize: 12),
  subtitle1: TextStyle(
      color: kPrimarySubtitleTextColor,
      fontSize: 14,
      fontWeight: FontWeight.w400),
  subtitle2: TextStyle(
      color: kSecondarySubtitleTextColor,
      fontSize: 14,
      fontWeight: FontWeight.w400),
);

const double kMockupWidth = 428.0;
const double kMockupHeight = 926.0;

const kAppBarDecoration = LinearGradient(
  begin: Alignment.bottomLeft,
  end: Alignment.topRight,
  colors: <Color>[kPrimaryColor, kAccentColor],
  tileMode: TileMode.clamp,
);

final ButtonStyle kFlatButtonStyle = TextButton.styleFrom(
  backgroundColor: kPrimaryColor.withOpacity(0.6),
  minimumSize: Size(150, 50),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
  ),
);
