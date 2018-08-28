import 'package:flutter/material.dart';
import 'package:l_token/model/wallet.dart';
import 'package:l_token/pages/wallet/init/mnemonic_ensure_page.dart';
import 'package:l_token/style/styles.dart';

class WalletCreateResultPage extends StatelessWidget {
  final HDWallet wallet;

  WalletCreateResultPage(this.wallet);

  @override
  Widget build(BuildContext context) {
    return _body(context);
  }

  _body(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return new Theme(
        data: theme.copyWith(textTheme: theme.textTheme),
        child: new Container(
          color: Colors.white,
          child: new Column(
            children: <Widget>[
              new Padding(
                padding: EdgeInsets.only(top: 88.0, bottom: 8.0),
                child: new Icon(
                  Icons.security,
                  size: 48.0,
                ),
              ),
              new Text(
                'Backup Wallet',
                style: new TextStyle(
                    color: theme.primaryColor,
                    fontSize: 24.0,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.normal),
              ),
              new Padding(
                padding: EdgeInsets.only(
                    top: 48.0,
                    left: Dimens.padding,
                    right: Dimens.padding,
                    bottom: 12.0),
                child: new Text(
                  'Please backup our wallet diligently.lToken will not able to access accounts,recover keys,reset passwords,nor reverse transactions.Your are responsible for the security of your wallets/assets.',
                  style: new TextStyle(
                      color: theme.primaryColor,
                      fontSize: 16.0,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.normal),
                ),
              ),
              new Container(
                width: 124.0,
                height: 124.0,
                decoration: BoxDecoration(
                    color: theme.backgroundColor,
                    borderRadius: BorderRadius.all(Radius.circular(12.0))),
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Icon(
                      Icons.check,
                      color: Colors.green,
                      size: 48.0,
                    ),
                    new Text('Created',
                        style: new TextStyle(
                            color: theme.primaryColor,
                            fontSize: 22.0,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.normal)),
                  ],
                ),
              ),
              new Padding(
                padding: EdgeInsets.only(
                    top: 72.0,
                    left: Dimens.padding * 1.5,
                    right: Dimens.padding * 1.5),
                child: new Text(
                    'Please ensure that your are not being watched when executing backup',
                    style: new TextStyle(
                        color: theme.primaryColor,
                        fontSize: 14.0,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.normal)),
              ),
              new Padding(
                padding: EdgeInsets.only(
                    top: 36.0, left: Dimens.padding, right: Dimens.padding),
                child: new RaisedButton(
                  onPressed: () {
                    Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
                      return MnemonicEnsurePage(wallet);
                    }));
                  },
                  child: new Container(
                    alignment: Alignment.center,
                    height: Dimens.itemHeight,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: Dimens.padding),
                    child: new Text('Backup Mnemonic Phrase'),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
