import 'package:flutter/material.dart';
import 'package:l_token/pages/main_page.dart';
import 'package:l_token/pages/market_page.dart';
import 'package:l_token/pages/profile/settings_page.dart';
import 'package:l_token/pages/profile_page.dart';
import 'package:l_token/pages/wallet_page.dart';

class Page {

  final String title;

  final IconData leadingIcon;

  final VoidCallback leadingEvent;

  final String routeName;

  final WidgetBuilder buildRoute;

  Page({
    this.title,
    this.leadingIcon, this.leadingEvent,
    @required this.routeName,
    @required this.buildRoute
  });

  @override
  String toString() {
    return 'Page{routeName: $routeName, buildRoute: $buildRoute}';
  }

}

final List<Page> kAllPages = _buildPages();

List<Page> _buildPages() {
  final List<Page> pages = <Page>[
    new Page(routeName: MarketPage.routeName, buildRoute: (BuildContext context) => new MarketPage()),
    new Page(routeName: WalletPage.routeName, buildRoute: (BuildContext context) => new WalletPage()),
    new Page(routeName: ProfilePage.routeName, buildRoute: (BuildContext context) => new ProfilePage()),
    new Page(routeName: SettingsPage.routeName, buildRoute: (BuildContext context) => new SettingsPage())
  ];
  return pages;
}