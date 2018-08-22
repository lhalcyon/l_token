import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:l_token/pages/routes/routes.dart';
import 'package:l_token/pages/wallet/init/wallet_create_page.dart';
import 'package:l_token/style/styles.dart';

class IdentityInitPage extends StatelessWidget {
  static const String routeName = Routes.main + '/init';

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    Widget body = new Container(
      color: Colors.white,
      child: new Column(
        children: <Widget>[
          new Container(
            width: double.infinity,
            height: 240.0,
            color: Colors.blue,
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Icon(
                  FontAwesomeIcons.users,
                  size: 48.0,
                  color: Colors.white,
                ),
                new Padding(
                  padding: EdgeInsets.only(top: 12.0),
                  child: new Text(
                    'Create Your First Digital Identity\nEasy management of muti-chain wallets',
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ],
            ),
          ),
          new Padding(
            padding: EdgeInsets.only(top: 60.0),
            child: new Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: Dimens.padding * 2),
              child: new RaisedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(WalletCreatePage.routeName);
                },
                color: Colors.blue,
                child: new Container(
                  alignment: Alignment.center,
                  height: Dimens.itemHeight,
                  child: new Text('Create Identity'),
                ),
              ),
            ),
          ),
          new Padding(
            padding: EdgeInsets.symmetric(
                vertical: 12.0, horizontal: Dimens.padding * 2),
            child: new Text(
              'Multi-chain wallets will be created automatically upon identity creation',
              style: new TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 13.0,
                  color: theme.hintColor,
                  fontWeight: FontWeight.normal),
              textAlign: TextAlign.center,
            ),
          ),
          new Padding(
            padding: EdgeInsets.symmetric(
                vertical: 28.0, horizontal: Dimens.padding * 1.5),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  width: 100.0,
                  height: Dimens.line,
                  color: theme.dividerColor,
                ),
                new Text('Or',
                    style: new TextStyle(
                        fontSize: 22.0,
                        decoration: TextDecoration.none,
                        color: theme.hintColor)),
                Container(
                  width: 100.0,
                  height: Dimens.line,
                  color: theme.dividerColor,
                ),
              ],
            ),
          ),
          new Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimens.padding * 2),
            child: new FlatButton(
                onPressed: () {},
                child: new Container(
                  child: new Text('Recover Identity'),
                  alignment: Alignment.center,
                  height: Dimens.itemHeight,
                )),
          ),
          new Expanded(child: new Container()),
          new Padding(
            padding: EdgeInsets.only(bottom: Dimens.divider * 1.5),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Image.asset(
                  'assets/images/ic_logo.png',
                  width: 36.0,
                  height: 36.0,
                ),
                new Padding(
                  padding: EdgeInsets.only(left: 6.0),
                  child: new Text(
                    'lToken',
                    style: new TextStyle(
                        color: theme.primaryColor,
                        fontSize: 20.0,
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.none),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
    return new SafeArea(
      child: new Theme(
          data: theme.copyWith(backgroundColor: Colors.white,brightness: Brightness.light), child: body),
      top: false,
      bottom: false,
    );
  }
}
