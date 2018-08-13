

import 'package:flutter/material.dart';

final LTheme kDarkTheme = new LTheme(mode: ThemeMode.Dark,themeData: _buildDarkTheme());
final LTheme kLightTheme = new LTheme(mode: ThemeMode.Light,themeData: _buildLightTheme());

TextTheme _buildTextTheme(TextTheme base) {
  return base.copyWith(
    title: base.title.copyWith(
      fontFamily: 'GoogleSans',
    ),
  );
}

ThemeData _buildDarkTheme() {
  Color primaryColor = const Color(0xFFC5CAE9);
  final ThemeData base = new ThemeData.dark();
  return base.copyWith(
    brightness: Brightness.dark,
    primaryColor: primaryColor,
    buttonColor: primaryColor,
    indicatorColor: Colors.white30,
    accentColor: const Color(0xFF13B9FD),
    canvasColor: const Color(0xFF202124),
    scaffoldBackgroundColor: const Color(0xFF202124),
    backgroundColor: const Color(0xFF202124),
    errorColor: const Color(0xFFB00020),
    buttonTheme: const ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
    ),
    textTheme: _buildTextTheme(base.textTheme),
    primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildTextTheme(base.accentTextTheme),

  );
}

ThemeData _buildLightTheme() {
  const Color primaryColor = const Color(0xFF42495A);
  const backgroundColor = const Color(0XFFF7F7F7);
  const Color accentColor = const Color(0xFF266F9C);

  final ThemeData base = new ThemeData.light();
  return base.copyWith(
    brightness: Brightness.light,
    primaryColor: primaryColor,
    indicatorColor: Colors.white30,
//    splashColor: Colors.blue,
//    splashFactory: InkRipple.splashFactory,
    accentColor: accentColor,
    canvasColor: Colors.white,
    scaffoldBackgroundColor: backgroundColor,
    backgroundColor: backgroundColor,
    errorColor: accentColor,
//    iconTheme: const IconThemeData(
//      color: const Color(0xFF13B9FD)
//    ),
    buttonTheme: const ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
    ),
    textTheme: _buildTextTheme(base.textTheme),
    primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildTextTheme(base.accentTextTheme),
  );
}

enum ThemeMode {
  Dark,Light
}

class LTheme {

  final ThemeMode mode;

  final ThemeData themeData;

  LTheme({@required this.mode,@required this.themeData});

  bool isDark(){
    return this.mode == ThemeMode.Dark;
  }

//  LTheme copyWith(LTheme ){
//
//  }

  @override
  String toString() {
    return '$runtimeType($mode)($themeData)';
  }
}

