import 'package:flutter/material.dart';
import 'package:l_token/pages/routes/routes.dart';
import 'package:l_token/style/styles.dart';
import 'package:l_token/view/password_inputfield.dart';

class WalletCreatePage extends StatelessWidget {
  static const String routeName = Routes.main + '/create';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: _appBar(context),
      backgroundColor: Colors.white,
      body: _body(context),
    );
  }

  _appBar(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return new AppBar(
      brightness: theme.brightness,
      elevation: 0.0,
      iconTheme: theme.iconTheme,
      backgroundColor: Colors.white,
    );
  }

  _body(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return new Container(
      width: double.infinity,
      child: new Column(
        children: <Widget>[
          new Padding(
            padding: EdgeInsets.only(top: 36.0, bottom: 8.0),
            child: new Icon(
              Icons.account_balance_wallet,
              size: 48.0,
              color: theme.primaryColor,
            ),
          ),
          new Text(
            'Create Identity',
            style: new TextStyle(color: theme.primaryColor, fontSize: 24.0),
          ),
          new Container(
            margin: EdgeInsets.only(
                left: Dimens.padding,
                right: Dimens.padding,
                top: Dimens.padding),
            child: new Theme(
              data: theme.copyWith(primaryColor: theme.dividerColor),
              child: new TextFormField(
                decoration: new InputDecoration(hintText: 'Identity Name'),
              ),
            ),
          ),
          new Container(
            margin: EdgeInsets.symmetric(horizontal: Dimens.padding),
            child: new Theme(
              data: theme.copyWith(primaryColor: theme.dividerColor),
              child: new PasswordField(
                labelText: 'Password',
                onFieldSubmitted: (String value) {},
              ),
            ),
          ),
          new Container(
            margin: EdgeInsets.symmetric(horizontal: Dimens.padding),
            child: new Theme(
              data: theme.copyWith(primaryColor: theme.dividerColor),
              child: new PasswordField(
                labelText: 'Repeat Password',
                onFieldSubmitted: (String value) {},
              ),
            ),
          ),
          new Padding(
            padding: EdgeInsets.only(top: 36.0,left: Dimens.padding,right: Dimens.padding),
            child: new RaisedButton(
              onPressed: () {

              },
              child: new Container(
                alignment: Alignment.center,
                height: Dimens.itemHeight,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: Dimens.padding),
                child: new Text('Create'),
              ),
            ),
          )
        ],
//        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
    );
  }
}
