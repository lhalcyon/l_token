import 'package:flutter/material.dart';
import 'package:l_token/model/wallet.dart';
import 'package:l_token/pages/routes/routes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:l_token/style/styles.dart';
import 'package:l_token/view/wallet_item_widget.dart';

class WalletManagePage extends StatelessWidget {
  static const String routeName = Routes.wallet + '/manage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBar(context), backgroundColor:Colors.white,body: new ListView(children: _body(context)));
  }

  Widget _appBar(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return new AppBar(
      brightness: theme.brightness,
      elevation: 0.0,
      backgroundColor: Colors.white,
      title: new Stack(
        children: <Widget>[
          new Container(
            alignment: Alignment.center,
            child: new InkWell(
                child: new Ink(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                  decoration: new BoxDecoration(
                      border: new Border.all(color: theme.primaryColor),
                      borderRadius: BorderRadius.circular(12.0)),
                  child: new Icon(
                    FontAwesomeIcons.angleDoubleDown,
                    size: 12.0,
                    color: theme.primaryColor,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
                borderRadius: BorderRadius.circular(12.0)),
          ),
          new Container(
            alignment: Alignment.centerLeft,
            child: new InkWell(
              child: new Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new Padding(
                    padding: EdgeInsets.symmetric(vertical: 4.0),
                    child: new Icon(
                      Icons.access_time,
                      size: 20.0,
                      color: theme.primaryColor,
                    ),
                  ),
                  new Padding(
                    padding: EdgeInsets.only(left: 2.0, top: 4.0, bottom: 4.0),
                    child: new Text(
                      'Records',
                      style:
                          TextStyle(fontSize: 12.0, color: theme.primaryColor),
                    ),
                  )
                ],
              ),
              onTap: () {
                print('go records');
              },
              borderRadius: new BorderRadius.circular(8.0),
            ),
          )
        ],
      ),
      centerTitle: false,
      automaticallyImplyLeading: false,
    );
  }

  _body(BuildContext context) {
    List<Widget> list = new List();
    list.add(_bodyLabelMain(context));
    list.add(new Divider(height: 10.0,color: Colors.transparent,));
    for (int i = 0; i < 3; i++) {
      list.add(new WalletItemWidget(new HDWallet()));
    }

    return list;
  }

  Widget _bodyLabelMain(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return new Container(
      height: 32.0,
      padding: EdgeInsets.only(left: Dimens.padding),
      color: theme.backgroundColor,
      child: new Row(
        children: <Widget>[
          new Icon(Icons.person,
              size: 20.0, color: theme.primaryColor.withOpacity(0.85)),
          new Padding(
            padding: EdgeInsets.only(left: 4.0),
            child: new Text(
              'Main Wallets',
              style: new TextStyle(fontSize: 12.0,color: theme.primaryColor.withOpacity(0.85)),
            ),
          )
        ],
      ),
    );
  }
}
