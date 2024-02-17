import 'package:flutter/material.dart';

import 'app_color.dart';

class AppLightThemeData implements AppThemeData {
  @override
  ThemeData get materialThemeData => ThemeData(
        brightness: Brightness.light,
      );
  @override
  Color get inputBorderColor => AppColor.white;

  @override
  Color get primaryBackgroundColor => AppColor.primaryBlue;

  @override
  Color get primaryButtonTextColor => AppColor.white;

  @override
  Color get primaryIconColor => AppColor.primaryBlue;

  @override
  Color get primaryTextButtonColor => AppColor.yellow;

  @override
  Color get primaryTextColor => AppColor.white;

  @override
  Color get secondaryTextColor => AppColor.primaryBlue;

  @override
  Color get secondaryIconColor => AppColor.white;
}

class AppDarkThemeData implements AppThemeData {
  @override
  ThemeData get materialThemeData => ThemeData(
        brightness: Brightness.dark,
      );
  @override
  Color get inputBorderColor => AppColor.white;

  @override
  Color get primaryBackgroundColor => AppColor.primaryBlue;

  @override
  Color get primaryButtonTextColor => AppColor.white;

  @override
  Color get primaryIconColor => AppColor.primaryBlue;

  @override
  Color get primaryTextButtonColor => AppColor.yellow;

  @override
  Color get primaryTextColor => AppColor.white;

  @override
  Color get secondaryTextColor => AppColor.primaryBlue;

  @override
  Color get secondaryIconColor => AppColor.white;
}

abstract class AppThemeData {
  ThemeData get materialThemeData;

  Color get primaryBackgroundColor;

  Color get primaryButtonTextColor;

  Color get primaryTextButtonColor;

  Color get inputBorderColor;

  Color get primaryTextColor;

  Color get secondaryTextColor;

  Color get primaryIconColor;

  Color get secondaryIconColor;
}
