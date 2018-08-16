import 'package:flutter/material.dart';
import 'package:l_token/style/styles.dart';

class KeystoreImportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Column(
//      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _bodyTips(context),
        Divider(
          height: Dimens.line,
        ),
        _bodyKeystore(context),
        _bodyPassword(context),
        new Container(
          height: 45.0,
          margin: EdgeInsets.symmetric(horizontal: Dimens.padding),
          child: new RaisedButton(
            onPressed: () {},
            child: null,
          ),
        ),
      ],
    );
  }

  _bodyTips(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return new Container(
      color: Color(0xFFFAFBFD),
      padding: EdgeInsets.symmetric(horizontal: Dimens.padding, vertical: 20.0),
      child: new Text(
        'Copy and paste Ethereum official wallet\'s Keystore to the input field,or scan the QR Code generated with Keystore\'s infomation to import.',
        style: new TextStyle(fontSize: 14.0, color: theme.primaryColor),
      ),
    );
  }

  _bodyKeystore(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return new Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
      margin: EdgeInsets.symmetric(
          horizontal: Dimens.padding, vertical: Dimens.divider),
      height: 120.0,
      decoration: new BoxDecoration(
          border: new Border.all(color: theme.dividerColor, width: 0.38),
          borderRadius: BorderRadius.all(Radius.circular(4.0))),
      child: new TextFormField(
        decoration: new InputDecoration(
            hintText: 'Keystore content', border: InputBorder.none),
        maxLines: 6,
      ),
    );
  }

  _bodyPassword(BuildContext context) {
    return new Container(
      margin: EdgeInsets.symmetric(horizontal: Dimens.padding, vertical: 0.0),
      child: new TextFormField(
        decoration: new InputDecoration(
            hintText: 'Wallet Password', border: InputBorder.none),
        obscureText: true,
      ),
    );
  }

//new TextField(
//  decoration: new InputDecoration(hintText: 'Keystore content',border: InputBorder.none),

//  ),
}
