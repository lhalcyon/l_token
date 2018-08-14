

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
    errorColor: const Color(0xFFD81B60),
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
    // 状态栏白字
    brightness: Brightness.light,
    // 原色
    primaryColor: primaryColor,
    // 指示器
    indicatorColor: Colors.white30,
    // 水波纹
    splashColor: Color(0xFFE0E0E0).withOpacity(0.8),
//    splashFactory: InkRipple.splashFactory,
    // 强调
    accentColor: accentColor,
    // 画布
    canvasColor: Colors.white,
    // 脚手架背景
    scaffoldBackgroundColor: backgroundColor,
    // 背景
    backgroundColor: backgroundColor,
    // 错误
    errorColor: const Color(0xFFD81B60),
//    iconTheme: const IconThemeData(
//      color: const Color(0xFF13B9FD)
//    ),
    highlightColor: const Color(0xFF0265B9),
    // 分隔
    dividerColor: backgroundColor,
    // 按钮
    buttonColor: accentColor,
    // 提示
    hintColor: const Color(0xFFC3C7C9),
    // 禁用
    disabledColor: const Color(0xFFC3C8CC),
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

