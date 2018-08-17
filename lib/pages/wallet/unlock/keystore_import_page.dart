import 'package:flutter/material.dart';
import 'package:l_token/pages/wallet_page.dart';
import 'package:l_token/style/styles.dart';
import 'package:l_token/view/edu_tips_widget.dart';
import 'package:l_token/view/password_inputfield.dart';

class KeystoreImportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return new Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize:  MainAxisSize.max,
      children: <Widget>[
        _bodyTips(context),
        Divider(
          height: Dimens.line,
        ),
        _bodyKeystore(context),
        _bodyPassword(context),
        new Container(
          height: 45.0,
          margin: EdgeInsets.only(top: Dimens.divider),
          width: deviceWidth - Dimens.padding * 2,
          child: new RaisedButton(onPressed: (){
            Navigator.of(context).popUntil(ModalRoute.withName('/'));
          },child: new Text('Start Importing'),),
        ),
        new Expanded(child: new Container()),
        new EduTipsWidget(title: 'What is Keystore')
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
    final ThemeData theme = Theme.of(context);
    return new Container(
      margin: EdgeInsets.symmetric(horizontal: Dimens.padding, vertical: 0.0),
      child: new Theme(
        data: theme.copyWith(primaryColor: theme.dividerColor),
        child: new PasswordField(
          labelText: 'Wallet Password',
          onFieldSubmitted: (String value) {},
        ),
      ),
    );
  }

  _bodySupportTips(BuildContext context) {

  }

//new TextField(
//  decoration: new InputDecoration(hintText: 'Keystore content',border: InputBorder.none),

//  ),
}
