import 'package:flutter/material.dart';
import 'package:l_token/model/wallet.dart';
import 'package:l_token/style/styles.dart';

class MnemonicEnsurePage extends StatelessWidget {
  final HDWallet wallet;

  MnemonicEnsurePage(this.wallet);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: _body(context),
    );
  }

  _appBar(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return new AppBar(
      brightness: theme.brightness,
      iconTheme: theme.iconTheme,
      elevation: 0.0,
      backgroundColor: Colors.white,
    );
  }

  _body(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return new Container(
      width: double.infinity,
      color: Colors.white,
      child: new Column(
        children: <Widget>[
          new Padding(
            padding: EdgeInsets.only(top: 32.0, bottom: 8.0),
            child: new Icon(
              Icons.edit,
              size: 36.0,
            ),
          ),
          new Text(
            'Backup Mnemonic Phrase',
            style: new TextStyle(
                fontSize: 20.0,
                decoration: TextDecoration.none,
                fontWeight: FontWeight.normal),
          ),
          new Padding(
            padding: EdgeInsets.only(
                top: 72.0,
                bottom: 24.0,
                left: Dimens.padding * 1.5,
                right: Dimens.padding * 1.5),
            child: new Text(
              'holder holder holder holder holder holder holder holder',
              style: TextStyle(fontSize: 14.0),
            ),
          ),
          new Container(
            padding: EdgeInsets.symmetric(horizontal: Dimens.padding,vertical: Dimens.padding),
            color: theme.backgroundColor,
            child: new Text(wallet.mnemonic),
          ),
          new Padding(
            padding: EdgeInsets.only(
                top: 36.0, left: Dimens.padding, right: Dimens.padding),
            child: new RaisedButton(
              onPressed: () {

              },
              child: new Container(
                alignment: Alignment.center,
                height: Dimens.itemHeight,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: Dimens.padding),
                child: new Text('Next'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
