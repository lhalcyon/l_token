import 'package:flutter/material.dart';
import 'package:l_token/style/styles.dart';

class KeystoreImportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Column(
//      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _bodyTips(context),
        Divider(height: Dimens.line,),
        _bodyKeystore(context),
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
        style: new TextStyle(fontSize: 14.0, color:theme.primaryColor),
      ),
    );
  }

  _bodyKeystore(BuildContext context) {
    return new Container(
      color: Colors.blue,
      padding: EdgeInsets.all(16.0),
      height: 120.0,
      child: new TextField(),
    );
  }
}
