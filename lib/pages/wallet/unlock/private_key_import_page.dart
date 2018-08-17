import 'package:flutter/material.dart';
import 'package:l_token/style/styles.dart';
import 'package:l_token/view/edu_tips_widget.dart';
import 'package:l_token/view/password_inputfield.dart';

class PrivateKeyImportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new SafeArea(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _bodyTips(context),
            Divider(
              height: Dimens.line,
            ),
            _bodyPrivateKey(context),
            _bodyPassword(context),
            _bodyRePassword(context),
            new Container(
              height: 45.0,
              margin: EdgeInsets.only(
                  top: Dimens.divider,
                  left: Dimens.padding,
                  right: Dimens.padding),
              width: double.infinity,
              child: new RaisedButton(
                onPressed: () {
                  Navigator.of(context).popUntil(ModalRoute.withName('/'));
                },
                child: new Text('Start Importing'),
              ),
            ),
            new Expanded(child: new Container()),
            new EduTipsWidget(title: 'What is Private Key')
          ],
        ));
  }

  _bodyTips(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return new Container(
      color: Color(0xFFFAFBFD),
      padding: EdgeInsets.symmetric(horizontal: Dimens.padding, vertical: 20.0),
      child: new Text(
        'Input the Private Key,or scan the QR Code generated with Private Key to import.Please attention to case sentivity',
        style: new TextStyle(fontSize: 14.0, color: theme.primaryColor),
      ),
    );
  }

  _bodyPrivateKey(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return new Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
      margin: EdgeInsets.symmetric(
          horizontal: Dimens.padding, vertical: Dimens.divider),
      height: 80.0,
      decoration: new BoxDecoration(
          border: new Border.all(color: theme.dividerColor, width: 0.38),
          borderRadius: BorderRadius.all(Radius.circular(4.0))),
      child: new TextFormField(
        decoration: new InputDecoration(
            hintText: 'Enter Private Key', border: InputBorder.none),
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

  _bodyRePassword(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return new Container(
      margin: EdgeInsets.symmetric(horizontal: Dimens.padding, vertical: 0.0),
      child: new Theme(
        data: theme.copyWith(primaryColor: theme.dividerColor),
        child: new PasswordField(
          labelText: 'Repeat Password',
          onFieldSubmitted: (String value) {},
        ),
      ),
    );
  }
}
